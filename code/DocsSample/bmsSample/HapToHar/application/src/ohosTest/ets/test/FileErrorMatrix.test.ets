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
import { common } from '@kit.AbilityKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { entryContext } from './shared/AppProbe';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

export default function fileErrorMatrixTest() {
  describe('fileErrorMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0001
   * @tc.name      testFileError0001
   * @tc.desc      Missing read 1 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0001', 'missing read %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/absent_01.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.readTextSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0002
   * @tc.name      testFileError0002
   * @tc.desc      Missing read 2 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0002', 'missing read %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/absent_02.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.readTextSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0003
   * @tc.name      testFileError0003
   * @tc.desc      Missing read 3 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0003', 'missing read %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/absent_03.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.readTextSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0004
   * @tc.name      testFileError0004
   * @tc.desc      Missing read 4 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0004', 'missing read %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/absent_04.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.readTextSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0005
   * @tc.name      testFileError0005
   * @tc.desc      Missing read 5 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0005', 'missing read %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/absent_05.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.readTextSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0006
   * @tc.name      testFileError0006
   * @tc.desc      Missing read 6 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0006', 'missing read %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/absent_06.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.readTextSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0007
   * @tc.name      testFileError0007
   * @tc.desc      Missing read 7 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0007', 'missing read %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/absent_07.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.readTextSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0008
   * @tc.name      testFileError0008
   * @tc.desc      Missing read 8 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0008', 'missing read %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/absent_08.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.readTextSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0009
   * @tc.name      testFileError0009
   * @tc.desc      Missing read 9 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0009', 'missing read %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/absent_09.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.readTextSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0010
   * @tc.name      testFileError0010
   * @tc.desc      Missing read 10 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0010', 'missing read %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/absent_10.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.readTextSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0011
   * @tc.name      testFileError0011
   * @tc.desc      Missing read 11 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0011', 'missing read %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/absent_11.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.readTextSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0012
   * @tc.name      testFileError0012
   * @tc.desc      Missing read 12 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0012', 'missing read %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/absent_12.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.readTextSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0013
   * @tc.name      testFileError0013
   * @tc.desc      Missing read 13 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0013', 'missing read %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/absent_13.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.readTextSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0014
   * @tc.name      testFileError0014
   * @tc.desc      Missing read 14 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0014', 'missing read %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/absent_14.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.readTextSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0015
   * @tc.name      testFileError0015
   * @tc.desc      Missing read 15 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0015', 'missing read %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/absent_15.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.readTextSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0016
   * @tc.name      testFileError0016
   * @tc.desc      Missing read 16 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0016', 'missing read %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/absent_16.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.readTextSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0017
   * @tc.name      testFileError0017
   * @tc.desc      Missing read 17 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0017', 'missing read %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/absent_17.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.readTextSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0018
   * @tc.name      testFileError0018
   * @tc.desc      Missing read 18 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0018', 'missing read %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/absent_18.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.readTextSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0019
   * @tc.name      testFileError0019
   * @tc.desc      Missing read 19 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0019', 'missing read %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/absent_19.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.readTextSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0020
   * @tc.name      testFileError0020
   * @tc.desc      Missing read 20 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0020', 'missing read %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/absent_20.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.readTextSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
    expect(fs.accessSync(path)).assertFalse();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0021
   * @tc.name      testFileError0021
   * @tc.desc      Missing stat 1 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0021', 'missing stat %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/stat_absent_01.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.statSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0022
   * @tc.name      testFileError0022
   * @tc.desc      Missing stat 2 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0022', 'missing stat %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/stat_absent_02.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.statSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0023
   * @tc.name      testFileError0023
   * @tc.desc      Missing stat 3 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0023', 'missing stat %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/stat_absent_03.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.statSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0024
   * @tc.name      testFileError0024
   * @tc.desc      Missing stat 4 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0024', 'missing stat %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/stat_absent_04.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.statSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0025
   * @tc.name      testFileError0025
   * @tc.desc      Missing stat 5 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0025', 'missing stat %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/stat_absent_05.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.statSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0026
   * @tc.name      testFileError0026
   * @tc.desc      Missing stat 6 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0026', 'missing stat %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/stat_absent_06.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.statSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0027
   * @tc.name      testFileError0027
   * @tc.desc      Missing stat 7 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0027', 'missing stat %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/stat_absent_07.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.statSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0028
   * @tc.name      testFileError0028
   * @tc.desc      Missing stat 8 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0028', 'missing stat %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/stat_absent_08.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.statSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0029
   * @tc.name      testFileError0029
   * @tc.desc      Missing stat 9 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0029', 'missing stat %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/stat_absent_09.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.statSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0030
   * @tc.name      testFileError0030
   * @tc.desc      Missing stat 10 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0030', 'missing stat %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/stat_absent_10.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.statSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0031
   * @tc.name      testFileError0031
   * @tc.desc      Missing stat 11 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0031', 'missing stat %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/stat_absent_11.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.statSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0032
   * @tc.name      testFileError0032
   * @tc.desc      Missing stat 12 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0032', 'missing stat %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/stat_absent_12.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.statSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0033
   * @tc.name      testFileError0033
   * @tc.desc      Missing stat 13 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0033', 'missing stat %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/stat_absent_13.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.statSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0034
   * @tc.name      testFileError0034
   * @tc.desc      Missing stat 14 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0034', 'missing stat %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/stat_absent_14.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.statSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0035
   * @tc.name      testFileError0035
   * @tc.desc      Missing stat 15 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0035', 'missing stat %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/stat_absent_15.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.statSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0036
   * @tc.name      testFileError0036
   * @tc.desc      Missing stat 16 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0036', 'missing stat %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/stat_absent_16.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.statSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0037
   * @tc.name      testFileError0037
   * @tc.desc      Missing stat 17 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0037', 'missing stat %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/stat_absent_17.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.statSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0038
   * @tc.name      testFileError0038
   * @tc.desc      Missing stat 18 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0038', 'missing stat %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/stat_absent_18.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.statSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0039
   * @tc.name      testFileError0039
   * @tc.desc      Missing stat 19 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0039', 'missing stat %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/stat_absent_19.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.statSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0040
   * @tc.name      testFileError0040
   * @tc.desc      Missing stat 20 reports no such file
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0040', 'missing stat %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/stat_absent_20.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let code: number = 0;
    try {
      fs.statSync(path);
    } catch (error) {
      code = Number((error as BusinessError).code);
    }
    expect(code).assertEqual(13900002);
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0041
   * @tc.name      testFileError0041
   * @tc.desc      Missing unlink 1 fails cleanly
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0041', 'missing unlink %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/unlink_absent_01.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let failed: boolean = false;
    try {
      fs.unlinkSync(path);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
  });
  /**
   * @tc.number    SUB_BMS_HAPTOHAR_FERR_0042
   * @tc.name      testFileError0042
   * @tc.desc      Missing unlink 2 fails cleanly
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0042', 'missing unlink %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/unlink_absent_02.txt';
    if (fs.accessSync(path)) {
      fs.unlinkSync(path);
    }
    let failed: boolean = false;
    try {
      fs.unlinkSync(path);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
