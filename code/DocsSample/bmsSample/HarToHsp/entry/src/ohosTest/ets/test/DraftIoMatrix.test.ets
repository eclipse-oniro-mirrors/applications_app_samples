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
