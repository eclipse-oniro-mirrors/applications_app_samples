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

import { describe, beforeAll, afterAll, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { fileIo as fs } from '@kit.CoreFileKit';
import { common } from '@kit.AbilityKit';
import { entryContext } from './shared/AppProbe';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

function writeText(path: string, text: string): void {
  const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
  fs.writeSync(file.fd, text);
  fs.closeSync(file.fd);
}

function appendText(path: string, text: string): void {
  const size: number = fs.accessSync(path) ? fs.statSync(path).size : 0;
  const file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  fs.writeSync(file.fd, text, { offset: size });
  fs.closeSync(file.fd);
}

function readText(path: string): string {
  return fs.readTextSync(path);
}

function scratchDir(): string {
  const base: string = entryContext().filesDir + '/draft_work';
  if (!fs.accessSync(base)) {
    fs.mkdirSync(base);
  }
  return base;
}

export default function draftIoMatrixTest() {
  describe('draftIoMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0001
   * @tc.name      testDraftIo0001
   * @tc.desc      Draft file keeps 1 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0001', 'draft size 1');
    const dir: string = scratchDir();
    const path: string = dir + '/size_01.txt';
    writeText(path, 'f');
    const text: string = readText(path);
    expect(text.length).assertEqual(1);
    expect(text).assertEqual('f');
    expect(fs.statSync(path).size).assertEqual(1);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0002
   * @tc.name      testDraftIo0002
   * @tc.desc      Draft file keeps 2 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0002', 'draft size 2');
    const dir: string = scratchDir();
    const path: string = dir + '/size_02.txt';
    writeText(path, 'ff');
    const text: string = readText(path);
    expect(text.length).assertEqual(2);
    expect(text).assertEqual('ff');
    expect(fs.statSync(path).size).assertEqual(2);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0003
   * @tc.name      testDraftIo0003
   * @tc.desc      Draft file keeps 3 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0003', 'draft size 3');
    const dir: string = scratchDir();
    const path: string = dir + '/size_03.txt';
    writeText(path, 'fff');
    const text: string = readText(path);
    expect(text.length).assertEqual(3);
    expect(text).assertEqual('fff');
    expect(fs.statSync(path).size).assertEqual(3);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0004
   * @tc.name      testDraftIo0004
   * @tc.desc      Draft file keeps 4 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0004', 'draft size 4');
    const dir: string = scratchDir();
    const path: string = dir + '/size_04.txt';
    writeText(path, 'ffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(4);
    expect(text).assertEqual('ffff');
    expect(fs.statSync(path).size).assertEqual(4);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0005
   * @tc.name      testDraftIo0005
   * @tc.desc      Draft file keeps 5 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0005', 'draft size 5');
    const dir: string = scratchDir();
    const path: string = dir + '/size_05.txt';
    writeText(path, 'fffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(5);
    expect(text).assertEqual('fffff');
    expect(fs.statSync(path).size).assertEqual(5);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0006
   * @tc.name      testDraftIo0006
   * @tc.desc      Draft file keeps 6 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0006', 'draft size 6');
    const dir: string = scratchDir();
    const path: string = dir + '/size_06.txt';
    writeText(path, 'ffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(6);
    expect(text).assertEqual('ffffff');
    expect(fs.statSync(path).size).assertEqual(6);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0007
   * @tc.name      testDraftIo0007
   * @tc.desc      Draft file keeps 7 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0007', 'draft size 7');
    const dir: string = scratchDir();
    const path: string = dir + '/size_07.txt';
    writeText(path, 'fffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(7);
    expect(text).assertEqual('fffffff');
    expect(fs.statSync(path).size).assertEqual(7);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0008
   * @tc.name      testDraftIo0008
   * @tc.desc      Draft file keeps 8 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0008', 'draft size 8');
    const dir: string = scratchDir();
    const path: string = dir + '/size_08.txt';
    writeText(path, 'ffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(8);
    expect(text).assertEqual('ffffffff');
    expect(fs.statSync(path).size).assertEqual(8);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0009
   * @tc.name      testDraftIo0009
   * @tc.desc      Draft file keeps 9 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0009', 'draft size 9');
    const dir: string = scratchDir();
    const path: string = dir + '/size_09.txt';
    writeText(path, 'fffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(9);
    expect(text).assertEqual('fffffffff');
    expect(fs.statSync(path).size).assertEqual(9);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0010
   * @tc.name      testDraftIo0010
   * @tc.desc      Draft file keeps 10 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0010', 'draft size 10');
    const dir: string = scratchDir();
    const path: string = dir + '/size_10.txt';
    writeText(path, 'ffffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(10);
    expect(text).assertEqual('ffffffffff');
    expect(fs.statSync(path).size).assertEqual(10);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0011
   * @tc.name      testDraftIo0011
   * @tc.desc      Draft file keeps 11 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0011', 'draft size 11');
    const dir: string = scratchDir();
    const path: string = dir + '/size_11.txt';
    writeText(path, 'fffffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(11);
    expect(text).assertEqual('fffffffffff');
    expect(fs.statSync(path).size).assertEqual(11);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0012
   * @tc.name      testDraftIo0012
   * @tc.desc      Draft file keeps 12 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0012', 'draft size 12');
    const dir: string = scratchDir();
    const path: string = dir + '/size_12.txt';
    writeText(path, 'ffffffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(12);
    expect(text).assertEqual('ffffffffffff');
    expect(fs.statSync(path).size).assertEqual(12);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0013
   * @tc.name      testDraftIo0013
   * @tc.desc      Draft file keeps 13 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0013', 'draft size 13');
    const dir: string = scratchDir();
    const path: string = dir + '/size_13.txt';
    writeText(path, 'fffffffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(13);
    expect(text).assertEqual('fffffffffffff');
    expect(fs.statSync(path).size).assertEqual(13);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0014
   * @tc.name      testDraftIo0014
   * @tc.desc      Draft file keeps 14 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0014', 'draft size 14');
    const dir: string = scratchDir();
    const path: string = dir + '/size_14.txt';
    writeText(path, 'ffffffffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(14);
    expect(text).assertEqual('ffffffffffffff');
    expect(fs.statSync(path).size).assertEqual(14);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0015
   * @tc.name      testDraftIo0015
   * @tc.desc      Draft file keeps 15 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0015', 'draft size 15');
    const dir: string = scratchDir();
    const path: string = dir + '/size_15.txt';
    writeText(path, 'fffffffffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(15);
    expect(text).assertEqual('fffffffffffffff');
    expect(fs.statSync(path).size).assertEqual(15);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0016
   * @tc.name      testDraftIo0016
   * @tc.desc      Draft file keeps 16 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0016', 'draft size 16');
    const dir: string = scratchDir();
    const path: string = dir + '/size_16.txt';
    writeText(path, 'ffffffffffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(16);
    expect(text).assertEqual('ffffffffffffffff');
    expect(fs.statSync(path).size).assertEqual(16);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0017
   * @tc.name      testDraftIo0017
   * @tc.desc      Draft file keeps 17 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0017', 'draft size 17');
    const dir: string = scratchDir();
    const path: string = dir + '/size_17.txt';
    writeText(path, 'fffffffffffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(17);
    expect(text).assertEqual('fffffffffffffffff');
    expect(fs.statSync(path).size).assertEqual(17);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0018
   * @tc.name      testDraftIo0018
   * @tc.desc      Draft file keeps 18 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0018', 'draft size 18');
    const dir: string = scratchDir();
    const path: string = dir + '/size_18.txt';
    writeText(path, 'ffffffffffffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(18);
    expect(text).assertEqual('ffffffffffffffffff');
    expect(fs.statSync(path).size).assertEqual(18);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0019
   * @tc.name      testDraftIo0019
   * @tc.desc      Draft file keeps 19 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0019', 'draft size 19');
    const dir: string = scratchDir();
    const path: string = dir + '/size_19.txt';
    writeText(path, 'fffffffffffffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(19);
    expect(text).assertEqual('fffffffffffffffffff');
    expect(fs.statSync(path).size).assertEqual(19);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0020
   * @tc.name      testDraftIo0020
   * @tc.desc      Draft file keeps 20 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0020', 'draft size 20');
    const dir: string = scratchDir();
    const path: string = dir + '/size_20.txt';
    writeText(path, 'ffffffffffffffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(20);
    expect(text).assertEqual('ffffffffffffffffffff');
    expect(fs.statSync(path).size).assertEqual(20);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0021
   * @tc.name      testDraftIo0021
   * @tc.desc      Draft file keeps 21 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0021', 'draft size 21');
    const dir: string = scratchDir();
    const path: string = dir + '/size_21.txt';
    writeText(path, 'fffffffffffffffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(21);
    expect(text).assertEqual('fffffffffffffffffffff');
    expect(fs.statSync(path).size).assertEqual(21);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0022
   * @tc.name      testDraftIo0022
   * @tc.desc      Draft file keeps 22 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0022', 'draft size 22');
    const dir: string = scratchDir();
    const path: string = dir + '/size_22.txt';
    writeText(path, 'ffffffffffffffffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(22);
    expect(text).assertEqual('ffffffffffffffffffffff');
    expect(fs.statSync(path).size).assertEqual(22);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0023
   * @tc.name      testDraftIo0023
   * @tc.desc      Draft file keeps 23 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0023', 'draft size 23');
    const dir: string = scratchDir();
    const path: string = dir + '/size_23.txt';
    writeText(path, 'fffffffffffffffffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(23);
    expect(text).assertEqual('fffffffffffffffffffffff');
    expect(fs.statSync(path).size).assertEqual(23);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0024
   * @tc.name      testDraftIo0024
   * @tc.desc      Draft file keeps 24 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0024', 'draft size 24');
    const dir: string = scratchDir();
    const path: string = dir + '/size_24.txt';
    writeText(path, 'ffffffffffffffffffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(24);
    expect(text).assertEqual('ffffffffffffffffffffffff');
    expect(fs.statSync(path).size).assertEqual(24);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0025
   * @tc.name      testDraftIo0025
   * @tc.desc      Draft file keeps 25 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0025', 'draft size 25');
    const dir: string = scratchDir();
    const path: string = dir + '/size_25.txt';
    writeText(path, 'fffffffffffffffffffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(25);
    expect(text).assertEqual('fffffffffffffffffffffffff');
    expect(fs.statSync(path).size).assertEqual(25);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0026
   * @tc.name      testDraftIo0026
   * @tc.desc      Draft file keeps 26 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0026', 'draft size 26');
    const dir: string = scratchDir();
    const path: string = dir + '/size_26.txt';
    writeText(path, 'ffffffffffffffffffffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(26);
    expect(text).assertEqual('ffffffffffffffffffffffffff');
    expect(fs.statSync(path).size).assertEqual(26);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0027
   * @tc.name      testDraftIo0027
   * @tc.desc      Draft file keeps 27 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0027', 'draft size 27');
    const dir: string = scratchDir();
    const path: string = dir + '/size_27.txt';
    writeText(path, 'fffffffffffffffffffffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(27);
    expect(text).assertEqual('fffffffffffffffffffffffffff');
    expect(fs.statSync(path).size).assertEqual(27);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0028
   * @tc.name      testDraftIo0028
   * @tc.desc      Draft file keeps 28 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0028', 'draft size 28');
    const dir: string = scratchDir();
    const path: string = dir + '/size_28.txt';
    writeText(path, 'ffffffffffffffffffffffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(28);
    expect(text).assertEqual('ffffffffffffffffffffffffffff');
    expect(fs.statSync(path).size).assertEqual(28);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0029
   * @tc.name      testDraftIo0029
   * @tc.desc      Draft file keeps 29 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0029', 'draft size 29');
    const dir: string = scratchDir();
    const path: string = dir + '/size_29.txt';
    writeText(path, 'fffffffffffffffffffffffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(29);
    expect(text).assertEqual('fffffffffffffffffffffffffffff');
    expect(fs.statSync(path).size).assertEqual(29);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0030
   * @tc.name      testDraftIo0030
   * @tc.desc      Draft file keeps 30 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0030', 'draft size 30');
    const dir: string = scratchDir();
    const path: string = dir + '/size_30.txt';
    writeText(path, 'ffffffffffffffffffffffffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(30);
    expect(text).assertEqual('ffffffffffffffffffffffffffffff');
    expect(fs.statSync(path).size).assertEqual(30);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0031
   * @tc.name      testDraftIo0031
   * @tc.desc      Draft file keeps 31 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0031', 'draft size 31');
    const dir: string = scratchDir();
    const path: string = dir + '/size_31.txt';
    writeText(path, 'fffffffffffffffffffffffffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(31);
    expect(text).assertEqual('fffffffffffffffffffffffffffffff');
    expect(fs.statSync(path).size).assertEqual(31);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0032
   * @tc.name      testDraftIo0032
   * @tc.desc      Draft file keeps 32 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0032', 'draft size 32');
    const dir: string = scratchDir();
    const path: string = dir + '/size_32.txt';
    writeText(path, 'ffffffffffffffffffffffffffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(32);
    expect(text).assertEqual('ffffffffffffffffffffffffffffffff');
    expect(fs.statSync(path).size).assertEqual(32);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0033
   * @tc.name      testDraftIo0033
   * @tc.desc      Draft file keeps 33 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0033', 'draft size 33');
    const dir: string = scratchDir();
    const path: string = dir + '/size_33.txt';
    writeText(path, 'fffffffffffffffffffffffffffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(33);
    expect(text).assertEqual('fffffffffffffffffffffffffffffffff');
    expect(fs.statSync(path).size).assertEqual(33);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0034
   * @tc.name      testDraftIo0034
   * @tc.desc      Draft file keeps 34 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0034', 'draft size 34');
    const dir: string = scratchDir();
    const path: string = dir + '/size_34.txt';
    writeText(path, 'ffffffffffffffffffffffffffffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(34);
    expect(text).assertEqual('ffffffffffffffffffffffffffffffffff');
    expect(fs.statSync(path).size).assertEqual(34);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0035
   * @tc.name      testDraftIo0035
   * @tc.desc      Draft file keeps 35 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0035', 'draft size 35');
    const dir: string = scratchDir();
    const path: string = dir + '/size_35.txt';
    writeText(path, 'fffffffffffffffffffffffffffffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(35);
    expect(text).assertEqual('fffffffffffffffffffffffffffffffffff');
    expect(fs.statSync(path).size).assertEqual(35);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0036
   * @tc.name      testDraftIo0036
   * @tc.desc      Draft file keeps 36 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0036', 'draft size 36');
    const dir: string = scratchDir();
    const path: string = dir + '/size_36.txt';
    writeText(path, 'ffffffffffffffffffffffffffffffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(36);
    expect(text).assertEqual('ffffffffffffffffffffffffffffffffffff');
    expect(fs.statSync(path).size).assertEqual(36);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0037
   * @tc.name      testDraftIo0037
   * @tc.desc      Draft file keeps 37 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0037', 'draft size 37');
    const dir: string = scratchDir();
    const path: string = dir + '/size_37.txt';
    writeText(path, 'fffffffffffffffffffffffffffffffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(37);
    expect(text).assertEqual('fffffffffffffffffffffffffffffffffffff');
    expect(fs.statSync(path).size).assertEqual(37);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0038
   * @tc.name      testDraftIo0038
   * @tc.desc      Draft file keeps 38 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0038', 'draft size 38');
    const dir: string = scratchDir();
    const path: string = dir + '/size_38.txt';
    writeText(path, 'ffffffffffffffffffffffffffffffffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(38);
    expect(text).assertEqual('ffffffffffffffffffffffffffffffffffffff');
    expect(fs.statSync(path).size).assertEqual(38);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0039
   * @tc.name      testDraftIo0039
   * @tc.desc      Draft file keeps 39 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0039', 'draft size 39');
    const dir: string = scratchDir();
    const path: string = dir + '/size_39.txt';
    writeText(path, 'fffffffffffffffffffffffffffffffffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(39);
    expect(text).assertEqual('fffffffffffffffffffffffffffffffffffffff');
    expect(fs.statSync(path).size).assertEqual(39);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0040
   * @tc.name      testDraftIo0040
   * @tc.desc      Draft file keeps 40 bytes
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0040', 'draft size 40');
    const dir: string = scratchDir();
    const path: string = dir + '/size_40.txt';
    writeText(path, 'ffffffffffffffffffffffffffffffffffffffff');
    const text: string = readText(path);
    expect(text.length).assertEqual(40);
    expect(text).assertEqual('ffffffffffffffffffffffffffffffffffffffff');
    expect(fs.statSync(path).size).assertEqual(40);
    expect(fs.statSync(path).isFile()).assertTrue();
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0041
   * @tc.name      testDraftIo0041
   * @tc.desc      Draft token alpha survives
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0041', 'draft token alpha');
    const dir: string = scratchDir();
    const path: string = dir + '/token_alpha.txt';
    writeText(path, 'alpha');
    const text: string = readText(path);
    expect(text).assertEqual('alpha');
    expect(text.indexOf('a')).assertEqual(0);
    expect(text.lastIndexOf('a')).assertEqual(4);
    expect(text.toUpperCase()).assertEqual('ALPHA');
    expect(text.split('').length).assertEqual(5);
    expect(text.concat('')).assertEqual(text);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0042
   * @tc.name      testDraftIo0042
   * @tc.desc      Draft token beta survives
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0042', 'draft token beta');
    const dir: string = scratchDir();
    const path: string = dir + '/token_beta.txt';
    writeText(path, 'beta');
    const text: string = readText(path);
    expect(text).assertEqual('beta');
    expect(text.indexOf('b')).assertEqual(0);
    expect(text.lastIndexOf('a')).assertEqual(3);
    expect(text.toUpperCase()).assertEqual('BETA');
    expect(text.split('').length).assertEqual(4);
    expect(text.concat('')).assertEqual(text);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0043
   * @tc.name      testDraftIo0043
   * @tc.desc      Draft token gamma survives
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0043', 'draft token gamma');
    const dir: string = scratchDir();
    const path: string = dir + '/token_gamma.txt';
    writeText(path, 'gamma');
    const text: string = readText(path);
    expect(text).assertEqual('gamma');
    expect(text.indexOf('g')).assertEqual(0);
    expect(text.lastIndexOf('a')).assertEqual(4);
    expect(text.toUpperCase()).assertEqual('GAMMA');
    expect(text.split('').length).assertEqual(5);
    expect(text.concat('')).assertEqual(text);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0044
   * @tc.name      testDraftIo0044
   * @tc.desc      Draft token delta survives
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0044', 'draft token delta');
    const dir: string = scratchDir();
    const path: string = dir + '/token_delta.txt';
    writeText(path, 'delta');
    const text: string = readText(path);
    expect(text).assertEqual('delta');
    expect(text.indexOf('d')).assertEqual(0);
    expect(text.lastIndexOf('a')).assertEqual(4);
    expect(text.toUpperCase()).assertEqual('DELTA');
    expect(text.split('').length).assertEqual(5);
    expect(text.concat('')).assertEqual(text);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0045
   * @tc.name      testDraftIo0045
   * @tc.desc      Draft token epsilon survives
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0045', 'draft token epsilon');
    const dir: string = scratchDir();
    const path: string = dir + '/token_epsilon.txt';
    writeText(path, 'epsilon');
    const text: string = readText(path);
    expect(text).assertEqual('epsilon');
    expect(text.indexOf('e')).assertEqual(0);
    expect(text.lastIndexOf('n')).assertEqual(6);
    expect(text.toUpperCase()).assertEqual('EPSILON');
    expect(text.split('').length).assertEqual(7);
    expect(text.concat('')).assertEqual(text);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0046
   * @tc.name      testDraftIo0046
   * @tc.desc      Draft token zeta survives
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0046', 'draft token zeta');
    const dir: string = scratchDir();
    const path: string = dir + '/token_zeta.txt';
    writeText(path, 'zeta');
    const text: string = readText(path);
    expect(text).assertEqual('zeta');
    expect(text.indexOf('z')).assertEqual(0);
    expect(text.lastIndexOf('a')).assertEqual(3);
    expect(text.toUpperCase()).assertEqual('ZETA');
    expect(text.split('').length).assertEqual(4);
    expect(text.concat('')).assertEqual(text);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0047
   * @tc.name      testDraftIo0047
   * @tc.desc      Draft token eta survives
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0047', 'draft token eta');
    const dir: string = scratchDir();
    const path: string = dir + '/token_eta.txt';
    writeText(path, 'eta');
    const text: string = readText(path);
    expect(text).assertEqual('eta');
    expect(text.indexOf('e')).assertEqual(0);
    expect(text.lastIndexOf('a')).assertEqual(2);
    expect(text.toUpperCase()).assertEqual('ETA');
    expect(text.split('').length).assertEqual(3);
    expect(text.concat('')).assertEqual(text);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0048
   * @tc.name      testDraftIo0048
   * @tc.desc      Draft token theta survives
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0048', 'draft token theta');
    const dir: string = scratchDir();
    const path: string = dir + '/token_theta.txt';
    writeText(path, 'theta');
    const text: string = readText(path);
    expect(text).assertEqual('theta');
    expect(text.indexOf('t')).assertEqual(0);
    expect(text.lastIndexOf('a')).assertEqual(4);
    expect(text.toUpperCase()).assertEqual('THETA');
    expect(text.split('').length).assertEqual(5);
    expect(text.concat('')).assertEqual(text);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0049
   * @tc.name      testDraftIo0049
   * @tc.desc      Draft token iota survives
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0049', 'draft token iota');
    const dir: string = scratchDir();
    const path: string = dir + '/token_iota.txt';
    writeText(path, 'iota');
    const text: string = readText(path);
    expect(text).assertEqual('iota');
    expect(text.indexOf('i')).assertEqual(0);
    expect(text.lastIndexOf('a')).assertEqual(3);
    expect(text.toUpperCase()).assertEqual('IOTA');
    expect(text.split('').length).assertEqual(4);
    expect(text.concat('')).assertEqual(text);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0050
   * @tc.name      testDraftIo0050
   * @tc.desc      Draft token kappa survives
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0050', 'draft token kappa');
    const dir: string = scratchDir();
    const path: string = dir + '/token_kappa.txt';
    writeText(path, 'kappa');
    const text: string = readText(path);
    expect(text).assertEqual('kappa');
    expect(text.indexOf('k')).assertEqual(0);
    expect(text.lastIndexOf('a')).assertEqual(4);
    expect(text.toUpperCase()).assertEqual('KAPPA');
    expect(text.split('').length).assertEqual(5);
    expect(text.concat('')).assertEqual(text);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0051
   * @tc.name      testDraftIo0051
   * @tc.desc      Draft token lambda survives
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0051', 'draft token lambda');
    const dir: string = scratchDir();
    const path: string = dir + '/token_lambda.txt';
    writeText(path, 'lambda');
    const text: string = readText(path);
    expect(text).assertEqual('lambda');
    expect(text.indexOf('l')).assertEqual(0);
    expect(text.lastIndexOf('a')).assertEqual(5);
    expect(text.toUpperCase()).assertEqual('LAMBDA');
    expect(text.split('').length).assertEqual(6);
    expect(text.concat('')).assertEqual(text);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0052
   * @tc.name      testDraftIo0052
   * @tc.desc      Draft token mu survives
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0052', 'draft token mu');
    const dir: string = scratchDir();
    const path: string = dir + '/token_mu.txt';
    writeText(path, 'mu');
    const text: string = readText(path);
    expect(text).assertEqual('mu');
    expect(text.indexOf('m')).assertEqual(0);
    expect(text.lastIndexOf('u')).assertEqual(1);
    expect(text.toUpperCase()).assertEqual('MU');
    expect(text.split('').length).assertEqual(2);
    expect(text.concat('')).assertEqual(text);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0053
   * @tc.name      testDraftIo0053
   * @tc.desc      Draft token nu survives
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0053', 'draft token nu');
    const dir: string = scratchDir();
    const path: string = dir + '/token_nu.txt';
    writeText(path, 'nu');
    const text: string = readText(path);
    expect(text).assertEqual('nu');
    expect(text.indexOf('n')).assertEqual(0);
    expect(text.lastIndexOf('u')).assertEqual(1);
    expect(text.toUpperCase()).assertEqual('NU');
    expect(text.split('').length).assertEqual(2);
    expect(text.concat('')).assertEqual(text);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0054
   * @tc.name      testDraftIo0054
   * @tc.desc      Draft token xi survives
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0054', 'draft token xi');
    const dir: string = scratchDir();
    const path: string = dir + '/token_xi.txt';
    writeText(path, 'xi');
    const text: string = readText(path);
    expect(text).assertEqual('xi');
    expect(text.indexOf('x')).assertEqual(0);
    expect(text.lastIndexOf('i')).assertEqual(1);
    expect(text.toUpperCase()).assertEqual('XI');
    expect(text.split('').length).assertEqual(2);
    expect(text.concat('')).assertEqual(text);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0055
   * @tc.name      testDraftIo0055
   * @tc.desc      Draft token omicron survives
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0055', 'draft token omicron');
    const dir: string = scratchDir();
    const path: string = dir + '/token_omicron.txt';
    writeText(path, 'omicron');
    const text: string = readText(path);
    expect(text).assertEqual('omicron');
    expect(text.indexOf('o')).assertEqual(0);
    expect(text.lastIndexOf('n')).assertEqual(6);
    expect(text.toUpperCase()).assertEqual('OMICRON');
    expect(text.split('').length).assertEqual(7);
    expect(text.concat('')).assertEqual(text);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0056
   * @tc.name      testDraftIo0056
   * @tc.desc      Draft token pi survives
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0056', 'draft token pi');
    const dir: string = scratchDir();
    const path: string = dir + '/token_pi.txt';
    writeText(path, 'pi');
    const text: string = readText(path);
    expect(text).assertEqual('pi');
    expect(text.indexOf('p')).assertEqual(0);
    expect(text.lastIndexOf('i')).assertEqual(1);
    expect(text.toUpperCase()).assertEqual('PI');
    expect(text.split('').length).assertEqual(2);
    expect(text.concat('')).assertEqual(text);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0057
   * @tc.name      testDraftIo0057
   * @tc.desc      Draft token rho survives
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0057', 'draft token rho');
    const dir: string = scratchDir();
    const path: string = dir + '/token_rho.txt';
    writeText(path, 'rho');
    const text: string = readText(path);
    expect(text).assertEqual('rho');
    expect(text.indexOf('r')).assertEqual(0);
    expect(text.lastIndexOf('o')).assertEqual(2);
    expect(text.toUpperCase()).assertEqual('RHO');
    expect(text.split('').length).assertEqual(3);
    expect(text.concat('')).assertEqual(text);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0058
   * @tc.name      testDraftIo0058
   * @tc.desc      Draft token sigma survives
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0058', 'draft token sigma');
    const dir: string = scratchDir();
    const path: string = dir + '/token_sigma.txt';
    writeText(path, 'sigma');
    const text: string = readText(path);
    expect(text).assertEqual('sigma');
    expect(text.indexOf('s')).assertEqual(0);
    expect(text.lastIndexOf('a')).assertEqual(4);
    expect(text.toUpperCase()).assertEqual('SIGMA');
    expect(text.split('').length).assertEqual(5);
    expect(text.concat('')).assertEqual(text);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0059
   * @tc.name      testDraftIo0059
   * @tc.desc      Draft token tau survives
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0059', 'draft token tau');
    const dir: string = scratchDir();
    const path: string = dir + '/token_tau.txt';
    writeText(path, 'tau');
    const text: string = readText(path);
    expect(text).assertEqual('tau');
    expect(text.indexOf('t')).assertEqual(0);
    expect(text.lastIndexOf('u')).assertEqual(2);
    expect(text.toUpperCase()).assertEqual('TAU');
    expect(text.split('').length).assertEqual(3);
    expect(text.concat('')).assertEqual(text);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0060
   * @tc.name      testDraftIo0060
   * @tc.desc      Draft token upsilon survives
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0060', 'draft token upsilon');
    const dir: string = scratchDir();
    const path: string = dir + '/token_upsilon.txt';
    writeText(path, 'upsilon');
    const text: string = readText(path);
    expect(text).assertEqual('upsilon');
    expect(text.indexOf('u')).assertEqual(0);
    expect(text.lastIndexOf('n')).assertEqual(6);
    expect(text.toUpperCase()).assertEqual('UPSILON');
    expect(text.split('').length).assertEqual(7);
    expect(text.concat('')).assertEqual(text);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0061
   * @tc.name      testDraftIo0061
   * @tc.desc      Draft append chain of 1 links
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0061', 'append chain 1');
    const dir: string = scratchDir();
    const path: string = dir + '/chain_01.txt';
    writeText(path, 'seed');
    appendText(path, '|link-1');
        const expected: string[] = ['seed', 'link-1'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(2);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-1')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(11);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0062
   * @tc.name      testDraftIo0062
   * @tc.desc      Draft append chain of 2 links
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0062', 'append chain 2');
    const dir: string = scratchDir();
    const path: string = dir + '/chain_02.txt';
    writeText(path, 'seed');
    appendText(path, '|link-1');
    appendText(path, '|link-2');
        const expected: string[] = ['seed', 'link-1', 'link-2'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(3);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-2')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(18);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0063
   * @tc.name      testDraftIo0063
   * @tc.desc      Draft append chain of 3 links
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0063', 'append chain 3');
    const dir: string = scratchDir();
    const path: string = dir + '/chain_03.txt';
    writeText(path, 'seed');
    appendText(path, '|link-1');
    appendText(path, '|link-2');
    appendText(path, '|link-3');
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(4);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-3')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(25);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0064
   * @tc.name      testDraftIo0064
   * @tc.desc      Draft append chain of 4 links
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0064', 'append chain 4');
    const dir: string = scratchDir();
    const path: string = dir + '/chain_04.txt';
    writeText(path, 'seed');
    appendText(path, '|link-1');
    appendText(path, '|link-2');
    appendText(path, '|link-3');
    appendText(path, '|link-4');
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(5);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-4')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(32);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0065
   * @tc.name      testDraftIo0065
   * @tc.desc      Draft append chain of 5 links
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0065', 'append chain 5');
    const dir: string = scratchDir();
    const path: string = dir + '/chain_05.txt';
    writeText(path, 'seed');
    appendText(path, '|link-1');
    appendText(path, '|link-2');
    appendText(path, '|link-3');
    appendText(path, '|link-4');
    appendText(path, '|link-5');
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(6);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-5')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(39);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0066
   * @tc.name      testDraftIo0066
   * @tc.desc      Draft append chain of 6 links
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0066', 'append chain 6');
    const dir: string = scratchDir();
    const path: string = dir + '/chain_06.txt';
    writeText(path, 'seed');
    appendText(path, '|link-1');
    appendText(path, '|link-2');
    appendText(path, '|link-3');
    appendText(path, '|link-4');
    appendText(path, '|link-5');
    appendText(path, '|link-6');
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(7);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-6')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(46);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0067
   * @tc.name      testDraftIo0067
   * @tc.desc      Draft append chain of 7 links
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0067', 'append chain 7');
    const dir: string = scratchDir();
    const path: string = dir + '/chain_07.txt';
    writeText(path, 'seed');
    appendText(path, '|link-1');
    appendText(path, '|link-2');
    appendText(path, '|link-3');
    appendText(path, '|link-4');
    appendText(path, '|link-5');
    appendText(path, '|link-6');
    appendText(path, '|link-7');
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(8);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-7')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(53);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0068
   * @tc.name      testDraftIo0068
   * @tc.desc      Draft append chain of 8 links
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0068', 'append chain 8');
    const dir: string = scratchDir();
    const path: string = dir + '/chain_08.txt';
    writeText(path, 'seed');
    appendText(path, '|link-1');
    appendText(path, '|link-2');
    appendText(path, '|link-3');
    appendText(path, '|link-4');
    appendText(path, '|link-5');
    appendText(path, '|link-6');
    appendText(path, '|link-7');
    appendText(path, '|link-8');
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7', 'link-8'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(9);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-8')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(60);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0069
   * @tc.name      testDraftIo0069
   * @tc.desc      Draft append chain of 9 links
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0069', 'append chain 9');
    const dir: string = scratchDir();
    const path: string = dir + '/chain_09.txt';
    writeText(path, 'seed');
    appendText(path, '|link-1');
    appendText(path, '|link-2');
    appendText(path, '|link-3');
    appendText(path, '|link-4');
    appendText(path, '|link-5');
    appendText(path, '|link-6');
    appendText(path, '|link-7');
    appendText(path, '|link-8');
    appendText(path, '|link-9');
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7', 'link-8', 'link-9'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(10);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-9')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(67);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0070
   * @tc.name      testDraftIo0070
   * @tc.desc      Draft append chain of 10 links
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0070', 'append chain 10');
    const dir: string = scratchDir();
    const path: string = dir + '/chain_10.txt';
    writeText(path, 'seed');
    appendText(path, '|link-1');
    appendText(path, '|link-2');
    appendText(path, '|link-3');
    appendText(path, '|link-4');
    appendText(path, '|link-5');
    appendText(path, '|link-6');
    appendText(path, '|link-7');
    appendText(path, '|link-8');
    appendText(path, '|link-9');
    appendText(path, '|link-10');
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7', 'link-8', 'link-9',
          'link-10'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(11);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-10')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(75);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0071
   * @tc.name      testDraftIo0071
   * @tc.desc      Draft append chain of 11 links
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0071', 'append chain 11');
    const dir: string = scratchDir();
    const path: string = dir + '/chain_11.txt';
    writeText(path, 'seed');
    appendText(path, '|link-1');
    appendText(path, '|link-2');
    appendText(path, '|link-3');
    appendText(path, '|link-4');
    appendText(path, '|link-5');
    appendText(path, '|link-6');
    appendText(path, '|link-7');
    appendText(path, '|link-8');
    appendText(path, '|link-9');
    appendText(path, '|link-10');
    appendText(path, '|link-11');
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7', 'link-8', 'link-9',
          'link-10', 'link-11'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(12);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-11')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(83);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0072
   * @tc.name      testDraftIo0072
   * @tc.desc      Draft append chain of 12 links
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0072', 'append chain 12');
    const dir: string = scratchDir();
    const path: string = dir + '/chain_12.txt';
    writeText(path, 'seed');
    appendText(path, '|link-1');
    appendText(path, '|link-2');
    appendText(path, '|link-3');
    appendText(path, '|link-4');
    appendText(path, '|link-5');
    appendText(path, '|link-6');
    appendText(path, '|link-7');
    appendText(path, '|link-8');
    appendText(path, '|link-9');
    appendText(path, '|link-10');
    appendText(path, '|link-11');
    appendText(path, '|link-12');
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7', 'link-8', 'link-9',
          'link-10', 'link-11', 'link-12'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(13);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-12')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(91);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0073
   * @tc.name      testDraftIo0073
   * @tc.desc      Draft append chain of 13 links
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0073', 'append chain 13');
    const dir: string = scratchDir();
    const path: string = dir + '/chain_13.txt';
    writeText(path, 'seed');
    appendText(path, '|link-1');
    appendText(path, '|link-2');
    appendText(path, '|link-3');
    appendText(path, '|link-4');
    appendText(path, '|link-5');
    appendText(path, '|link-6');
    appendText(path, '|link-7');
    appendText(path, '|link-8');
    appendText(path, '|link-9');
    appendText(path, '|link-10');
    appendText(path, '|link-11');
    appendText(path, '|link-12');
    appendText(path, '|link-13');
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7', 'link-8', 'link-9',
          'link-10', 'link-11', 'link-12', 'link-13'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(14);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-13')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(99);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0074
   * @tc.name      testDraftIo0074
   * @tc.desc      Draft append chain of 14 links
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0074', 'append chain 14');
    const dir: string = scratchDir();
    const path: string = dir + '/chain_14.txt';
    writeText(path, 'seed');
    appendText(path, '|link-1');
    appendText(path, '|link-2');
    appendText(path, '|link-3');
    appendText(path, '|link-4');
    appendText(path, '|link-5');
    appendText(path, '|link-6');
    appendText(path, '|link-7');
    appendText(path, '|link-8');
    appendText(path, '|link-9');
    appendText(path, '|link-10');
    appendText(path, '|link-11');
    appendText(path, '|link-12');
    appendText(path, '|link-13');
    appendText(path, '|link-14');
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7', 'link-8', 'link-9',
          'link-10', 'link-11', 'link-12', 'link-13', 'link-14'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(15);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-14')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(107);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0075
   * @tc.name      testDraftIo0075
   * @tc.desc      Draft append chain of 15 links
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0075', 'append chain 15');
    const dir: string = scratchDir();
    const path: string = dir + '/chain_15.txt';
    writeText(path, 'seed');
    appendText(path, '|link-1');
    appendText(path, '|link-2');
    appendText(path, '|link-3');
    appendText(path, '|link-4');
    appendText(path, '|link-5');
    appendText(path, '|link-6');
    appendText(path, '|link-7');
    appendText(path, '|link-8');
    appendText(path, '|link-9');
    appendText(path, '|link-10');
    appendText(path, '|link-11');
    appendText(path, '|link-12');
    appendText(path, '|link-13');
    appendText(path, '|link-14');
    appendText(path, '|link-15');
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7', 'link-8', 'link-9',
          'link-10', 'link-11', 'link-12', 'link-13', 'link-14', 'link-15'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(16);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-15')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(115);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0076
   * @tc.name      testDraftIo0076
   * @tc.desc      Draft append chain of 16 links
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0076', 'append chain 16');
    const dir: string = scratchDir();
    const path: string = dir + '/chain_16.txt';
    writeText(path, 'seed');
    appendText(path, '|link-1');
    appendText(path, '|link-2');
    appendText(path, '|link-3');
    appendText(path, '|link-4');
    appendText(path, '|link-5');
    appendText(path, '|link-6');
    appendText(path, '|link-7');
    appendText(path, '|link-8');
    appendText(path, '|link-9');
    appendText(path, '|link-10');
    appendText(path, '|link-11');
    appendText(path, '|link-12');
    appendText(path, '|link-13');
    appendText(path, '|link-14');
    appendText(path, '|link-15');
    appendText(path, '|link-16');
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7', 'link-8', 'link-9',
          'link-10', 'link-11', 'link-12', 'link-13', 'link-14', 'link-15', 'link-16'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(17);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-16')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(123);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0077
   * @tc.name      testDraftIo0077
   * @tc.desc      Draft append chain of 17 links
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0077', 'append chain 17');
    const dir: string = scratchDir();
    const path: string = dir + '/chain_17.txt';
    writeText(path, 'seed');
    appendText(path, '|link-1');
    appendText(path, '|link-2');
    appendText(path, '|link-3');
    appendText(path, '|link-4');
    appendText(path, '|link-5');
    appendText(path, '|link-6');
    appendText(path, '|link-7');
    appendText(path, '|link-8');
    appendText(path, '|link-9');
    appendText(path, '|link-10');
    appendText(path, '|link-11');
    appendText(path, '|link-12');
    appendText(path, '|link-13');
    appendText(path, '|link-14');
    appendText(path, '|link-15');
    appendText(path, '|link-16');
    appendText(path, '|link-17');
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7', 'link-8', 'link-9',
          'link-10', 'link-11', 'link-12', 'link-13', 'link-14', 'link-15', 'link-16', 'link-17'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(18);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-17')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(131);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0078
   * @tc.name      testDraftIo0078
   * @tc.desc      Draft append chain of 18 links
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0078', 'append chain 18');
    const dir: string = scratchDir();
    const path: string = dir + '/chain_18.txt';
    writeText(path, 'seed');
    appendText(path, '|link-1');
    appendText(path, '|link-2');
    appendText(path, '|link-3');
    appendText(path, '|link-4');
    appendText(path, '|link-5');
    appendText(path, '|link-6');
    appendText(path, '|link-7');
    appendText(path, '|link-8');
    appendText(path, '|link-9');
    appendText(path, '|link-10');
    appendText(path, '|link-11');
    appendText(path, '|link-12');
    appendText(path, '|link-13');
    appendText(path, '|link-14');
    appendText(path, '|link-15');
    appendText(path, '|link-16');
    appendText(path, '|link-17');
    appendText(path, '|link-18');
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7', 'link-8', 'link-9',
          'link-10', 'link-11', 'link-12', 'link-13', 'link-14', 'link-15', 'link-16', 'link-17', 'link-18'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(19);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-18')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(139);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0079
   * @tc.name      testDraftIo0079
   * @tc.desc      Draft append chain of 19 links
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0079', 'append chain 19');
    const dir: string = scratchDir();
    const path: string = dir + '/chain_19.txt';
    writeText(path, 'seed');
    appendText(path, '|link-1');
    appendText(path, '|link-2');
    appendText(path, '|link-3');
    appendText(path, '|link-4');
    appendText(path, '|link-5');
    appendText(path, '|link-6');
    appendText(path, '|link-7');
    appendText(path, '|link-8');
    appendText(path, '|link-9');
    appendText(path, '|link-10');
    appendText(path, '|link-11');
    appendText(path, '|link-12');
    appendText(path, '|link-13');
    appendText(path, '|link-14');
    appendText(path, '|link-15');
    appendText(path, '|link-16');
    appendText(path, '|link-17');
    appendText(path, '|link-18');
    appendText(path, '|link-19');
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7', 'link-8', 'link-9',
          'link-10', 'link-11', 'link-12', 'link-13', 'link-14', 'link-15', 'link-16', 'link-17', 'link-18', 'link-19'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(20);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-19')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(147);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0080
   * @tc.name      testDraftIo0080
   * @tc.desc      Draft append chain of 20 links
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0080', 'append chain 20');
    const dir: string = scratchDir();
    const path: string = dir + '/chain_20.txt';
    writeText(path, 'seed');
    appendText(path, '|link-1');
    appendText(path, '|link-2');
    appendText(path, '|link-3');
    appendText(path, '|link-4');
    appendText(path, '|link-5');
    appendText(path, '|link-6');
    appendText(path, '|link-7');
    appendText(path, '|link-8');
    appendText(path, '|link-9');
    appendText(path, '|link-10');
    appendText(path, '|link-11');
    appendText(path, '|link-12');
    appendText(path, '|link-13');
    appendText(path, '|link-14');
    appendText(path, '|link-15');
    appendText(path, '|link-16');
    appendText(path, '|link-17');
    appendText(path, '|link-18');
    appendText(path, '|link-19');
    appendText(path, '|link-20');
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7', 'link-8', 'link-9',
          'link-10', 'link-11', 'link-12', 'link-13', 'link-14', 'link-15', 'link-16', 'link-17', 'link-18', 'link-19', 'link-20'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(21);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-20')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(155);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0081
   * @tc.name      testDraftIo0081
   * @tc.desc      Draft append chain of 21 links
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0081', 'append chain 21');
    const dir: string = scratchDir();
    const path: string = dir + '/chain_21.txt';
    writeText(path, 'seed');
    appendText(path, '|link-1');
    appendText(path, '|link-2');
    appendText(path, '|link-3');
    appendText(path, '|link-4');
    appendText(path, '|link-5');
    appendText(path, '|link-6');
    appendText(path, '|link-7');
    appendText(path, '|link-8');
    appendText(path, '|link-9');
    appendText(path, '|link-10');
    appendText(path, '|link-11');
    appendText(path, '|link-12');
    appendText(path, '|link-13');
    appendText(path, '|link-14');
    appendText(path, '|link-15');
    appendText(path, '|link-16');
    appendText(path, '|link-17');
    appendText(path, '|link-18');
    appendText(path, '|link-19');
    appendText(path, '|link-20');
    appendText(path, '|link-21');
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7', 'link-8', 'link-9',
          'link-10', 'link-11', 'link-12', 'link-13', 'link-14', 'link-15', 'link-16', 'link-17', 'link-18', 'link-19', 'link-20',
          'link-21'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(22);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-21')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(163);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0082
   * @tc.name      testDraftIo0082
   * @tc.desc      Draft append chain of 22 links
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0082', 'append chain 22');
    const dir: string = scratchDir();
    const path: string = dir + '/chain_22.txt';
    writeText(path, 'seed');
    appendText(path, '|link-1');
    appendText(path, '|link-2');
    appendText(path, '|link-3');
    appendText(path, '|link-4');
    appendText(path, '|link-5');
    appendText(path, '|link-6');
    appendText(path, '|link-7');
    appendText(path, '|link-8');
    appendText(path, '|link-9');
    appendText(path, '|link-10');
    appendText(path, '|link-11');
    appendText(path, '|link-12');
    appendText(path, '|link-13');
    appendText(path, '|link-14');
    appendText(path, '|link-15');
    appendText(path, '|link-16');
    appendText(path, '|link-17');
    appendText(path, '|link-18');
    appendText(path, '|link-19');
    appendText(path, '|link-20');
    appendText(path, '|link-21');
    appendText(path, '|link-22');
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7', 'link-8', 'link-9',
          'link-10', 'link-11', 'link-12', 'link-13', 'link-14', 'link-15', 'link-16', 'link-17', 'link-18', 'link-19', 'link-20',
          'link-21', 'link-22'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(23);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-22')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(171);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0083
   * @tc.name      testDraftIo0083
   * @tc.desc      Draft append chain of 23 links
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0083', 'append chain 23');
    const dir: string = scratchDir();
    const path: string = dir + '/chain_23.txt';
    writeText(path, 'seed');
    appendText(path, '|link-1');
    appendText(path, '|link-2');
    appendText(path, '|link-3');
    appendText(path, '|link-4');
    appendText(path, '|link-5');
    appendText(path, '|link-6');
    appendText(path, '|link-7');
    appendText(path, '|link-8');
    appendText(path, '|link-9');
    appendText(path, '|link-10');
    appendText(path, '|link-11');
    appendText(path, '|link-12');
    appendText(path, '|link-13');
    appendText(path, '|link-14');
    appendText(path, '|link-15');
    appendText(path, '|link-16');
    appendText(path, '|link-17');
    appendText(path, '|link-18');
    appendText(path, '|link-19');
    appendText(path, '|link-20');
    appendText(path, '|link-21');
    appendText(path, '|link-22');
    appendText(path, '|link-23');
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7', 'link-8', 'link-9',
          'link-10', 'link-11', 'link-12', 'link-13', 'link-14', 'link-15', 'link-16', 'link-17', 'link-18', 'link-19', 'link-20',
          'link-21', 'link-22', 'link-23'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(24);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-23')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(179);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0084
   * @tc.name      testDraftIo0084
   * @tc.desc      Draft append chain of 24 links
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0084', 'append chain 24');
    const dir: string = scratchDir();
    const path: string = dir + '/chain_24.txt';
    writeText(path, 'seed');
    appendText(path, '|link-1');
    appendText(path, '|link-2');
    appendText(path, '|link-3');
    appendText(path, '|link-4');
    appendText(path, '|link-5');
    appendText(path, '|link-6');
    appendText(path, '|link-7');
    appendText(path, '|link-8');
    appendText(path, '|link-9');
    appendText(path, '|link-10');
    appendText(path, '|link-11');
    appendText(path, '|link-12');
    appendText(path, '|link-13');
    appendText(path, '|link-14');
    appendText(path, '|link-15');
    appendText(path, '|link-16');
    appendText(path, '|link-17');
    appendText(path, '|link-18');
    appendText(path, '|link-19');
    appendText(path, '|link-20');
    appendText(path, '|link-21');
    appendText(path, '|link-22');
    appendText(path, '|link-23');
    appendText(path, '|link-24');
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7', 'link-8', 'link-9',
          'link-10', 'link-11', 'link-12', 'link-13', 'link-14', 'link-15', 'link-16', 'link-17', 'link-18', 'link-19', 'link-20',
          'link-21', 'link-22', 'link-23', 'link-24'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(25);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-24')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(187);
    fs.unlinkSync(path);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_DIO_0085
   * @tc.name      testDraftIo0085
   * @tc.desc      Draft append chain of 25 links
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0085', 'append chain 25');
    const dir: string = scratchDir();
    const path: string = dir + '/chain_25.txt';
    writeText(path, 'seed');
    appendText(path, '|link-1');
    appendText(path, '|link-2');
    appendText(path, '|link-3');
    appendText(path, '|link-4');
    appendText(path, '|link-5');
    appendText(path, '|link-6');
    appendText(path, '|link-7');
    appendText(path, '|link-8');
    appendText(path, '|link-9');
    appendText(path, '|link-10');
    appendText(path, '|link-11');
    appendText(path, '|link-12');
    appendText(path, '|link-13');
    appendText(path, '|link-14');
    appendText(path, '|link-15');
    appendText(path, '|link-16');
    appendText(path, '|link-17');
    appendText(path, '|link-18');
    appendText(path, '|link-19');
    appendText(path, '|link-20');
    appendText(path, '|link-21');
    appendText(path, '|link-22');
    appendText(path, '|link-23');
    appendText(path, '|link-24');
    appendText(path, '|link-25');
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7', 'link-8', 'link-9',
          'link-10', 'link-11', 'link-12', 'link-13', 'link-14', 'link-15', 'link-16', 'link-17', 'link-18', 'link-19', 'link-20',
          'link-21', 'link-22', 'link-23', 'link-24', 'link-25'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(26);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-25')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(195);
    fs.unlinkSync(path);
  });
  });
}
