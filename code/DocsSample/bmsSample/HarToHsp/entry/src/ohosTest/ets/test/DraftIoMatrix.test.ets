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
import { entryContext } from './shared/Probe';
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0001
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0002
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0003
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0004
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0005
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0006
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0007
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0008
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0009
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0010
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0011
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0012
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0013
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0014
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0015
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0016
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0017
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0018
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0019
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0020
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0021
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0022
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0023
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0024
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0025
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0026
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0027
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0028
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0029
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0030
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0031
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0032
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0033
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0034
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0035
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0036
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0037
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0038
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0039
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0040
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0041
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0042
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0043
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0044
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0045
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0046
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0047
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0048
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0049
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0050
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0051
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0052
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0053
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0054
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0055
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0056
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0057
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0058
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0059
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0060
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0061
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0062
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0063
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0064
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0065
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0066
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0067
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
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0068
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
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7',
          'link-8'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(9);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-8')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(60);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0069
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
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7',
          'link-8', 'link-9'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(10);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-9')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(67);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0070
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
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7',
          'link-8', 'link-9', 'link-10'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(11);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-10')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(75);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0071
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
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7',
          'link-8', 'link-9', 'link-10', 'link-11'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(12);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-11')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(83);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0072
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
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7',
          'link-8', 'link-9', 'link-10', 'link-11', 'link-12'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(13);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-12')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(91);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0073
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
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7',
          'link-8', 'link-9', 'link-10', 'link-11', 'link-12', 'link-13'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(14);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-13')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(99);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0074
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
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7',
          'link-8', 'link-9', 'link-10', 'link-11', 'link-12', 'link-13', 'link-14'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(15);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-14')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(107);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0075
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
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7',
          'link-8', 'link-9', 'link-10', 'link-11', 'link-12', 'link-13', 'link-14', 'link-15'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(16);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-15')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(115);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0076
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
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7',
          'link-8', 'link-9', 'link-10', 'link-11', 'link-12', 'link-13', 'link-14', 'link-15', 'link-16'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(17);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-16')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(123);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0077
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
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7',
          'link-8', 'link-9', 'link-10', 'link-11', 'link-12', 'link-13', 'link-14', 'link-15', 'link-16',
          'link-17'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(18);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-17')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(131);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0078
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
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7',
          'link-8', 'link-9', 'link-10', 'link-11', 'link-12', 'link-13', 'link-14', 'link-15', 'link-16',
          'link-17', 'link-18'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(19);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-18')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(139);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0079
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
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7',
          'link-8', 'link-9', 'link-10', 'link-11', 'link-12', 'link-13', 'link-14', 'link-15', 'link-16',
          'link-17', 'link-18', 'link-19'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(20);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-19')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(147);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0080
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
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7',
          'link-8', 'link-9', 'link-10', 'link-11', 'link-12', 'link-13', 'link-14', 'link-15', 'link-16',
          'link-17', 'link-18', 'link-19', 'link-20'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(21);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-20')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(155);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0081
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
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7',
          'link-8', 'link-9', 'link-10', 'link-11', 'link-12', 'link-13', 'link-14', 'link-15', 'link-16',
          'link-17', 'link-18', 'link-19', 'link-20', 'link-21'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(22);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-21')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(163);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0082
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
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7',
          'link-8', 'link-9', 'link-10', 'link-11', 'link-12', 'link-13', 'link-14', 'link-15', 'link-16',
          'link-17', 'link-18', 'link-19', 'link-20', 'link-21', 'link-22'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(23);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-22')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(171);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0083
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
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7',
          'link-8', 'link-9', 'link-10', 'link-11', 'link-12', 'link-13', 'link-14', 'link-15', 'link-16',
          'link-17', 'link-18', 'link-19', 'link-20', 'link-21', 'link-22', 'link-23'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(24);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-23')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(179);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0084
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
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7',
          'link-8', 'link-9', 'link-10', 'link-11', 'link-12', 'link-13', 'link-14', 'link-15', 'link-16',
          'link-17', 'link-18', 'link-19', 'link-20', 'link-21', 'link-22', 'link-23', 'link-24'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(25);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-24')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(187);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0085
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
        const expected: string[] = ['seed', 'link-1', 'link-2', 'link-3', 'link-4', 'link-5', 'link-6', 'link-7',
          'link-8', 'link-9', 'link-10', 'link-11', 'link-12', 'link-13', 'link-14', 'link-15', 'link-16',
          'link-17', 'link-18', 'link-19', 'link-20', 'link-21', 'link-22', 'link-23', 'link-24', 'link-25'];
    const text: string = readText(path);
    expect(text).assertEqual(expected.join('|'));
    expect(text.split('|').length).assertEqual(26);
    expect(text.startsWith('seed')).assertTrue();
    expect(text.endsWith('link-25')).assertTrue();
    expect(fs.statSync(path).size).assertEqual(195);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0086
   * @tc.name      testDraftIo0086
   * @tc.desc      Draft rename pass 1 keeps body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0086', 'rename 1');
    const dir: string = scratchDir();
    const oldPath: string = dir + '/rename_old_01.txt';
    const newPath: string = dir + '/rename_new_01.txt';
    writeText(oldPath, 'renamed-body-1');
    fs.renameSync(oldPath, newPath);
    expect(fs.accessSync(oldPath)).assertFalse();
    expect(fs.accessSync(newPath)).assertTrue();
    expect(readText(newPath)).assertEqual('renamed-body-1');
    expect(fs.statSync(newPath).size).assertEqual(14);
    fs.unlinkSync(newPath);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0087
   * @tc.name      testDraftIo0087
   * @tc.desc      Draft rename pass 2 keeps body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0087', 'rename 2');
    const dir: string = scratchDir();
    const oldPath: string = dir + '/rename_old_02.txt';
    const newPath: string = dir + '/rename_new_02.txt';
    writeText(oldPath, 'renamed-body-2');
    fs.renameSync(oldPath, newPath);
    expect(fs.accessSync(oldPath)).assertFalse();
    expect(fs.accessSync(newPath)).assertTrue();
    expect(readText(newPath)).assertEqual('renamed-body-2');
    expect(fs.statSync(newPath).size).assertEqual(14);
    fs.unlinkSync(newPath);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0088
   * @tc.name      testDraftIo0088
   * @tc.desc      Draft rename pass 3 keeps body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0088', 'rename 3');
    const dir: string = scratchDir();
    const oldPath: string = dir + '/rename_old_03.txt';
    const newPath: string = dir + '/rename_new_03.txt';
    writeText(oldPath, 'renamed-body-3');
    fs.renameSync(oldPath, newPath);
    expect(fs.accessSync(oldPath)).assertFalse();
    expect(fs.accessSync(newPath)).assertTrue();
    expect(readText(newPath)).assertEqual('renamed-body-3');
    expect(fs.statSync(newPath).size).assertEqual(14);
    fs.unlinkSync(newPath);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0089
   * @tc.name      testDraftIo0089
   * @tc.desc      Draft rename pass 4 keeps body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0089', 'rename 4');
    const dir: string = scratchDir();
    const oldPath: string = dir + '/rename_old_04.txt';
    const newPath: string = dir + '/rename_new_04.txt';
    writeText(oldPath, 'renamed-body-4');
    fs.renameSync(oldPath, newPath);
    expect(fs.accessSync(oldPath)).assertFalse();
    expect(fs.accessSync(newPath)).assertTrue();
    expect(readText(newPath)).assertEqual('renamed-body-4');
    expect(fs.statSync(newPath).size).assertEqual(14);
    fs.unlinkSync(newPath);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0090
   * @tc.name      testDraftIo0090
   * @tc.desc      Draft rename pass 5 keeps body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0090', 'rename 5');
    const dir: string = scratchDir();
    const oldPath: string = dir + '/rename_old_05.txt';
    const newPath: string = dir + '/rename_new_05.txt';
    writeText(oldPath, 'renamed-body-5');
    fs.renameSync(oldPath, newPath);
    expect(fs.accessSync(oldPath)).assertFalse();
    expect(fs.accessSync(newPath)).assertTrue();
    expect(readText(newPath)).assertEqual('renamed-body-5');
    expect(fs.statSync(newPath).size).assertEqual(14);
    fs.unlinkSync(newPath);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0091
   * @tc.name      testDraftIo0091
   * @tc.desc      Draft rename pass 6 keeps body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0091', 'rename 6');
    const dir: string = scratchDir();
    const oldPath: string = dir + '/rename_old_06.txt';
    const newPath: string = dir + '/rename_new_06.txt';
    writeText(oldPath, 'renamed-body-6');
    fs.renameSync(oldPath, newPath);
    expect(fs.accessSync(oldPath)).assertFalse();
    expect(fs.accessSync(newPath)).assertTrue();
    expect(readText(newPath)).assertEqual('renamed-body-6');
    expect(fs.statSync(newPath).size).assertEqual(14);
    fs.unlinkSync(newPath);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0092
   * @tc.name      testDraftIo0092
   * @tc.desc      Draft rename pass 7 keeps body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0092', 'rename 7');
    const dir: string = scratchDir();
    const oldPath: string = dir + '/rename_old_07.txt';
    const newPath: string = dir + '/rename_new_07.txt';
    writeText(oldPath, 'renamed-body-7');
    fs.renameSync(oldPath, newPath);
    expect(fs.accessSync(oldPath)).assertFalse();
    expect(fs.accessSync(newPath)).assertTrue();
    expect(readText(newPath)).assertEqual('renamed-body-7');
    expect(fs.statSync(newPath).size).assertEqual(14);
    fs.unlinkSync(newPath);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0093
   * @tc.name      testDraftIo0093
   * @tc.desc      Draft rename pass 8 keeps body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0093', 'rename 8');
    const dir: string = scratchDir();
    const oldPath: string = dir + '/rename_old_08.txt';
    const newPath: string = dir + '/rename_new_08.txt';
    writeText(oldPath, 'renamed-body-8');
    fs.renameSync(oldPath, newPath);
    expect(fs.accessSync(oldPath)).assertFalse();
    expect(fs.accessSync(newPath)).assertTrue();
    expect(readText(newPath)).assertEqual('renamed-body-8');
    expect(fs.statSync(newPath).size).assertEqual(14);
    fs.unlinkSync(newPath);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0094
   * @tc.name      testDraftIo0094
   * @tc.desc      Draft rename pass 9 keeps body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0094', 'rename 9');
    const dir: string = scratchDir();
    const oldPath: string = dir + '/rename_old_09.txt';
    const newPath: string = dir + '/rename_new_09.txt';
    writeText(oldPath, 'renamed-body-9');
    fs.renameSync(oldPath, newPath);
    expect(fs.accessSync(oldPath)).assertFalse();
    expect(fs.accessSync(newPath)).assertTrue();
    expect(readText(newPath)).assertEqual('renamed-body-9');
    expect(fs.statSync(newPath).size).assertEqual(14);
    fs.unlinkSync(newPath);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0095
   * @tc.name      testDraftIo0095
   * @tc.desc      Draft rename pass 10 keeps body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0095', 'rename 10');
    const dir: string = scratchDir();
    const oldPath: string = dir + '/rename_old_10.txt';
    const newPath: string = dir + '/rename_new_10.txt';
    writeText(oldPath, 'renamed-body-10');
    fs.renameSync(oldPath, newPath);
    expect(fs.accessSync(oldPath)).assertFalse();
    expect(fs.accessSync(newPath)).assertTrue();
    expect(readText(newPath)).assertEqual('renamed-body-10');
    expect(fs.statSync(newPath).size).assertEqual(15);
    fs.unlinkSync(newPath);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0096
   * @tc.name      testDraftIo0096
   * @tc.desc      Draft rename pass 11 keeps body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0096', 'rename 11');
    const dir: string = scratchDir();
    const oldPath: string = dir + '/rename_old_11.txt';
    const newPath: string = dir + '/rename_new_11.txt';
    writeText(oldPath, 'renamed-body-11');
    fs.renameSync(oldPath, newPath);
    expect(fs.accessSync(oldPath)).assertFalse();
    expect(fs.accessSync(newPath)).assertTrue();
    expect(readText(newPath)).assertEqual('renamed-body-11');
    expect(fs.statSync(newPath).size).assertEqual(15);
    fs.unlinkSync(newPath);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0097
   * @tc.name      testDraftIo0097
   * @tc.desc      Draft rename pass 12 keeps body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0097', 'rename 12');
    const dir: string = scratchDir();
    const oldPath: string = dir + '/rename_old_12.txt';
    const newPath: string = dir + '/rename_new_12.txt';
    writeText(oldPath, 'renamed-body-12');
    fs.renameSync(oldPath, newPath);
    expect(fs.accessSync(oldPath)).assertFalse();
    expect(fs.accessSync(newPath)).assertTrue();
    expect(readText(newPath)).assertEqual('renamed-body-12');
    expect(fs.statSync(newPath).size).assertEqual(15);
    fs.unlinkSync(newPath);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0098
   * @tc.name      testDraftIo0098
   * @tc.desc      Draft rename pass 13 keeps body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0098', 'rename 13');
    const dir: string = scratchDir();
    const oldPath: string = dir + '/rename_old_13.txt';
    const newPath: string = dir + '/rename_new_13.txt';
    writeText(oldPath, 'renamed-body-13');
    fs.renameSync(oldPath, newPath);
    expect(fs.accessSync(oldPath)).assertFalse();
    expect(fs.accessSync(newPath)).assertTrue();
    expect(readText(newPath)).assertEqual('renamed-body-13');
    expect(fs.statSync(newPath).size).assertEqual(15);
    fs.unlinkSync(newPath);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0099
   * @tc.name      testDraftIo0099
   * @tc.desc      Draft rename pass 14 keeps body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0099', 'rename 14');
    const dir: string = scratchDir();
    const oldPath: string = dir + '/rename_old_14.txt';
    const newPath: string = dir + '/rename_new_14.txt';
    writeText(oldPath, 'renamed-body-14');
    fs.renameSync(oldPath, newPath);
    expect(fs.accessSync(oldPath)).assertFalse();
    expect(fs.accessSync(newPath)).assertTrue();
    expect(readText(newPath)).assertEqual('renamed-body-14');
    expect(fs.statSync(newPath).size).assertEqual(15);
    fs.unlinkSync(newPath);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0100
   * @tc.name      testDraftIo0100
   * @tc.desc      Draft rename pass 15 keeps body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0100', 'rename 15');
    const dir: string = scratchDir();
    const oldPath: string = dir + '/rename_old_15.txt';
    const newPath: string = dir + '/rename_new_15.txt';
    writeText(oldPath, 'renamed-body-15');
    fs.renameSync(oldPath, newPath);
    expect(fs.accessSync(oldPath)).assertFalse();
    expect(fs.accessSync(newPath)).assertTrue();
    expect(readText(newPath)).assertEqual('renamed-body-15');
    expect(fs.statSync(newPath).size).assertEqual(15);
    fs.unlinkSync(newPath);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0101
   * @tc.name      testDraftIo0101
   * @tc.desc      Draft rename pass 16 keeps body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0101', 'rename 16');
    const dir: string = scratchDir();
    const oldPath: string = dir + '/rename_old_16.txt';
    const newPath: string = dir + '/rename_new_16.txt';
    writeText(oldPath, 'renamed-body-16');
    fs.renameSync(oldPath, newPath);
    expect(fs.accessSync(oldPath)).assertFalse();
    expect(fs.accessSync(newPath)).assertTrue();
    expect(readText(newPath)).assertEqual('renamed-body-16');
    expect(fs.statSync(newPath).size).assertEqual(15);
    fs.unlinkSync(newPath);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0102
   * @tc.name      testDraftIo0102
   * @tc.desc      Draft rename pass 17 keeps body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0102', 'rename 17');
    const dir: string = scratchDir();
    const oldPath: string = dir + '/rename_old_17.txt';
    const newPath: string = dir + '/rename_new_17.txt';
    writeText(oldPath, 'renamed-body-17');
    fs.renameSync(oldPath, newPath);
    expect(fs.accessSync(oldPath)).assertFalse();
    expect(fs.accessSync(newPath)).assertTrue();
    expect(readText(newPath)).assertEqual('renamed-body-17');
    expect(fs.statSync(newPath).size).assertEqual(15);
    fs.unlinkSync(newPath);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0103
   * @tc.name      testDraftIo0103
   * @tc.desc      Draft rename pass 18 keeps body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0103', 'rename 18');
    const dir: string = scratchDir();
    const oldPath: string = dir + '/rename_old_18.txt';
    const newPath: string = dir + '/rename_new_18.txt';
    writeText(oldPath, 'renamed-body-18');
    fs.renameSync(oldPath, newPath);
    expect(fs.accessSync(oldPath)).assertFalse();
    expect(fs.accessSync(newPath)).assertTrue();
    expect(readText(newPath)).assertEqual('renamed-body-18');
    expect(fs.statSync(newPath).size).assertEqual(15);
    fs.unlinkSync(newPath);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0104
   * @tc.name      testDraftIo0104
   * @tc.desc      Draft rename pass 19 keeps body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0104', 'rename 19');
    const dir: string = scratchDir();
    const oldPath: string = dir + '/rename_old_19.txt';
    const newPath: string = dir + '/rename_new_19.txt';
    writeText(oldPath, 'renamed-body-19');
    fs.renameSync(oldPath, newPath);
    expect(fs.accessSync(oldPath)).assertFalse();
    expect(fs.accessSync(newPath)).assertTrue();
    expect(readText(newPath)).assertEqual('renamed-body-19');
    expect(fs.statSync(newPath).size).assertEqual(15);
    fs.unlinkSync(newPath);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0105
   * @tc.name      testDraftIo0105
   * @tc.desc      Draft rename pass 20 keeps body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0105', 'rename 20');
    const dir: string = scratchDir();
    const oldPath: string = dir + '/rename_old_20.txt';
    const newPath: string = dir + '/rename_new_20.txt';
    writeText(oldPath, 'renamed-body-20');
    fs.renameSync(oldPath, newPath);
    expect(fs.accessSync(oldPath)).assertFalse();
    expect(fs.accessSync(newPath)).assertTrue();
    expect(readText(newPath)).assertEqual('renamed-body-20');
    expect(fs.statSync(newPath).size).assertEqual(15);
    fs.unlinkSync(newPath);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0106
   * @tc.name      testDraftIo0106
   * @tc.desc      Draft copy pass 1 survives source removal
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0106', 'copy 1');
    const dir: string = scratchDir();
    const source: string = dir + '/copy_src_01.txt';
    const target: string = dir + '/copy_dst_01.txt';
    writeText(source, 'copy-payload-01');
    fs.copyFileSync(source, target);
    expect(readText(target)).assertEqual('copy-payload-01');
    expect(fs.statSync(target).size).assertEqual(fs.statSync(source).size);
    fs.unlinkSync(source);
    expect(fs.accessSync(source)).assertFalse();
    expect(fs.statSync(target).size).assertEqual(15);
    expect(fs.listFileSync(dir).includes('copy_dst_01.txt')).assertTrue();
    fs.unlinkSync(target);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0107
   * @tc.name      testDraftIo0107
   * @tc.desc      Draft copy pass 2 survives source removal
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0107', 'copy 2');
    const dir: string = scratchDir();
    const source: string = dir + '/copy_src_02.txt';
    const target: string = dir + '/copy_dst_02.txt';
    writeText(source, 'copy-payload-02');
    fs.copyFileSync(source, target);
    expect(readText(target)).assertEqual('copy-payload-02');
    expect(fs.statSync(target).size).assertEqual(fs.statSync(source).size);
    fs.unlinkSync(source);
    expect(fs.accessSync(source)).assertFalse();
    expect(fs.statSync(target).size).assertEqual(15);
    expect(fs.listFileSync(dir).includes('copy_dst_02.txt')).assertTrue();
    fs.unlinkSync(target);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0108
   * @tc.name      testDraftIo0108
   * @tc.desc      Draft copy pass 3 survives source removal
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0108', 'copy 3');
    const dir: string = scratchDir();
    const source: string = dir + '/copy_src_03.txt';
    const target: string = dir + '/copy_dst_03.txt';
    writeText(source, 'copy-payload-03');
    fs.copyFileSync(source, target);
    expect(readText(target)).assertEqual('copy-payload-03');
    expect(fs.statSync(target).size).assertEqual(fs.statSync(source).size);
    fs.unlinkSync(source);
    expect(fs.accessSync(source)).assertFalse();
    expect(fs.statSync(target).size).assertEqual(15);
    expect(fs.listFileSync(dir).includes('copy_dst_03.txt')).assertTrue();
    fs.unlinkSync(target);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0109
   * @tc.name      testDraftIo0109
   * @tc.desc      Draft copy pass 4 survives source removal
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0109', 'copy 4');
    const dir: string = scratchDir();
    const source: string = dir + '/copy_src_04.txt';
    const target: string = dir + '/copy_dst_04.txt';
    writeText(source, 'copy-payload-04');
    fs.copyFileSync(source, target);
    expect(readText(target)).assertEqual('copy-payload-04');
    expect(fs.statSync(target).size).assertEqual(fs.statSync(source).size);
    fs.unlinkSync(source);
    expect(fs.accessSync(source)).assertFalse();
    expect(fs.statSync(target).size).assertEqual(15);
    expect(fs.listFileSync(dir).includes('copy_dst_04.txt')).assertTrue();
    fs.unlinkSync(target);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0110
   * @tc.name      testDraftIo0110
   * @tc.desc      Draft copy pass 5 survives source removal
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0110', 'copy 5');
    const dir: string = scratchDir();
    const source: string = dir + '/copy_src_05.txt';
    const target: string = dir + '/copy_dst_05.txt';
    writeText(source, 'copy-payload-05');
    fs.copyFileSync(source, target);
    expect(readText(target)).assertEqual('copy-payload-05');
    expect(fs.statSync(target).size).assertEqual(fs.statSync(source).size);
    fs.unlinkSync(source);
    expect(fs.accessSync(source)).assertFalse();
    expect(fs.statSync(target).size).assertEqual(15);
    expect(fs.listFileSync(dir).includes('copy_dst_05.txt')).assertTrue();
    fs.unlinkSync(target);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0111
   * @tc.name      testDraftIo0111
   * @tc.desc      Draft copy pass 6 survives source removal
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0111', 'copy 6');
    const dir: string = scratchDir();
    const source: string = dir + '/copy_src_06.txt';
    const target: string = dir + '/copy_dst_06.txt';
    writeText(source, 'copy-payload-06');
    fs.copyFileSync(source, target);
    expect(readText(target)).assertEqual('copy-payload-06');
    expect(fs.statSync(target).size).assertEqual(fs.statSync(source).size);
    fs.unlinkSync(source);
    expect(fs.accessSync(source)).assertFalse();
    expect(fs.statSync(target).size).assertEqual(15);
    expect(fs.listFileSync(dir).includes('copy_dst_06.txt')).assertTrue();
    fs.unlinkSync(target);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0112
   * @tc.name      testDraftIo0112
   * @tc.desc      Draft copy pass 7 survives source removal
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0112', 'copy 7');
    const dir: string = scratchDir();
    const source: string = dir + '/copy_src_07.txt';
    const target: string = dir + '/copy_dst_07.txt';
    writeText(source, 'copy-payload-07');
    fs.copyFileSync(source, target);
    expect(readText(target)).assertEqual('copy-payload-07');
    expect(fs.statSync(target).size).assertEqual(fs.statSync(source).size);
    fs.unlinkSync(source);
    expect(fs.accessSync(source)).assertFalse();
    expect(fs.statSync(target).size).assertEqual(15);
    expect(fs.listFileSync(dir).includes('copy_dst_07.txt')).assertTrue();
    fs.unlinkSync(target);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0113
   * @tc.name      testDraftIo0113
   * @tc.desc      Draft copy pass 8 survives source removal
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0113', 'copy 8');
    const dir: string = scratchDir();
    const source: string = dir + '/copy_src_08.txt';
    const target: string = dir + '/copy_dst_08.txt';
    writeText(source, 'copy-payload-08');
    fs.copyFileSync(source, target);
    expect(readText(target)).assertEqual('copy-payload-08');
    expect(fs.statSync(target).size).assertEqual(fs.statSync(source).size);
    fs.unlinkSync(source);
    expect(fs.accessSync(source)).assertFalse();
    expect(fs.statSync(target).size).assertEqual(15);
    expect(fs.listFileSync(dir).includes('copy_dst_08.txt')).assertTrue();
    fs.unlinkSync(target);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0114
   * @tc.name      testDraftIo0114
   * @tc.desc      Draft copy pass 9 survives source removal
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0114', 'copy 9');
    const dir: string = scratchDir();
    const source: string = dir + '/copy_src_09.txt';
    const target: string = dir + '/copy_dst_09.txt';
    writeText(source, 'copy-payload-09');
    fs.copyFileSync(source, target);
    expect(readText(target)).assertEqual('copy-payload-09');
    expect(fs.statSync(target).size).assertEqual(fs.statSync(source).size);
    fs.unlinkSync(source);
    expect(fs.accessSync(source)).assertFalse();
    expect(fs.statSync(target).size).assertEqual(15);
    expect(fs.listFileSync(dir).includes('copy_dst_09.txt')).assertTrue();
    fs.unlinkSync(target);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0115
   * @tc.name      testDraftIo0115
   * @tc.desc      Draft copy pass 10 survives source removal
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0115', 'copy 10');
    const dir: string = scratchDir();
    const source: string = dir + '/copy_src_10.txt';
    const target: string = dir + '/copy_dst_10.txt';
    writeText(source, 'copy-payload-10');
    fs.copyFileSync(source, target);
    expect(readText(target)).assertEqual('copy-payload-10');
    expect(fs.statSync(target).size).assertEqual(fs.statSync(source).size);
    fs.unlinkSync(source);
    expect(fs.accessSync(source)).assertFalse();
    expect(fs.statSync(target).size).assertEqual(15);
    expect(fs.listFileSync(dir).includes('copy_dst_10.txt')).assertTrue();
    fs.unlinkSync(target);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0116
   * @tc.name      testDraftIo0116
   * @tc.desc      Draft copy pass 11 survives source removal
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0116', 'copy 11');
    const dir: string = scratchDir();
    const source: string = dir + '/copy_src_11.txt';
    const target: string = dir + '/copy_dst_11.txt';
    writeText(source, 'copy-payload-11');
    fs.copyFileSync(source, target);
    expect(readText(target)).assertEqual('copy-payload-11');
    expect(fs.statSync(target).size).assertEqual(fs.statSync(source).size);
    fs.unlinkSync(source);
    expect(fs.accessSync(source)).assertFalse();
    expect(fs.statSync(target).size).assertEqual(15);
    expect(fs.listFileSync(dir).includes('copy_dst_11.txt')).assertTrue();
    fs.unlinkSync(target);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0117
   * @tc.name      testDraftIo0117
   * @tc.desc      Draft copy pass 12 survives source removal
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0117', 'copy 12');
    const dir: string = scratchDir();
    const source: string = dir + '/copy_src_12.txt';
    const target: string = dir + '/copy_dst_12.txt';
    writeText(source, 'copy-payload-12');
    fs.copyFileSync(source, target);
    expect(readText(target)).assertEqual('copy-payload-12');
    expect(fs.statSync(target).size).assertEqual(fs.statSync(source).size);
    fs.unlinkSync(source);
    expect(fs.accessSync(source)).assertFalse();
    expect(fs.statSync(target).size).assertEqual(15);
    expect(fs.listFileSync(dir).includes('copy_dst_12.txt')).assertTrue();
    fs.unlinkSync(target);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0118
   * @tc.name      testDraftIo0118
   * @tc.desc      Draft copy pass 13 survives source removal
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0118', 'copy 13');
    const dir: string = scratchDir();
    const source: string = dir + '/copy_src_13.txt';
    const target: string = dir + '/copy_dst_13.txt';
    writeText(source, 'copy-payload-13');
    fs.copyFileSync(source, target);
    expect(readText(target)).assertEqual('copy-payload-13');
    expect(fs.statSync(target).size).assertEqual(fs.statSync(source).size);
    fs.unlinkSync(source);
    expect(fs.accessSync(source)).assertFalse();
    expect(fs.statSync(target).size).assertEqual(15);
    expect(fs.listFileSync(dir).includes('copy_dst_13.txt')).assertTrue();
    fs.unlinkSync(target);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0119
   * @tc.name      testDraftIo0119
   * @tc.desc      Draft copy pass 14 survives source removal
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0119', 'copy 14');
    const dir: string = scratchDir();
    const source: string = dir + '/copy_src_14.txt';
    const target: string = dir + '/copy_dst_14.txt';
    writeText(source, 'copy-payload-14');
    fs.copyFileSync(source, target);
    expect(readText(target)).assertEqual('copy-payload-14');
    expect(fs.statSync(target).size).assertEqual(fs.statSync(source).size);
    fs.unlinkSync(source);
    expect(fs.accessSync(source)).assertFalse();
    expect(fs.statSync(target).size).assertEqual(15);
    expect(fs.listFileSync(dir).includes('copy_dst_14.txt')).assertTrue();
    fs.unlinkSync(target);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0120
   * @tc.name      testDraftIo0120
   * @tc.desc      Draft copy pass 15 survives source removal
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0120', 'copy 15');
    const dir: string = scratchDir();
    const source: string = dir + '/copy_src_15.txt';
    const target: string = dir + '/copy_dst_15.txt';
    writeText(source, 'copy-payload-15');
    fs.copyFileSync(source, target);
    expect(readText(target)).assertEqual('copy-payload-15');
    expect(fs.statSync(target).size).assertEqual(fs.statSync(source).size);
    fs.unlinkSync(source);
    expect(fs.accessSync(source)).assertFalse();
    expect(fs.statSync(target).size).assertEqual(15);
    expect(fs.listFileSync(dir).includes('copy_dst_15.txt')).assertTrue();
    fs.unlinkSync(target);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0121
   * @tc.name      testDraftIo0121
   * @tc.desc      Draft copy pass 16 survives source removal
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0121', 'copy 16');
    const dir: string = scratchDir();
    const source: string = dir + '/copy_src_16.txt';
    const target: string = dir + '/copy_dst_16.txt';
    writeText(source, 'copy-payload-16');
    fs.copyFileSync(source, target);
    expect(readText(target)).assertEqual('copy-payload-16');
    expect(fs.statSync(target).size).assertEqual(fs.statSync(source).size);
    fs.unlinkSync(source);
    expect(fs.accessSync(source)).assertFalse();
    expect(fs.statSync(target).size).assertEqual(15);
    expect(fs.listFileSync(dir).includes('copy_dst_16.txt')).assertTrue();
    fs.unlinkSync(target);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0122
   * @tc.name      testDraftIo0122
   * @tc.desc      Draft copy pass 17 survives source removal
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0122', 'copy 17');
    const dir: string = scratchDir();
    const source: string = dir + '/copy_src_17.txt';
    const target: string = dir + '/copy_dst_17.txt';
    writeText(source, 'copy-payload-17');
    fs.copyFileSync(source, target);
    expect(readText(target)).assertEqual('copy-payload-17');
    expect(fs.statSync(target).size).assertEqual(fs.statSync(source).size);
    fs.unlinkSync(source);
    expect(fs.accessSync(source)).assertFalse();
    expect(fs.statSync(target).size).assertEqual(15);
    expect(fs.listFileSync(dir).includes('copy_dst_17.txt')).assertTrue();
    fs.unlinkSync(target);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0123
   * @tc.name      testDraftIo0123
   * @tc.desc      Draft copy pass 18 survives source removal
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0123', 'copy 18');
    const dir: string = scratchDir();
    const source: string = dir + '/copy_src_18.txt';
    const target: string = dir + '/copy_dst_18.txt';
    writeText(source, 'copy-payload-18');
    fs.copyFileSync(source, target);
    expect(readText(target)).assertEqual('copy-payload-18');
    expect(fs.statSync(target).size).assertEqual(fs.statSync(source).size);
    fs.unlinkSync(source);
    expect(fs.accessSync(source)).assertFalse();
    expect(fs.statSync(target).size).assertEqual(15);
    expect(fs.listFileSync(dir).includes('copy_dst_18.txt')).assertTrue();
    fs.unlinkSync(target);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0124
   * @tc.name      testDraftIo0124
   * @tc.desc      Draft copy pass 19 survives source removal
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0124', 'copy 19');
    const dir: string = scratchDir();
    const source: string = dir + '/copy_src_19.txt';
    const target: string = dir + '/copy_dst_19.txt';
    writeText(source, 'copy-payload-19');
    fs.copyFileSync(source, target);
    expect(readText(target)).assertEqual('copy-payload-19');
    expect(fs.statSync(target).size).assertEqual(fs.statSync(source).size);
    fs.unlinkSync(source);
    expect(fs.accessSync(source)).assertFalse();
    expect(fs.statSync(target).size).assertEqual(15);
    expect(fs.listFileSync(dir).includes('copy_dst_19.txt')).assertTrue();
    fs.unlinkSync(target);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0125
   * @tc.name      testDraftIo0125
   * @tc.desc      Draft copy pass 20 survives source removal
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0125', 'copy 20');
    const dir: string = scratchDir();
    const source: string = dir + '/copy_src_20.txt';
    const target: string = dir + '/copy_dst_20.txt';
    writeText(source, 'copy-payload-20');
    fs.copyFileSync(source, target);
    expect(readText(target)).assertEqual('copy-payload-20');
    expect(fs.statSync(target).size).assertEqual(fs.statSync(source).size);
    fs.unlinkSync(source);
    expect(fs.accessSync(source)).assertFalse();
    expect(fs.statSync(target).size).assertEqual(15);
    expect(fs.listFileSync(dir).includes('copy_dst_20.txt')).assertTrue();
    fs.unlinkSync(target);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0126
   * @tc.name      testDraftIo0126
   * @tc.desc      Draft nested tree depth 1 run 1
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0126', 'nested 1-1');
    const dir: string = scratchDir();
    const root: string = dir + '/nested_1_1';
    fs.mkdirSync(root);
    const sub_1: string = root + '/level_1';
    fs.mkdirSync(sub_1);
    expect(fs.statSync(sub_1).isDirectory()).assertTrue();
    const file: string = sub_1 + '/leaf.txt';
    writeText(file, 'depth-1-run-1');
    expect(readText(file)).assertEqual('depth-1-run-1');
    expect(fs.listFileSync(sub_1).length).assertEqual(1);
    fs.unlinkSync(file);
    fs.rmdirSync(sub_1);
    fs.rmdirSync(root);
    expect(fs.accessSync(root)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0127
   * @tc.name      testDraftIo0127
   * @tc.desc      Draft nested tree depth 1 run 2
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0127', 'nested 1-2');
    const dir: string = scratchDir();
    const root: string = dir + '/nested_1_2';
    fs.mkdirSync(root);
    const sub_1: string = root + '/level_1';
    fs.mkdirSync(sub_1);
    expect(fs.statSync(sub_1).isDirectory()).assertTrue();
    const file: string = sub_1 + '/leaf.txt';
    writeText(file, 'depth-1-run-2');
    expect(readText(file)).assertEqual('depth-1-run-2');
    expect(fs.listFileSync(sub_1).length).assertEqual(1);
    fs.unlinkSync(file);
    fs.rmdirSync(sub_1);
    fs.rmdirSync(root);
    expect(fs.accessSync(root)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0128
   * @tc.name      testDraftIo0128
   * @tc.desc      Draft nested tree depth 1 run 3
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0128', 'nested 1-3');
    const dir: string = scratchDir();
    const root: string = dir + '/nested_1_3';
    fs.mkdirSync(root);
    const sub_1: string = root + '/level_1';
    fs.mkdirSync(sub_1);
    expect(fs.statSync(sub_1).isDirectory()).assertTrue();
    const file: string = sub_1 + '/leaf.txt';
    writeText(file, 'depth-1-run-3');
    expect(readText(file)).assertEqual('depth-1-run-3');
    expect(fs.listFileSync(sub_1).length).assertEqual(1);
    fs.unlinkSync(file);
    fs.rmdirSync(sub_1);
    fs.rmdirSync(root);
    expect(fs.accessSync(root)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0129
   * @tc.name      testDraftIo0129
   * @tc.desc      Draft nested tree depth 1 run 4
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0129', 'nested 1-4');
    const dir: string = scratchDir();
    const root: string = dir + '/nested_1_4';
    fs.mkdirSync(root);
    const sub_1: string = root + '/level_1';
    fs.mkdirSync(sub_1);
    expect(fs.statSync(sub_1).isDirectory()).assertTrue();
    const file: string = sub_1 + '/leaf.txt';
    writeText(file, 'depth-1-run-4');
    expect(readText(file)).assertEqual('depth-1-run-4');
    expect(fs.listFileSync(sub_1).length).assertEqual(1);
    fs.unlinkSync(file);
    fs.rmdirSync(sub_1);
    fs.rmdirSync(root);
    expect(fs.accessSync(root)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0130
   * @tc.name      testDraftIo0130
   * @tc.desc      Draft nested tree depth 1 run 5
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0130', 'nested 1-5');
    const dir: string = scratchDir();
    const root: string = dir + '/nested_1_5';
    fs.mkdirSync(root);
    const sub_1: string = root + '/level_1';
    fs.mkdirSync(sub_1);
    expect(fs.statSync(sub_1).isDirectory()).assertTrue();
    const file: string = sub_1 + '/leaf.txt';
    writeText(file, 'depth-1-run-5');
    expect(readText(file)).assertEqual('depth-1-run-5');
    expect(fs.listFileSync(sub_1).length).assertEqual(1);
    fs.unlinkSync(file);
    fs.rmdirSync(sub_1);
    fs.rmdirSync(root);
    expect(fs.accessSync(root)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0131
   * @tc.name      testDraftIo0131
   * @tc.desc      Draft nested tree depth 2 run 1
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0131', 'nested 2-1');
    const dir: string = scratchDir();
    const root: string = dir + '/nested_2_1';
    fs.mkdirSync(root);
    const sub_1: string = root + '/level_1';
    fs.mkdirSync(sub_1);
    expect(fs.statSync(sub_1).isDirectory()).assertTrue();
    const sub_2: string = sub_1 + '/level_2';
    fs.mkdirSync(sub_2);
    expect(fs.statSync(sub_2).isDirectory()).assertTrue();
    const file: string = sub_2 + '/leaf.txt';
    writeText(file, 'depth-2-run-1');
    expect(readText(file)).assertEqual('depth-2-run-1');
    expect(fs.listFileSync(sub_2).length).assertEqual(1);
    fs.unlinkSync(file);
    fs.rmdirSync(sub_2);
    fs.rmdirSync(sub_1);
    fs.rmdirSync(root);
    expect(fs.accessSync(root)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0132
   * @tc.name      testDraftIo0132
   * @tc.desc      Draft nested tree depth 2 run 2
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0132', 'nested 2-2');
    const dir: string = scratchDir();
    const root: string = dir + '/nested_2_2';
    fs.mkdirSync(root);
    const sub_1: string = root + '/level_1';
    fs.mkdirSync(sub_1);
    expect(fs.statSync(sub_1).isDirectory()).assertTrue();
    const sub_2: string = sub_1 + '/level_2';
    fs.mkdirSync(sub_2);
    expect(fs.statSync(sub_2).isDirectory()).assertTrue();
    const file: string = sub_2 + '/leaf.txt';
    writeText(file, 'depth-2-run-2');
    expect(readText(file)).assertEqual('depth-2-run-2');
    expect(fs.listFileSync(sub_2).length).assertEqual(1);
    fs.unlinkSync(file);
    fs.rmdirSync(sub_2);
    fs.rmdirSync(sub_1);
    fs.rmdirSync(root);
    expect(fs.accessSync(root)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0133
   * @tc.name      testDraftIo0133
   * @tc.desc      Draft nested tree depth 2 run 3
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0133', 'nested 2-3');
    const dir: string = scratchDir();
    const root: string = dir + '/nested_2_3';
    fs.mkdirSync(root);
    const sub_1: string = root + '/level_1';
    fs.mkdirSync(sub_1);
    expect(fs.statSync(sub_1).isDirectory()).assertTrue();
    const sub_2: string = sub_1 + '/level_2';
    fs.mkdirSync(sub_2);
    expect(fs.statSync(sub_2).isDirectory()).assertTrue();
    const file: string = sub_2 + '/leaf.txt';
    writeText(file, 'depth-2-run-3');
    expect(readText(file)).assertEqual('depth-2-run-3');
    expect(fs.listFileSync(sub_2).length).assertEqual(1);
    fs.unlinkSync(file);
    fs.rmdirSync(sub_2);
    fs.rmdirSync(sub_1);
    fs.rmdirSync(root);
    expect(fs.accessSync(root)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0134
   * @tc.name      testDraftIo0134
   * @tc.desc      Draft nested tree depth 2 run 4
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0134', 'nested 2-4');
    const dir: string = scratchDir();
    const root: string = dir + '/nested_2_4';
    fs.mkdirSync(root);
    const sub_1: string = root + '/level_1';
    fs.mkdirSync(sub_1);
    expect(fs.statSync(sub_1).isDirectory()).assertTrue();
    const sub_2: string = sub_1 + '/level_2';
    fs.mkdirSync(sub_2);
    expect(fs.statSync(sub_2).isDirectory()).assertTrue();
    const file: string = sub_2 + '/leaf.txt';
    writeText(file, 'depth-2-run-4');
    expect(readText(file)).assertEqual('depth-2-run-4');
    expect(fs.listFileSync(sub_2).length).assertEqual(1);
    fs.unlinkSync(file);
    fs.rmdirSync(sub_2);
    fs.rmdirSync(sub_1);
    fs.rmdirSync(root);
    expect(fs.accessSync(root)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0135
   * @tc.name      testDraftIo0135
   * @tc.desc      Draft nested tree depth 2 run 5
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0135', 'nested 2-5');
    const dir: string = scratchDir();
    const root: string = dir + '/nested_2_5';
    fs.mkdirSync(root);
    const sub_1: string = root + '/level_1';
    fs.mkdirSync(sub_1);
    expect(fs.statSync(sub_1).isDirectory()).assertTrue();
    const sub_2: string = sub_1 + '/level_2';
    fs.mkdirSync(sub_2);
    expect(fs.statSync(sub_2).isDirectory()).assertTrue();
    const file: string = sub_2 + '/leaf.txt';
    writeText(file, 'depth-2-run-5');
    expect(readText(file)).assertEqual('depth-2-run-5');
    expect(fs.listFileSync(sub_2).length).assertEqual(1);
    fs.unlinkSync(file);
    fs.rmdirSync(sub_2);
    fs.rmdirSync(sub_1);
    fs.rmdirSync(root);
    expect(fs.accessSync(root)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0136
   * @tc.name      testDraftIo0136
   * @tc.desc      Draft nested tree depth 3 run 1
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0136', 'nested 3-1');
    const dir: string = scratchDir();
    const root: string = dir + '/nested_3_1';
    fs.mkdirSync(root);
    const sub_1: string = root + '/level_1';
    fs.mkdirSync(sub_1);
    expect(fs.statSync(sub_1).isDirectory()).assertTrue();
    const sub_2: string = sub_1 + '/level_2';
    fs.mkdirSync(sub_2);
    expect(fs.statSync(sub_2).isDirectory()).assertTrue();
    const sub_3: string = sub_2 + '/level_3';
    fs.mkdirSync(sub_3);
    expect(fs.statSync(sub_3).isDirectory()).assertTrue();
    const file: string = sub_3 + '/leaf.txt';
    writeText(file, 'depth-3-run-1');
    expect(readText(file)).assertEqual('depth-3-run-1');
    expect(fs.listFileSync(sub_3).length).assertEqual(1);
    fs.unlinkSync(file);
    fs.rmdirSync(sub_3);
    fs.rmdirSync(sub_2);
    fs.rmdirSync(sub_1);
    fs.rmdirSync(root);
    expect(fs.accessSync(root)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0137
   * @tc.name      testDraftIo0137
   * @tc.desc      Draft nested tree depth 3 run 2
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0137', 'nested 3-2');
    const dir: string = scratchDir();
    const root: string = dir + '/nested_3_2';
    fs.mkdirSync(root);
    const sub_1: string = root + '/level_1';
    fs.mkdirSync(sub_1);
    expect(fs.statSync(sub_1).isDirectory()).assertTrue();
    const sub_2: string = sub_1 + '/level_2';
    fs.mkdirSync(sub_2);
    expect(fs.statSync(sub_2).isDirectory()).assertTrue();
    const sub_3: string = sub_2 + '/level_3';
    fs.mkdirSync(sub_3);
    expect(fs.statSync(sub_3).isDirectory()).assertTrue();
    const file: string = sub_3 + '/leaf.txt';
    writeText(file, 'depth-3-run-2');
    expect(readText(file)).assertEqual('depth-3-run-2');
    expect(fs.listFileSync(sub_3).length).assertEqual(1);
    fs.unlinkSync(file);
    fs.rmdirSync(sub_3);
    fs.rmdirSync(sub_2);
    fs.rmdirSync(sub_1);
    fs.rmdirSync(root);
    expect(fs.accessSync(root)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0138
   * @tc.name      testDraftIo0138
   * @tc.desc      Draft nested tree depth 3 run 3
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0138', 'nested 3-3');
    const dir: string = scratchDir();
    const root: string = dir + '/nested_3_3';
    fs.mkdirSync(root);
    const sub_1: string = root + '/level_1';
    fs.mkdirSync(sub_1);
    expect(fs.statSync(sub_1).isDirectory()).assertTrue();
    const sub_2: string = sub_1 + '/level_2';
    fs.mkdirSync(sub_2);
    expect(fs.statSync(sub_2).isDirectory()).assertTrue();
    const sub_3: string = sub_2 + '/level_3';
    fs.mkdirSync(sub_3);
    expect(fs.statSync(sub_3).isDirectory()).assertTrue();
    const file: string = sub_3 + '/leaf.txt';
    writeText(file, 'depth-3-run-3');
    expect(readText(file)).assertEqual('depth-3-run-3');
    expect(fs.listFileSync(sub_3).length).assertEqual(1);
    fs.unlinkSync(file);
    fs.rmdirSync(sub_3);
    fs.rmdirSync(sub_2);
    fs.rmdirSync(sub_1);
    fs.rmdirSync(root);
    expect(fs.accessSync(root)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0139
   * @tc.name      testDraftIo0139
   * @tc.desc      Draft nested tree depth 3 run 4
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0139', 'nested 3-4');
    const dir: string = scratchDir();
    const root: string = dir + '/nested_3_4';
    fs.mkdirSync(root);
    const sub_1: string = root + '/level_1';
    fs.mkdirSync(sub_1);
    expect(fs.statSync(sub_1).isDirectory()).assertTrue();
    const sub_2: string = sub_1 + '/level_2';
    fs.mkdirSync(sub_2);
    expect(fs.statSync(sub_2).isDirectory()).assertTrue();
    const sub_3: string = sub_2 + '/level_3';
    fs.mkdirSync(sub_3);
    expect(fs.statSync(sub_3).isDirectory()).assertTrue();
    const file: string = sub_3 + '/leaf.txt';
    writeText(file, 'depth-3-run-4');
    expect(readText(file)).assertEqual('depth-3-run-4');
    expect(fs.listFileSync(sub_3).length).assertEqual(1);
    fs.unlinkSync(file);
    fs.rmdirSync(sub_3);
    fs.rmdirSync(sub_2);
    fs.rmdirSync(sub_1);
    fs.rmdirSync(root);
    expect(fs.accessSync(root)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0140
   * @tc.name      testDraftIo0140
   * @tc.desc      Draft nested tree depth 3 run 5
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0140', 'nested 3-5');
    const dir: string = scratchDir();
    const root: string = dir + '/nested_3_5';
    fs.mkdirSync(root);
    const sub_1: string = root + '/level_1';
    fs.mkdirSync(sub_1);
    expect(fs.statSync(sub_1).isDirectory()).assertTrue();
    const sub_2: string = sub_1 + '/level_2';
    fs.mkdirSync(sub_2);
    expect(fs.statSync(sub_2).isDirectory()).assertTrue();
    const sub_3: string = sub_2 + '/level_3';
    fs.mkdirSync(sub_3);
    expect(fs.statSync(sub_3).isDirectory()).assertTrue();
    const file: string = sub_3 + '/leaf.txt';
    writeText(file, 'depth-3-run-5');
    expect(readText(file)).assertEqual('depth-3-run-5');
    expect(fs.listFileSync(sub_3).length).assertEqual(1);
    fs.unlinkSync(file);
    fs.rmdirSync(sub_3);
    fs.rmdirSync(sub_2);
    fs.rmdirSync(sub_1);
    fs.rmdirSync(root);
    expect(fs.accessSync(root)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0141
   * @tc.name      testDraftIo0141
   * @tc.desc      Draft batch holds 1 listed items
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0141', 'batch list 1');
    const dir: string = scratchDir();
    const box: string = dir + '/batch_01';
    fs.mkdirSync(box);
    writeText(box + '/item_01.txt', 'item-1');
    const names: string[] = fs.listFileSync(box);
    expect(names.length).assertEqual(1);
    expect(names.includes('item_01.txt')).assertTrue();
    expect(names[0]).assertEqual('item_01.txt');
    fs.unlinkSync(box + '/item_01.txt');
    expect(fs.listFileSync(box).length).assertEqual(0);
    fs.rmdirSync(box);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0142
   * @tc.name      testDraftIo0142
   * @tc.desc      Draft batch holds 2 listed items
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0142', 'batch list 2');
    const dir: string = scratchDir();
    const box: string = dir + '/batch_02';
    fs.mkdirSync(box);
    writeText(box + '/item_01.txt', 'item-1');
    writeText(box + '/item_02.txt', 'item-2');
    const names: string[] = fs.listFileSync(box);
    expect(names.length).assertEqual(2);
    expect(names.includes('item_01.txt')).assertTrue();
    expect(names.includes('item_02.txt')).assertTrue();
    fs.unlinkSync(box + '/item_01.txt');
    fs.unlinkSync(box + '/item_02.txt');
    expect(fs.listFileSync(box).length).assertEqual(0);
    fs.rmdirSync(box);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0143
   * @tc.name      testDraftIo0143
   * @tc.desc      Draft batch holds 3 listed items
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0143', 'batch list 3');
    const dir: string = scratchDir();
    const box: string = dir + '/batch_03';
    fs.mkdirSync(box);
    writeText(box + '/item_01.txt', 'item-1');
    writeText(box + '/item_02.txt', 'item-2');
    writeText(box + '/item_03.txt', 'item-3');
    const names: string[] = fs.listFileSync(box);
    expect(names.length).assertEqual(3);
    expect(names.includes('item_01.txt')).assertTrue();
    expect(names.includes('item_03.txt')).assertTrue();
    fs.unlinkSync(box + '/item_01.txt');
    fs.unlinkSync(box + '/item_02.txt');
    fs.unlinkSync(box + '/item_03.txt');
    expect(fs.listFileSync(box).length).assertEqual(0);
    fs.rmdirSync(box);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0144
   * @tc.name      testDraftIo0144
   * @tc.desc      Draft batch holds 4 listed items
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0144', 'batch list 4');
    const dir: string = scratchDir();
    const box: string = dir + '/batch_04';
    fs.mkdirSync(box);
    writeText(box + '/item_01.txt', 'item-1');
    writeText(box + '/item_02.txt', 'item-2');
    writeText(box + '/item_03.txt', 'item-3');
    writeText(box + '/item_04.txt', 'item-4');
    const names: string[] = fs.listFileSync(box);
    expect(names.length).assertEqual(4);
    expect(names.includes('item_01.txt')).assertTrue();
    expect(names.includes('item_04.txt')).assertTrue();
    fs.unlinkSync(box + '/item_01.txt');
    fs.unlinkSync(box + '/item_02.txt');
    fs.unlinkSync(box + '/item_03.txt');
    fs.unlinkSync(box + '/item_04.txt');
    expect(fs.listFileSync(box).length).assertEqual(0);
    fs.rmdirSync(box);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0145
   * @tc.name      testDraftIo0145
   * @tc.desc      Draft batch holds 5 listed items
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0145', 'batch list 5');
    const dir: string = scratchDir();
    const box: string = dir + '/batch_05';
    fs.mkdirSync(box);
    writeText(box + '/item_01.txt', 'item-1');
    writeText(box + '/item_02.txt', 'item-2');
    writeText(box + '/item_03.txt', 'item-3');
    writeText(box + '/item_04.txt', 'item-4');
    writeText(box + '/item_05.txt', 'item-5');
    const names: string[] = fs.listFileSync(box);
    expect(names.length).assertEqual(5);
    expect(names.includes('item_01.txt')).assertTrue();
    expect(names.includes('item_05.txt')).assertTrue();
    fs.unlinkSync(box + '/item_01.txt');
    fs.unlinkSync(box + '/item_02.txt');
    fs.unlinkSync(box + '/item_03.txt');
    fs.unlinkSync(box + '/item_04.txt');
    fs.unlinkSync(box + '/item_05.txt');
    expect(fs.listFileSync(box).length).assertEqual(0);
    fs.rmdirSync(box);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0146
   * @tc.name      testDraftIo0146
   * @tc.desc      Draft batch holds 6 listed items
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0146', 'batch list 6');
    const dir: string = scratchDir();
    const box: string = dir + '/batch_06';
    fs.mkdirSync(box);
    writeText(box + '/item_01.txt', 'item-1');
    writeText(box + '/item_02.txt', 'item-2');
    writeText(box + '/item_03.txt', 'item-3');
    writeText(box + '/item_04.txt', 'item-4');
    writeText(box + '/item_05.txt', 'item-5');
    writeText(box + '/item_06.txt', 'item-6');
    const names: string[] = fs.listFileSync(box);
    expect(names.length).assertEqual(6);
    expect(names.includes('item_01.txt')).assertTrue();
    expect(names.includes('item_06.txt')).assertTrue();
    fs.unlinkSync(box + '/item_01.txt');
    fs.unlinkSync(box + '/item_02.txt');
    fs.unlinkSync(box + '/item_03.txt');
    fs.unlinkSync(box + '/item_04.txt');
    fs.unlinkSync(box + '/item_05.txt');
    fs.unlinkSync(box + '/item_06.txt');
    expect(fs.listFileSync(box).length).assertEqual(0);
    fs.rmdirSync(box);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0147
   * @tc.name      testDraftIo0147
   * @tc.desc      Draft batch holds 7 listed items
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0147', 'batch list 7');
    const dir: string = scratchDir();
    const box: string = dir + '/batch_07';
    fs.mkdirSync(box);
    writeText(box + '/item_01.txt', 'item-1');
    writeText(box + '/item_02.txt', 'item-2');
    writeText(box + '/item_03.txt', 'item-3');
    writeText(box + '/item_04.txt', 'item-4');
    writeText(box + '/item_05.txt', 'item-5');
    writeText(box + '/item_06.txt', 'item-6');
    writeText(box + '/item_07.txt', 'item-7');
    const names: string[] = fs.listFileSync(box);
    expect(names.length).assertEqual(7);
    expect(names.includes('item_01.txt')).assertTrue();
    expect(names.includes('item_07.txt')).assertTrue();
    fs.unlinkSync(box + '/item_01.txt');
    fs.unlinkSync(box + '/item_02.txt');
    fs.unlinkSync(box + '/item_03.txt');
    fs.unlinkSync(box + '/item_04.txt');
    fs.unlinkSync(box + '/item_05.txt');
    fs.unlinkSync(box + '/item_06.txt');
    fs.unlinkSync(box + '/item_07.txt');
    expect(fs.listFileSync(box).length).assertEqual(0);
    fs.rmdirSync(box);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0148
   * @tc.name      testDraftIo0148
   * @tc.desc      Draft batch holds 8 listed items
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0148', 'batch list 8');
    const dir: string = scratchDir();
    const box: string = dir + '/batch_08';
    fs.mkdirSync(box);
    writeText(box + '/item_01.txt', 'item-1');
    writeText(box + '/item_02.txt', 'item-2');
    writeText(box + '/item_03.txt', 'item-3');
    writeText(box + '/item_04.txt', 'item-4');
    writeText(box + '/item_05.txt', 'item-5');
    writeText(box + '/item_06.txt', 'item-6');
    writeText(box + '/item_07.txt', 'item-7');
    writeText(box + '/item_08.txt', 'item-8');
    const names: string[] = fs.listFileSync(box);
    expect(names.length).assertEqual(8);
    expect(names.includes('item_01.txt')).assertTrue();
    expect(names.includes('item_08.txt')).assertTrue();
    fs.unlinkSync(box + '/item_01.txt');
    fs.unlinkSync(box + '/item_02.txt');
    fs.unlinkSync(box + '/item_03.txt');
    fs.unlinkSync(box + '/item_04.txt');
    fs.unlinkSync(box + '/item_05.txt');
    fs.unlinkSync(box + '/item_06.txt');
    fs.unlinkSync(box + '/item_07.txt');
    fs.unlinkSync(box + '/item_08.txt');
    expect(fs.listFileSync(box).length).assertEqual(0);
    fs.rmdirSync(box);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0149
   * @tc.name      testDraftIo0149
   * @tc.desc      Draft batch holds 9 listed items
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0149', 'batch list 9');
    const dir: string = scratchDir();
    const box: string = dir + '/batch_09';
    fs.mkdirSync(box);
    writeText(box + '/item_01.txt', 'item-1');
    writeText(box + '/item_02.txt', 'item-2');
    writeText(box + '/item_03.txt', 'item-3');
    writeText(box + '/item_04.txt', 'item-4');
    writeText(box + '/item_05.txt', 'item-5');
    writeText(box + '/item_06.txt', 'item-6');
    writeText(box + '/item_07.txt', 'item-7');
    writeText(box + '/item_08.txt', 'item-8');
    writeText(box + '/item_09.txt', 'item-9');
    const names: string[] = fs.listFileSync(box);
    expect(names.length).assertEqual(9);
    expect(names.includes('item_01.txt')).assertTrue();
    expect(names.includes('item_09.txt')).assertTrue();
    fs.unlinkSync(box + '/item_01.txt');
    fs.unlinkSync(box + '/item_02.txt');
    fs.unlinkSync(box + '/item_03.txt');
    fs.unlinkSync(box + '/item_04.txt');
    fs.unlinkSync(box + '/item_05.txt');
    fs.unlinkSync(box + '/item_06.txt');
    fs.unlinkSync(box + '/item_07.txt');
    fs.unlinkSync(box + '/item_08.txt');
    fs.unlinkSync(box + '/item_09.txt');
    expect(fs.listFileSync(box).length).assertEqual(0);
    fs.rmdirSync(box);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0150
   * @tc.name      testDraftIo0150
   * @tc.desc      Draft batch holds 10 listed items
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0150', 'batch list 10');
    const dir: string = scratchDir();
    const box: string = dir + '/batch_10';
    fs.mkdirSync(box);
    writeText(box + '/item_01.txt', 'item-1');
    writeText(box + '/item_02.txt', 'item-2');
    writeText(box + '/item_03.txt', 'item-3');
    writeText(box + '/item_04.txt', 'item-4');
    writeText(box + '/item_05.txt', 'item-5');
    writeText(box + '/item_06.txt', 'item-6');
    writeText(box + '/item_07.txt', 'item-7');
    writeText(box + '/item_08.txt', 'item-8');
    writeText(box + '/item_09.txt', 'item-9');
    writeText(box + '/item_10.txt', 'item-10');
    const names: string[] = fs.listFileSync(box);
    expect(names.length).assertEqual(10);
    expect(names.includes('item_01.txt')).assertTrue();
    expect(names.includes('item_10.txt')).assertTrue();
    fs.unlinkSync(box + '/item_01.txt');
    fs.unlinkSync(box + '/item_02.txt');
    fs.unlinkSync(box + '/item_03.txt');
    fs.unlinkSync(box + '/item_04.txt');
    fs.unlinkSync(box + '/item_05.txt');
    fs.unlinkSync(box + '/item_06.txt');
    fs.unlinkSync(box + '/item_07.txt');
    fs.unlinkSync(box + '/item_08.txt');
    fs.unlinkSync(box + '/item_09.txt');
    fs.unlinkSync(box + '/item_10.txt');
    expect(fs.listFileSync(box).length).assertEqual(0);
    fs.rmdirSync(box);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0151
   * @tc.name      testDraftIo0151
   * @tc.desc      Draft batch holds 11 listed items
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0151', 'batch list 11');
    const dir: string = scratchDir();
    const box: string = dir + '/batch_11';
    fs.mkdirSync(box);
    writeText(box + '/item_01.txt', 'item-1');
    writeText(box + '/item_02.txt', 'item-2');
    writeText(box + '/item_03.txt', 'item-3');
    writeText(box + '/item_04.txt', 'item-4');
    writeText(box + '/item_05.txt', 'item-5');
    writeText(box + '/item_06.txt', 'item-6');
    writeText(box + '/item_07.txt', 'item-7');
    writeText(box + '/item_08.txt', 'item-8');
    writeText(box + '/item_09.txt', 'item-9');
    writeText(box + '/item_10.txt', 'item-10');
    writeText(box + '/item_11.txt', 'item-11');
    const names: string[] = fs.listFileSync(box);
    expect(names.length).assertEqual(11);
    expect(names.includes('item_01.txt')).assertTrue();
    expect(names.includes('item_11.txt')).assertTrue();
    fs.unlinkSync(box + '/item_01.txt');
    fs.unlinkSync(box + '/item_02.txt');
    fs.unlinkSync(box + '/item_03.txt');
    fs.unlinkSync(box + '/item_04.txt');
    fs.unlinkSync(box + '/item_05.txt');
    fs.unlinkSync(box + '/item_06.txt');
    fs.unlinkSync(box + '/item_07.txt');
    fs.unlinkSync(box + '/item_08.txt');
    fs.unlinkSync(box + '/item_09.txt');
    fs.unlinkSync(box + '/item_10.txt');
    fs.unlinkSync(box + '/item_11.txt');
    expect(fs.listFileSync(box).length).assertEqual(0);
    fs.rmdirSync(box);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0152
   * @tc.name      testDraftIo0152
   * @tc.desc      Draft batch holds 12 listed items
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0152', 'batch list 12');
    const dir: string = scratchDir();
    const box: string = dir + '/batch_12';
    fs.mkdirSync(box);
    writeText(box + '/item_01.txt', 'item-1');
    writeText(box + '/item_02.txt', 'item-2');
    writeText(box + '/item_03.txt', 'item-3');
    writeText(box + '/item_04.txt', 'item-4');
    writeText(box + '/item_05.txt', 'item-5');
    writeText(box + '/item_06.txt', 'item-6');
    writeText(box + '/item_07.txt', 'item-7');
    writeText(box + '/item_08.txt', 'item-8');
    writeText(box + '/item_09.txt', 'item-9');
    writeText(box + '/item_10.txt', 'item-10');
    writeText(box + '/item_11.txt', 'item-11');
    writeText(box + '/item_12.txt', 'item-12');
    const names: string[] = fs.listFileSync(box);
    expect(names.length).assertEqual(12);
    expect(names.includes('item_01.txt')).assertTrue();
    expect(names.includes('item_12.txt')).assertTrue();
    fs.unlinkSync(box + '/item_01.txt');
    fs.unlinkSync(box + '/item_02.txt');
    fs.unlinkSync(box + '/item_03.txt');
    fs.unlinkSync(box + '/item_04.txt');
    fs.unlinkSync(box + '/item_05.txt');
    fs.unlinkSync(box + '/item_06.txt');
    fs.unlinkSync(box + '/item_07.txt');
    fs.unlinkSync(box + '/item_08.txt');
    fs.unlinkSync(box + '/item_09.txt');
    fs.unlinkSync(box + '/item_10.txt');
    fs.unlinkSync(box + '/item_11.txt');
    fs.unlinkSync(box + '/item_12.txt');
    expect(fs.listFileSync(box).length).assertEqual(0);
    fs.rmdirSync(box);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0153
   * @tc.name      testDraftIo0153
   * @tc.desc      Draft holds special quote case 1
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0153', 'quote 1');
    const dir: string = scratchDir();
    const path: string = dir + '/special_quote_1.txt';
    writeText(path, "it's-1");
    const text: string = readText(path);
    expect(text).assertEqual("it's-1");
    expect(text.length).assertEqual(6);
    expect(fs.statSync(path).size).assertEqual(6);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0154
   * @tc.name      testDraftIo0154
   * @tc.desc      Draft holds special quote case 2
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0154', 'quote 2');
    const dir: string = scratchDir();
    const path: string = dir + '/special_quote_2.txt';
    writeText(path, "it's-2");
    const text: string = readText(path);
    expect(text).assertEqual("it's-2");
    expect(text.length).assertEqual(6);
    expect(fs.statSync(path).size).assertEqual(6);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0155
   * @tc.name      testDraftIo0155
   * @tc.desc      Draft holds special quote case 3
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0155', 'quote 3');
    const dir: string = scratchDir();
    const path: string = dir + '/special_quote_3.txt';
    writeText(path, "it's-3");
    const text: string = readText(path);
    expect(text).assertEqual("it's-3");
    expect(text.length).assertEqual(6);
    expect(fs.statSync(path).size).assertEqual(6);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0156
   * @tc.name      testDraftIo0156
   * @tc.desc      Draft holds special backslash case 1
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0156', 'backslash 1');
    const dir: string = scratchDir();
    const path: string = dir + '/special_backslash_1.txt';
    writeText(path, "path\\to\\1");
    const text: string = readText(path);
    expect(text).assertEqual("path\\to\\1");
    expect(text.length).assertEqual(9);
    expect(fs.statSync(path).size).assertEqual(9);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0157
   * @tc.name      testDraftIo0157
   * @tc.desc      Draft holds special backslash case 2
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0157', 'backslash 2');
    const dir: string = scratchDir();
    const path: string = dir + '/special_backslash_2.txt';
    writeText(path, "path\\to\\2");
    const text: string = readText(path);
    expect(text).assertEqual("path\\to\\2");
    expect(text.length).assertEqual(9);
    expect(fs.statSync(path).size).assertEqual(9);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0158
   * @tc.name      testDraftIo0158
   * @tc.desc      Draft holds special backslash case 3
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0158', 'backslash 3');
    const dir: string = scratchDir();
    const path: string = dir + '/special_backslash_3.txt';
    writeText(path, "path\\to\\3");
    const text: string = readText(path);
    expect(text).assertEqual("path\\to\\3");
    expect(text.length).assertEqual(9);
    expect(fs.statSync(path).size).assertEqual(9);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0159
   * @tc.name      testDraftIo0159
   * @tc.desc      Draft holds special tab case 1
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0159', 'tab 1');
    const dir: string = scratchDir();
    const path: string = dir + '/special_tab_1.txt';
    writeText(path, "col-a-1\tcol-b-1");
    const text: string = readText(path);
    expect(text).assertEqual("col-a-1\tcol-b-1");
    expect(text.length).assertEqual(15);
    expect(fs.statSync(path).size).assertEqual(15);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0160
   * @tc.name      testDraftIo0160
   * @tc.desc      Draft holds special tab case 2
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0160', 'tab 2');
    const dir: string = scratchDir();
    const path: string = dir + '/special_tab_2.txt';
    writeText(path, "col-a-2\tcol-b-2");
    const text: string = readText(path);
    expect(text).assertEqual("col-a-2\tcol-b-2");
    expect(text.length).assertEqual(15);
    expect(fs.statSync(path).size).assertEqual(15);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0161
   * @tc.name      testDraftIo0161
   * @tc.desc      Draft holds special tab case 3
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0161', 'tab 3');
    const dir: string = scratchDir();
    const path: string = dir + '/special_tab_3.txt';
    writeText(path, "col-a-3\tcol-b-3");
    const text: string = readText(path);
    expect(text).assertEqual("col-a-3\tcol-b-3");
    expect(text.length).assertEqual(15);
    expect(fs.statSync(path).size).assertEqual(15);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0162
   * @tc.name      testDraftIo0162
   * @tc.desc      Draft holds special newline case 1
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0162', 'newline 1');
    const dir: string = scratchDir();
    const path: string = dir + '/special_newline_1.txt';
    writeText(path, "line-a-1\nline-b-1");
    const text: string = readText(path);
    expect(text).assertEqual("line-a-1\nline-b-1");
    expect(text.length).assertEqual(17);
    expect(fs.statSync(path).size).assertEqual(17);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0163
   * @tc.name      testDraftIo0163
   * @tc.desc      Draft holds special newline case 2
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0163', 'newline 2');
    const dir: string = scratchDir();
    const path: string = dir + '/special_newline_2.txt';
    writeText(path, "line-a-2\nline-b-2");
    const text: string = readText(path);
    expect(text).assertEqual("line-a-2\nline-b-2");
    expect(text.length).assertEqual(17);
    expect(fs.statSync(path).size).assertEqual(17);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0164
   * @tc.name      testDraftIo0164
   * @tc.desc      Draft holds special newline case 3
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0164', 'newline 3');
    const dir: string = scratchDir();
    const path: string = dir + '/special_newline_3.txt';
    writeText(path, "line-a-3\nline-b-3");
    const text: string = readText(path);
    expect(text).assertEqual("line-a-3\nline-b-3");
    expect(text.length).assertEqual(17);
    expect(fs.statSync(path).size).assertEqual(17);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0165
   * @tc.name      testDraftIo0165
   * @tc.desc      Draft holds special mix case 1
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0165', 'mix 1');
    const dir: string = scratchDir();
    const path: string = dir + '/special_mix_1.txt';
    writeText(path, "mix-1\\x\t\n");
    const text: string = readText(path);
    expect(text).assertEqual("mix-1\\x\t\n");
    expect(text.length).assertEqual(9);
    expect(fs.statSync(path).size).assertEqual(9);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0166
   * @tc.name      testDraftIo0166
   * @tc.desc      Draft holds special mix case 2
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0166', 'mix 2');
    const dir: string = scratchDir();
    const path: string = dir + '/special_mix_2.txt';
    writeText(path, "mix-2\\x\t\n");
    const text: string = readText(path);
    expect(text).assertEqual("mix-2\\x\t\n");
    expect(text.length).assertEqual(9);
    expect(fs.statSync(path).size).assertEqual(9);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0167
   * @tc.name      testDraftIo0167
   * @tc.desc      Draft holds special mix case 3
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0167', 'mix 3');
    const dir: string = scratchDir();
    const path: string = dir + '/special_mix_3.txt';
    writeText(path, "mix-3\\x\t\n");
    const text: string = readText(path);
    expect(text).assertEqual("mix-3\\x\t\n");
    expect(text.length).assertEqual(9);
    expect(fs.statSync(path).size).assertEqual(9);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0168
   * @tc.name      testDraftIo0168
   * @tc.desc      Draft move pass 1 crosses directories
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0168', 'move 1');
    const dir: string = scratchDir();
    const fromDir: string = dir + '/move_from_01';
    const toDir: string = dir + '/move_to_01';
    fs.mkdirSync(fromDir);
    fs.mkdirSync(toDir);
    const source: string = fromDir + '/payload.txt';
    writeText(source, 'move-body-1');
    const target: string = toDir + '/payload.txt';
    fs.renameSync(source, target);
    expect(fs.listFileSync(fromDir).length).assertEqual(0);
    expect(fs.listFileSync(toDir).length).assertEqual(1);
    expect(readText(target)).assertEqual('move-body-1');
    fs.unlinkSync(target);
    fs.rmdirSync(fromDir);
    fs.rmdirSync(toDir);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0169
   * @tc.name      testDraftIo0169
   * @tc.desc      Draft move pass 2 crosses directories
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0169', 'move 2');
    const dir: string = scratchDir();
    const fromDir: string = dir + '/move_from_02';
    const toDir: string = dir + '/move_to_02';
    fs.mkdirSync(fromDir);
    fs.mkdirSync(toDir);
    const source: string = fromDir + '/payload.txt';
    writeText(source, 'move-body-2');
    const target: string = toDir + '/payload.txt';
    fs.renameSync(source, target);
    expect(fs.listFileSync(fromDir).length).assertEqual(0);
    expect(fs.listFileSync(toDir).length).assertEqual(1);
    expect(readText(target)).assertEqual('move-body-2');
    fs.unlinkSync(target);
    fs.rmdirSync(fromDir);
    fs.rmdirSync(toDir);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0170
   * @tc.name      testDraftIo0170
   * @tc.desc      Draft move pass 3 crosses directories
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0170', 'move 3');
    const dir: string = scratchDir();
    const fromDir: string = dir + '/move_from_03';
    const toDir: string = dir + '/move_to_03';
    fs.mkdirSync(fromDir);
    fs.mkdirSync(toDir);
    const source: string = fromDir + '/payload.txt';
    writeText(source, 'move-body-3');
    const target: string = toDir + '/payload.txt';
    fs.renameSync(source, target);
    expect(fs.listFileSync(fromDir).length).assertEqual(0);
    expect(fs.listFileSync(toDir).length).assertEqual(1);
    expect(readText(target)).assertEqual('move-body-3');
    fs.unlinkSync(target);
    fs.rmdirSync(fromDir);
    fs.rmdirSync(toDir);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0171
   * @tc.name      testDraftIo0171
   * @tc.desc      Draft move pass 4 crosses directories
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0171', 'move 4');
    const dir: string = scratchDir();
    const fromDir: string = dir + '/move_from_04';
    const toDir: string = dir + '/move_to_04';
    fs.mkdirSync(fromDir);
    fs.mkdirSync(toDir);
    const source: string = fromDir + '/payload.txt';
    writeText(source, 'move-body-4');
    const target: string = toDir + '/payload.txt';
    fs.renameSync(source, target);
    expect(fs.listFileSync(fromDir).length).assertEqual(0);
    expect(fs.listFileSync(toDir).length).assertEqual(1);
    expect(readText(target)).assertEqual('move-body-4');
    fs.unlinkSync(target);
    fs.rmdirSync(fromDir);
    fs.rmdirSync(toDir);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0172
   * @tc.name      testDraftIo0172
   * @tc.desc      Draft move pass 5 crosses directories
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0172', 'move 5');
    const dir: string = scratchDir();
    const fromDir: string = dir + '/move_from_05';
    const toDir: string = dir + '/move_to_05';
    fs.mkdirSync(fromDir);
    fs.mkdirSync(toDir);
    const source: string = fromDir + '/payload.txt';
    writeText(source, 'move-body-5');
    const target: string = toDir + '/payload.txt';
    fs.renameSync(source, target);
    expect(fs.listFileSync(fromDir).length).assertEqual(0);
    expect(fs.listFileSync(toDir).length).assertEqual(1);
    expect(readText(target)).assertEqual('move-body-5');
    fs.unlinkSync(target);
    fs.rmdirSync(fromDir);
    fs.rmdirSync(toDir);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0173
   * @tc.name      testDraftIo0173
   * @tc.desc      Draft move pass 6 crosses directories
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0173', 'move 6');
    const dir: string = scratchDir();
    const fromDir: string = dir + '/move_from_06';
    const toDir: string = dir + '/move_to_06';
    fs.mkdirSync(fromDir);
    fs.mkdirSync(toDir);
    const source: string = fromDir + '/payload.txt';
    writeText(source, 'move-body-6');
    const target: string = toDir + '/payload.txt';
    fs.renameSync(source, target);
    expect(fs.listFileSync(fromDir).length).assertEqual(0);
    expect(fs.listFileSync(toDir).length).assertEqual(1);
    expect(readText(target)).assertEqual('move-body-6');
    fs.unlinkSync(target);
    fs.rmdirSync(fromDir);
    fs.rmdirSync(toDir);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0174
   * @tc.name      testDraftIo0174
   * @tc.desc      Draft move pass 7 crosses directories
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0174', 'move 7');
    const dir: string = scratchDir();
    const fromDir: string = dir + '/move_from_07';
    const toDir: string = dir + '/move_to_07';
    fs.mkdirSync(fromDir);
    fs.mkdirSync(toDir);
    const source: string = fromDir + '/payload.txt';
    writeText(source, 'move-body-7');
    const target: string = toDir + '/payload.txt';
    fs.renameSync(source, target);
    expect(fs.listFileSync(fromDir).length).assertEqual(0);
    expect(fs.listFileSync(toDir).length).assertEqual(1);
    expect(readText(target)).assertEqual('move-body-7');
    fs.unlinkSync(target);
    fs.rmdirSync(fromDir);
    fs.rmdirSync(toDir);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0175
   * @tc.name      testDraftIo0175
   * @tc.desc      Draft move pass 8 crosses directories
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0175', 'move 8');
    const dir: string = scratchDir();
    const fromDir: string = dir + '/move_from_08';
    const toDir: string = dir + '/move_to_08';
    fs.mkdirSync(fromDir);
    fs.mkdirSync(toDir);
    const source: string = fromDir + '/payload.txt';
    writeText(source, 'move-body-8');
    const target: string = toDir + '/payload.txt';
    fs.renameSync(source, target);
    expect(fs.listFileSync(fromDir).length).assertEqual(0);
    expect(fs.listFileSync(toDir).length).assertEqual(1);
    expect(readText(target)).assertEqual('move-body-8');
    fs.unlinkSync(target);
    fs.rmdirSync(fromDir);
    fs.rmdirSync(toDir);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0176
   * @tc.name      testDraftIo0176
   * @tc.desc      Draft move pass 9 crosses directories
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0176', 'move 9');
    const dir: string = scratchDir();
    const fromDir: string = dir + '/move_from_09';
    const toDir: string = dir + '/move_to_09';
    fs.mkdirSync(fromDir);
    fs.mkdirSync(toDir);
    const source: string = fromDir + '/payload.txt';
    writeText(source, 'move-body-9');
    const target: string = toDir + '/payload.txt';
    fs.renameSync(source, target);
    expect(fs.listFileSync(fromDir).length).assertEqual(0);
    expect(fs.listFileSync(toDir).length).assertEqual(1);
    expect(readText(target)).assertEqual('move-body-9');
    fs.unlinkSync(target);
    fs.rmdirSync(fromDir);
    fs.rmdirSync(toDir);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0177
   * @tc.name      testDraftIo0177
   * @tc.desc      Draft move pass 10 crosses directories
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0177', 'move 10');
    const dir: string = scratchDir();
    const fromDir: string = dir + '/move_from_10';
    const toDir: string = dir + '/move_to_10';
    fs.mkdirSync(fromDir);
    fs.mkdirSync(toDir);
    const source: string = fromDir + '/payload.txt';
    writeText(source, 'move-body-10');
    const target: string = toDir + '/payload.txt';
    fs.renameSync(source, target);
    expect(fs.listFileSync(fromDir).length).assertEqual(0);
    expect(fs.listFileSync(toDir).length).assertEqual(1);
    expect(readText(target)).assertEqual('move-body-10');
    fs.unlinkSync(target);
    fs.rmdirSync(fromDir);
    fs.rmdirSync(toDir);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0178
   * @tc.name      testDraftIo0178
   * @tc.desc      Draft move pass 11 crosses directories
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0178', 'move 11');
    const dir: string = scratchDir();
    const fromDir: string = dir + '/move_from_11';
    const toDir: string = dir + '/move_to_11';
    fs.mkdirSync(fromDir);
    fs.mkdirSync(toDir);
    const source: string = fromDir + '/payload.txt';
    writeText(source, 'move-body-11');
    const target: string = toDir + '/payload.txt';
    fs.renameSync(source, target);
    expect(fs.listFileSync(fromDir).length).assertEqual(0);
    expect(fs.listFileSync(toDir).length).assertEqual(1);
    expect(readText(target)).assertEqual('move-body-11');
    fs.unlinkSync(target);
    fs.rmdirSync(fromDir);
    fs.rmdirSync(toDir);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0179
   * @tc.name      testDraftIo0179
   * @tc.desc      Draft move pass 12 crosses directories
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0179', 'move 12');
    const dir: string = scratchDir();
    const fromDir: string = dir + '/move_from_12';
    const toDir: string = dir + '/move_to_12';
    fs.mkdirSync(fromDir);
    fs.mkdirSync(toDir);
    const source: string = fromDir + '/payload.txt';
    writeText(source, 'move-body-12');
    const target: string = toDir + '/payload.txt';
    fs.renameSync(source, target);
    expect(fs.listFileSync(fromDir).length).assertEqual(0);
    expect(fs.listFileSync(toDir).length).assertEqual(1);
    expect(readText(target)).assertEqual('move-body-12');
    fs.unlinkSync(target);
    fs.rmdirSync(fromDir);
    fs.rmdirSync(toDir);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0180
   * @tc.name      testDraftIo0180
   * @tc.desc      Draft move pass 13 crosses directories
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0180', 'move 13');
    const dir: string = scratchDir();
    const fromDir: string = dir + '/move_from_13';
    const toDir: string = dir + '/move_to_13';
    fs.mkdirSync(fromDir);
    fs.mkdirSync(toDir);
    const source: string = fromDir + '/payload.txt';
    writeText(source, 'move-body-13');
    const target: string = toDir + '/payload.txt';
    fs.renameSync(source, target);
    expect(fs.listFileSync(fromDir).length).assertEqual(0);
    expect(fs.listFileSync(toDir).length).assertEqual(1);
    expect(readText(target)).assertEqual('move-body-13');
    fs.unlinkSync(target);
    fs.rmdirSync(fromDir);
    fs.rmdirSync(toDir);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0181
   * @tc.name      testDraftIo0181
   * @tc.desc      Draft move pass 14 crosses directories
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0181', 'move 14');
    const dir: string = scratchDir();
    const fromDir: string = dir + '/move_from_14';
    const toDir: string = dir + '/move_to_14';
    fs.mkdirSync(fromDir);
    fs.mkdirSync(toDir);
    const source: string = fromDir + '/payload.txt';
    writeText(source, 'move-body-14');
    const target: string = toDir + '/payload.txt';
    fs.renameSync(source, target);
    expect(fs.listFileSync(fromDir).length).assertEqual(0);
    expect(fs.listFileSync(toDir).length).assertEqual(1);
    expect(readText(target)).assertEqual('move-body-14');
    fs.unlinkSync(target);
    fs.rmdirSync(fromDir);
    fs.rmdirSync(toDir);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0182
   * @tc.name      testDraftIo0182
   * @tc.desc      Draft move pass 15 crosses directories
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0182', 'move 15');
    const dir: string = scratchDir();
    const fromDir: string = dir + '/move_from_15';
    const toDir: string = dir + '/move_to_15';
    fs.mkdirSync(fromDir);
    fs.mkdirSync(toDir);
    const source: string = fromDir + '/payload.txt';
    writeText(source, 'move-body-15');
    const target: string = toDir + '/payload.txt';
    fs.renameSync(source, target);
    expect(fs.listFileSync(fromDir).length).assertEqual(0);
    expect(fs.listFileSync(toDir).length).assertEqual(1);
    expect(readText(target)).assertEqual('move-body-15');
    fs.unlinkSync(target);
    fs.rmdirSync(fromDir);
    fs.rmdirSync(toDir);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0183
   * @tc.name      testDraftIo0183
   * @tc.desc      Draft stat pass 1 matches body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0183', 'stat 1');
    const dir: string = scratchDir();
    const path: string = dir + '/stat_01.txt';
    writeText(path, 'stat-1');
    const stat: fs.Stat = fs.statSync(path);
    expect(stat.isFile()).assertTrue();
    expect(stat.isDirectory()).assertFalse();
    expect(stat.size).assertEqual(6);
    expect(stat.size).assertEqual(readText(path).length);
    expect(stat.mtime > 0).assertTrue();
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0184
   * @tc.name      testDraftIo0184
   * @tc.desc      Draft stat pass 2 matches body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0184', 'stat 2');
    const dir: string = scratchDir();
    const path: string = dir + '/stat_02.txt';
    writeText(path, 'stat-2');
    const stat: fs.Stat = fs.statSync(path);
    expect(stat.isFile()).assertTrue();
    expect(stat.isDirectory()).assertFalse();
    expect(stat.size).assertEqual(6);
    expect(stat.size).assertEqual(readText(path).length);
    expect(stat.mtime > 0).assertTrue();
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0185
   * @tc.name      testDraftIo0185
   * @tc.desc      Draft stat pass 3 matches body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0185', 'stat 3');
    const dir: string = scratchDir();
    const path: string = dir + '/stat_03.txt';
    writeText(path, 'stat-3');
    const stat: fs.Stat = fs.statSync(path);
    expect(stat.isFile()).assertTrue();
    expect(stat.isDirectory()).assertFalse();
    expect(stat.size).assertEqual(6);
    expect(stat.size).assertEqual(readText(path).length);
    expect(stat.mtime > 0).assertTrue();
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0186
   * @tc.name      testDraftIo0186
   * @tc.desc      Draft stat pass 4 matches body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0186', 'stat 4');
    const dir: string = scratchDir();
    const path: string = dir + '/stat_04.txt';
    writeText(path, 'stat-4');
    const stat: fs.Stat = fs.statSync(path);
    expect(stat.isFile()).assertTrue();
    expect(stat.isDirectory()).assertFalse();
    expect(stat.size).assertEqual(6);
    expect(stat.size).assertEqual(readText(path).length);
    expect(stat.mtime > 0).assertTrue();
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0187
   * @tc.name      testDraftIo0187
   * @tc.desc      Draft stat pass 5 matches body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0187', 'stat 5');
    const dir: string = scratchDir();
    const path: string = dir + '/stat_05.txt';
    writeText(path, 'stat-5');
    const stat: fs.Stat = fs.statSync(path);
    expect(stat.isFile()).assertTrue();
    expect(stat.isDirectory()).assertFalse();
    expect(stat.size).assertEqual(6);
    expect(stat.size).assertEqual(readText(path).length);
    expect(stat.mtime > 0).assertTrue();
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0188
   * @tc.name      testDraftIo0188
   * @tc.desc      Draft stat pass 6 matches body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0188', 'stat 6');
    const dir: string = scratchDir();
    const path: string = dir + '/stat_06.txt';
    writeText(path, 'stat-6');
    const stat: fs.Stat = fs.statSync(path);
    expect(stat.isFile()).assertTrue();
    expect(stat.isDirectory()).assertFalse();
    expect(stat.size).assertEqual(6);
    expect(stat.size).assertEqual(readText(path).length);
    expect(stat.mtime > 0).assertTrue();
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0189
   * @tc.name      testDraftIo0189
   * @tc.desc      Draft stat pass 7 matches body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0189', 'stat 7');
    const dir: string = scratchDir();
    const path: string = dir + '/stat_07.txt';
    writeText(path, 'stat-7');
    const stat: fs.Stat = fs.statSync(path);
    expect(stat.isFile()).assertTrue();
    expect(stat.isDirectory()).assertFalse();
    expect(stat.size).assertEqual(6);
    expect(stat.size).assertEqual(readText(path).length);
    expect(stat.mtime > 0).assertTrue();
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0190
   * @tc.name      testDraftIo0190
   * @tc.desc      Draft stat pass 8 matches body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0190', 'stat 8');
    const dir: string = scratchDir();
    const path: string = dir + '/stat_08.txt';
    writeText(path, 'stat-8');
    const stat: fs.Stat = fs.statSync(path);
    expect(stat.isFile()).assertTrue();
    expect(stat.isDirectory()).assertFalse();
    expect(stat.size).assertEqual(6);
    expect(stat.size).assertEqual(readText(path).length);
    expect(stat.mtime > 0).assertTrue();
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0191
   * @tc.name      testDraftIo0191
   * @tc.desc      Draft stat pass 9 matches body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0191', 'stat 9');
    const dir: string = scratchDir();
    const path: string = dir + '/stat_09.txt';
    writeText(path, 'stat-9');
    const stat: fs.Stat = fs.statSync(path);
    expect(stat.isFile()).assertTrue();
    expect(stat.isDirectory()).assertFalse();
    expect(stat.size).assertEqual(6);
    expect(stat.size).assertEqual(readText(path).length);
    expect(stat.mtime > 0).assertTrue();
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0192
   * @tc.name      testDraftIo0192
   * @tc.desc      Draft stat pass 10 matches body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0192', 'stat 10');
    const dir: string = scratchDir();
    const path: string = dir + '/stat_10.txt';
    writeText(path, 'stat-10');
    const stat: fs.Stat = fs.statSync(path);
    expect(stat.isFile()).assertTrue();
    expect(stat.isDirectory()).assertFalse();
    expect(stat.size).assertEqual(7);
    expect(stat.size).assertEqual(readText(path).length);
    expect(stat.mtime > 0).assertTrue();
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0193
   * @tc.name      testDraftIo0193
   * @tc.desc      Draft stat pass 11 matches body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0193', 'stat 11');
    const dir: string = scratchDir();
    const path: string = dir + '/stat_11.txt';
    writeText(path, 'stat-11');
    const stat: fs.Stat = fs.statSync(path);
    expect(stat.isFile()).assertTrue();
    expect(stat.isDirectory()).assertFalse();
    expect(stat.size).assertEqual(7);
    expect(stat.size).assertEqual(readText(path).length);
    expect(stat.mtime > 0).assertTrue();
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0194
   * @tc.name      testDraftIo0194
   * @tc.desc      Draft stat pass 12 matches body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0194', 'stat 12');
    const dir: string = scratchDir();
    const path: string = dir + '/stat_12.txt';
    writeText(path, 'stat-12');
    const stat: fs.Stat = fs.statSync(path);
    expect(stat.isFile()).assertTrue();
    expect(stat.isDirectory()).assertFalse();
    expect(stat.size).assertEqual(7);
    expect(stat.size).assertEqual(readText(path).length);
    expect(stat.mtime > 0).assertTrue();
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0195
   * @tc.name      testDraftIo0195
   * @tc.desc      Draft stat pass 13 matches body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0195', 'stat 13');
    const dir: string = scratchDir();
    const path: string = dir + '/stat_13.txt';
    writeText(path, 'stat-13');
    const stat: fs.Stat = fs.statSync(path);
    expect(stat.isFile()).assertTrue();
    expect(stat.isDirectory()).assertFalse();
    expect(stat.size).assertEqual(7);
    expect(stat.size).assertEqual(readText(path).length);
    expect(stat.mtime > 0).assertTrue();
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0196
   * @tc.name      testDraftIo0196
   * @tc.desc      Draft stat pass 14 matches body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0196', 'stat 14');
    const dir: string = scratchDir();
    const path: string = dir + '/stat_14.txt';
    writeText(path, 'stat-14');
    const stat: fs.Stat = fs.statSync(path);
    expect(stat.isFile()).assertTrue();
    expect(stat.isDirectory()).assertFalse();
    expect(stat.size).assertEqual(7);
    expect(stat.size).assertEqual(readText(path).length);
    expect(stat.mtime > 0).assertTrue();
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0197
   * @tc.name      testDraftIo0197
   * @tc.desc      Draft stat pass 15 matches body
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0197', 'stat 15');
    const dir: string = scratchDir();
    const path: string = dir + '/stat_15.txt';
    writeText(path, 'stat-15');
    const stat: fs.Stat = fs.statSync(path);
    expect(stat.isFile()).assertTrue();
    expect(stat.isDirectory()).assertFalse();
    expect(stat.size).assertEqual(7);
    expect(stat.size).assertEqual(readText(path).length);
    expect(stat.mtime > 0).assertTrue();
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0198
   * @tc.name      testDraftIo0198
   * @tc.desc      Draft access pass 1 flips
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0198', 'access 1');
    const dir: string = scratchDir();
    const path: string = dir + '/access_01.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    expect(fs.accessSync(path)).assertFalse();
    writeText(path, 'access-1');
    expect(fs.accessSync(path)).assertTrue();
    expect(fs.accessSync(dir)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.listFileSync(dir).includes('access_01.txt')).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0199
   * @tc.name      testDraftIo0199
   * @tc.desc      Draft access pass 2 flips
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0199', 'access 2');
    const dir: string = scratchDir();
    const path: string = dir + '/access_02.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    expect(fs.accessSync(path)).assertFalse();
    writeText(path, 'access-2');
    expect(fs.accessSync(path)).assertTrue();
    expect(fs.accessSync(dir)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.listFileSync(dir).includes('access_02.txt')).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0200
   * @tc.name      testDraftIo0200
   * @tc.desc      Draft access pass 3 flips
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0200', 'access 3');
    const dir: string = scratchDir();
    const path: string = dir + '/access_03.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    expect(fs.accessSync(path)).assertFalse();
    writeText(path, 'access-3');
    expect(fs.accessSync(path)).assertTrue();
    expect(fs.accessSync(dir)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.listFileSync(dir).includes('access_03.txt')).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0201
   * @tc.name      testDraftIo0201
   * @tc.desc      Draft access pass 4 flips
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0201', 'access 4');
    const dir: string = scratchDir();
    const path: string = dir + '/access_04.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    expect(fs.accessSync(path)).assertFalse();
    writeText(path, 'access-4');
    expect(fs.accessSync(path)).assertTrue();
    expect(fs.accessSync(dir)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.listFileSync(dir).includes('access_04.txt')).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0202
   * @tc.name      testDraftIo0202
   * @tc.desc      Draft access pass 5 flips
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0202', 'access 5');
    const dir: string = scratchDir();
    const path: string = dir + '/access_05.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    expect(fs.accessSync(path)).assertFalse();
    writeText(path, 'access-5');
    expect(fs.accessSync(path)).assertTrue();
    expect(fs.accessSync(dir)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.listFileSync(dir).includes('access_05.txt')).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0203
   * @tc.name      testDraftIo0203
   * @tc.desc      Draft access pass 6 flips
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0203', 'access 6');
    const dir: string = scratchDir();
    const path: string = dir + '/access_06.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    expect(fs.accessSync(path)).assertFalse();
    writeText(path, 'access-6');
    expect(fs.accessSync(path)).assertTrue();
    expect(fs.accessSync(dir)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.listFileSync(dir).includes('access_06.txt')).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0204
   * @tc.name      testDraftIo0204
   * @tc.desc      Draft access pass 7 flips
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0204', 'access 7');
    const dir: string = scratchDir();
    const path: string = dir + '/access_07.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    expect(fs.accessSync(path)).assertFalse();
    writeText(path, 'access-7');
    expect(fs.accessSync(path)).assertTrue();
    expect(fs.accessSync(dir)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.listFileSync(dir).includes('access_07.txt')).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0205
   * @tc.name      testDraftIo0205
   * @tc.desc      Draft access pass 8 flips
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0205', 'access 8');
    const dir: string = scratchDir();
    const path: string = dir + '/access_08.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    expect(fs.accessSync(path)).assertFalse();
    writeText(path, 'access-8');
    expect(fs.accessSync(path)).assertTrue();
    expect(fs.accessSync(dir)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.listFileSync(dir).includes('access_08.txt')).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0206
   * @tc.name      testDraftIo0206
   * @tc.desc      Draft access pass 9 flips
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0206', 'access 9');
    const dir: string = scratchDir();
    const path: string = dir + '/access_09.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    expect(fs.accessSync(path)).assertFalse();
    writeText(path, 'access-9');
    expect(fs.accessSync(path)).assertTrue();
    expect(fs.accessSync(dir)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.listFileSync(dir).includes('access_09.txt')).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0207
   * @tc.name      testDraftIo0207
   * @tc.desc      Draft access pass 10 flips
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0207', 'access 10');
    const dir: string = scratchDir();
    const path: string = dir + '/access_10.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    expect(fs.accessSync(path)).assertFalse();
    writeText(path, 'access-10');
    expect(fs.accessSync(path)).assertTrue();
    expect(fs.accessSync(dir)).assertTrue();
    fs.unlinkSync(path);
    expect(fs.listFileSync(dir).includes('access_10.txt')).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0208
   * @tc.name      testDraftIo0208
   * @tc.desc      Draft empty file pass 1 stays readable
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0208', 'empty 1');
    const dir: string = scratchDir();
    const path: string = dir + '/empty_01.txt';
    writeText(path, '');
    expect(fs.accessSync(path)).assertTrue();
    expect(fs.statSync(path).size).assertEqual(0);
    expect(readText(path)).assertEqual('');
    expect(readText(path).length).assertEqual(0);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0209
   * @tc.name      testDraftIo0209
   * @tc.desc      Draft empty file pass 2 stays readable
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0209', 'empty 2');
    const dir: string = scratchDir();
    const path: string = dir + '/empty_02.txt';
    writeText(path, '');
    expect(fs.accessSync(path)).assertTrue();
    expect(fs.statSync(path).size).assertEqual(0);
    expect(readText(path)).assertEqual('');
    expect(readText(path).length).assertEqual(0);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0210
   * @tc.name      testDraftIo0210
   * @tc.desc      Draft empty file pass 3 stays readable
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0210', 'empty 3');
    const dir: string = scratchDir();
    const path: string = dir + '/empty_03.txt';
    writeText(path, '');
    expect(fs.accessSync(path)).assertTrue();
    expect(fs.statSync(path).size).assertEqual(0);
    expect(readText(path)).assertEqual('');
    expect(readText(path).length).assertEqual(0);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0211
   * @tc.name      testDraftIo0211
   * @tc.desc      Draft empty file pass 4 stays readable
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0211', 'empty 4');
    const dir: string = scratchDir();
    const path: string = dir + '/empty_04.txt';
    writeText(path, '');
    expect(fs.accessSync(path)).assertTrue();
    expect(fs.statSync(path).size).assertEqual(0);
    expect(readText(path)).assertEqual('');
    expect(readText(path).length).assertEqual(0);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0212
   * @tc.name      testDraftIo0212
   * @tc.desc      Draft empty file pass 5 stays readable
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0212', 'empty 5');
    const dir: string = scratchDir();
    const path: string = dir + '/empty_05.txt';
    writeText(path, '');
    expect(fs.accessSync(path)).assertTrue();
    expect(fs.statSync(path).size).assertEqual(0);
    expect(readText(path)).assertEqual('');
    expect(readText(path).length).assertEqual(0);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0213
   * @tc.name      testDraftIo0213
   * @tc.desc      Draft empty file pass 6 stays readable
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0213', 'empty 6');
    const dir: string = scratchDir();
    const path: string = dir + '/empty_06.txt';
    writeText(path, '');
    expect(fs.accessSync(path)).assertTrue();
    expect(fs.statSync(path).size).assertEqual(0);
    expect(readText(path)).assertEqual('');
    expect(readText(path).length).assertEqual(0);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0214
   * @tc.name      testDraftIo0214
   * @tc.desc      Draft empty file pass 7 stays readable
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0214', 'empty 7');
    const dir: string = scratchDir();
    const path: string = dir + '/empty_07.txt';
    writeText(path, '');
    expect(fs.accessSync(path)).assertTrue();
    expect(fs.statSync(path).size).assertEqual(0);
    expect(readText(path)).assertEqual('');
    expect(readText(path).length).assertEqual(0);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0215
   * @tc.name      testDraftIo0215
   * @tc.desc      Draft empty file pass 8 stays readable
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testDraftIo0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testDraftIo0215', 'empty 8');
    const dir: string = scratchDir();
    const path: string = dir + '/empty_08.txt';
    writeText(path, '');
    expect(fs.accessSync(path)).assertTrue();
    expect(fs.statSync(path).size).assertEqual(0);
    expect(readText(path)).assertEqual('');
    expect(readText(path).length).assertEqual(0);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0216
   * @tc.name      testDraftIo0216
   * @tc.desc      Draft empty file pass 9 stays readable
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testDraftIo0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testDraftIo0216', 'empty 9');
    const dir: string = scratchDir();
    const path: string = dir + '/empty_09.txt';
    writeText(path, '');
    expect(fs.accessSync(path)).assertTrue();
    expect(fs.statSync(path).size).assertEqual(0);
    expect(readText(path)).assertEqual('');
    expect(readText(path).length).assertEqual(0);
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_DIO_0217
   * @tc.name      testDraftIo0217
   * @tc.desc      Draft empty file pass 10 stays readable
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testDraftIo0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testDraftIo0217', 'empty 10');
    const dir: string = scratchDir();
    const path: string = dir + '/empty_10.txt';
    writeText(path, '');
    expect(fs.accessSync(path)).assertTrue();
    expect(fs.statSync(path).size).assertEqual(0);
