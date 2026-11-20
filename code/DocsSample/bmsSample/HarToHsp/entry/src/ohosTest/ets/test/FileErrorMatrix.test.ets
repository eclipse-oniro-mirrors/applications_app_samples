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
import { entryContext } from './shared/Probe';
import { logCase } from './shared/TestLog';

import { paceTurn } from './shared/TestPace';

export default function fileErrorMatrixTest() {
  describe('fileErrorMatrixTest', () => {
  beforeEach(async () => {
    await paceTurn();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0001
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0002
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0003
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0004
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0005
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0006
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0007
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0008
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0009
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0010
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0011
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0012
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0013
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0014
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0015
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0016
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0017
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0018
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0019
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0020
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0021
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0022
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0023
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0024
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0025
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0026
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0027
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0028
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0029
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0030
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0031
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0032
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0033
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0034
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0035
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0036
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0037
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0038
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0039
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0040
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0041
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0042
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
    expect(failed).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0043
   * @tc.name      testFileError0043
   * @tc.desc      Missing unlink 3 fails cleanly
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0043', 'missing unlink %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/unlink_absent_03.txt';
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0044
   * @tc.name      testFileError0044
   * @tc.desc      Missing unlink 4 fails cleanly
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0044', 'missing unlink %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/unlink_absent_04.txt';
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0045
   * @tc.name      testFileError0045
   * @tc.desc      Missing unlink 5 fails cleanly
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0045', 'missing unlink %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/unlink_absent_05.txt';
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0046
   * @tc.name      testFileError0046
   * @tc.desc      Missing unlink 6 fails cleanly
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0046', 'missing unlink %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/unlink_absent_06.txt';
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0047
   * @tc.name      testFileError0047
   * @tc.desc      Missing unlink 7 fails cleanly
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0047', 'missing unlink %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/unlink_absent_07.txt';
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0048
   * @tc.name      testFileError0048
   * @tc.desc      Missing unlink 8 fails cleanly
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0048', 'missing unlink %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/unlink_absent_08.txt';
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0049
   * @tc.name      testFileError0049
   * @tc.desc      Missing unlink 9 fails cleanly
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0049', 'missing unlink %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/unlink_absent_09.txt';
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0050
   * @tc.name      testFileError0050
   * @tc.desc      Missing unlink 10 fails cleanly
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0050', 'missing unlink %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/unlink_absent_10.txt';
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0051
   * @tc.name      testFileError0051
   * @tc.desc      Missing unlink 11 fails cleanly
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0051', 'missing unlink %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/unlink_absent_11.txt';
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0052
   * @tc.name      testFileError0052
   * @tc.desc      Missing unlink 12 fails cleanly
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0052', 'missing unlink %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/unlink_absent_12.txt';
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0053
   * @tc.name      testFileError0053
   * @tc.desc      Missing unlink 13 fails cleanly
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0053', 'missing unlink %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/unlink_absent_13.txt';
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0054
   * @tc.name      testFileError0054
   * @tc.desc      Missing unlink 14 fails cleanly
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0054', 'missing unlink %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/unlink_absent_14.txt';
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0055
   * @tc.name      testFileError0055
   * @tc.desc      Missing unlink 15 fails cleanly
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0055', 'missing unlink %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/unlink_absent_15.txt';
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0056
   * @tc.name      testFileError0056
   * @tc.desc      Missing unlink 16 fails cleanly
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0056', 'missing unlink %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/unlink_absent_16.txt';
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0057
   * @tc.name      testFileError0057
   * @tc.desc      Missing unlink 17 fails cleanly
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0057', 'missing unlink %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/unlink_absent_17.txt';
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0058
   * @tc.name      testFileError0058
   * @tc.desc      Missing unlink 18 fails cleanly
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0058', 'missing unlink %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/unlink_absent_18.txt';
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0059
   * @tc.name      testFileError0059
   * @tc.desc      Missing unlink 19 fails cleanly
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0059', 'missing unlink %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/unlink_absent_19.txt';
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0060
   * @tc.name      testFileError0060
   * @tc.desc      Missing unlink 20 fails cleanly
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0060', 'missing unlink %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/unlink_absent_20.txt';
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
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0061
   * @tc.name      testFileError0061
   * @tc.desc      Duplicate mkdir 1 reports failure
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0061', 'mkdir existing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/dup_dir_01';
    if (fs.accessSync(path)) {
      fs.rmdirSync(path);
    }
    fs.mkdirSync(path);
    expect(fs.statSync(path).isDirectory()).assertTrue();
    let failed: boolean = false;
    try {
      fs.mkdirSync(path);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
    fs.rmdirSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0062
   * @tc.name      testFileError0062
   * @tc.desc      Duplicate mkdir 2 reports failure
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0062', 'mkdir existing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/dup_dir_02';
    if (fs.accessSync(path)) {
      fs.rmdirSync(path);
    }
    fs.mkdirSync(path);
    expect(fs.statSync(path).isDirectory()).assertTrue();
    let failed: boolean = false;
    try {
      fs.mkdirSync(path);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
    fs.rmdirSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0063
   * @tc.name      testFileError0063
   * @tc.desc      Duplicate mkdir 3 reports failure
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0063', 'mkdir existing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/dup_dir_03';
    if (fs.accessSync(path)) {
      fs.rmdirSync(path);
    }
    fs.mkdirSync(path);
    expect(fs.statSync(path).isDirectory()).assertTrue();
    let failed: boolean = false;
    try {
      fs.mkdirSync(path);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
    fs.rmdirSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0064
   * @tc.name      testFileError0064
   * @tc.desc      Duplicate mkdir 4 reports failure
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0064', 'mkdir existing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/dup_dir_04';
    if (fs.accessSync(path)) {
      fs.rmdirSync(path);
    }
    fs.mkdirSync(path);
    expect(fs.statSync(path).isDirectory()).assertTrue();
    let failed: boolean = false;
    try {
      fs.mkdirSync(path);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
    fs.rmdirSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0065
   * @tc.name      testFileError0065
   * @tc.desc      Duplicate mkdir 5 reports failure
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0065', 'mkdir existing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/dup_dir_05';
    if (fs.accessSync(path)) {
      fs.rmdirSync(path);
    }
    fs.mkdirSync(path);
    expect(fs.statSync(path).isDirectory()).assertTrue();
    let failed: boolean = false;
    try {
      fs.mkdirSync(path);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
    fs.rmdirSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0066
   * @tc.name      testFileError0066
   * @tc.desc      Duplicate mkdir 6 reports failure
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0066', 'mkdir existing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/dup_dir_06';
    if (fs.accessSync(path)) {
      fs.rmdirSync(path);
    }
    fs.mkdirSync(path);
    expect(fs.statSync(path).isDirectory()).assertTrue();
    let failed: boolean = false;
    try {
      fs.mkdirSync(path);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
    fs.rmdirSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0067
   * @tc.name      testFileError0067
   * @tc.desc      Duplicate mkdir 7 reports failure
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0067', 'mkdir existing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/dup_dir_07';
    if (fs.accessSync(path)) {
      fs.rmdirSync(path);
    }
    fs.mkdirSync(path);
    expect(fs.statSync(path).isDirectory()).assertTrue();
    let failed: boolean = false;
    try {
      fs.mkdirSync(path);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
    fs.rmdirSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0068
   * @tc.name      testFileError0068
   * @tc.desc      Duplicate mkdir 8 reports failure
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0068', 'mkdir existing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/dup_dir_08';
    if (fs.accessSync(path)) {
      fs.rmdirSync(path);
    }
    fs.mkdirSync(path);
    expect(fs.statSync(path).isDirectory()).assertTrue();
    let failed: boolean = false;
    try {
      fs.mkdirSync(path);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
    fs.rmdirSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0069
   * @tc.name      testFileError0069
   * @tc.desc      Duplicate mkdir 9 reports failure
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0069', 'mkdir existing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/dup_dir_09';
    if (fs.accessSync(path)) {
      fs.rmdirSync(path);
    }
    fs.mkdirSync(path);
    expect(fs.statSync(path).isDirectory()).assertTrue();
    let failed: boolean = false;
    try {
      fs.mkdirSync(path);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
    fs.rmdirSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0070
   * @tc.name      testFileError0070
   * @tc.desc      Duplicate mkdir 10 reports failure
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0070', 'mkdir existing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/dup_dir_10';
    if (fs.accessSync(path)) {
      fs.rmdirSync(path);
    }
    fs.mkdirSync(path);
    expect(fs.statSync(path).isDirectory()).assertTrue();
    let failed: boolean = false;
    try {
      fs.mkdirSync(path);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
    fs.rmdirSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0071
   * @tc.name      testFileError0071
   * @tc.desc      Duplicate mkdir 11 reports failure
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0071', 'mkdir existing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/dup_dir_11';
    if (fs.accessSync(path)) {
      fs.rmdirSync(path);
    }
    fs.mkdirSync(path);
    expect(fs.statSync(path).isDirectory()).assertTrue();
    let failed: boolean = false;
    try {
      fs.mkdirSync(path);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
    fs.rmdirSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0072
   * @tc.name      testFileError0072
   * @tc.desc      Duplicate mkdir 12 reports failure
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0072', 'mkdir existing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/dup_dir_12';
    if (fs.accessSync(path)) {
      fs.rmdirSync(path);
    }
    fs.mkdirSync(path);
    expect(fs.statSync(path).isDirectory()).assertTrue();
    let failed: boolean = false;
    try {
      fs.mkdirSync(path);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
    fs.rmdirSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0073
   * @tc.name      testFileError0073
   * @tc.desc      Duplicate mkdir 13 reports failure
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0073', 'mkdir existing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/dup_dir_13';
    if (fs.accessSync(path)) {
      fs.rmdirSync(path);
    }
    fs.mkdirSync(path);
    expect(fs.statSync(path).isDirectory()).assertTrue();
    let failed: boolean = false;
    try {
      fs.mkdirSync(path);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
    fs.rmdirSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0074
   * @tc.name      testFileError0074
   * @tc.desc      Duplicate mkdir 14 reports failure
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0074', 'mkdir existing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/dup_dir_14';
    if (fs.accessSync(path)) {
      fs.rmdirSync(path);
    }
    fs.mkdirSync(path);
    expect(fs.statSync(path).isDirectory()).assertTrue();
    let failed: boolean = false;
    try {
      fs.mkdirSync(path);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
    fs.rmdirSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0075
   * @tc.name      testFileError0075
   * @tc.desc      Duplicate mkdir 15 reports failure
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0075', 'mkdir existing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/dup_dir_15';
    if (fs.accessSync(path)) {
      fs.rmdirSync(path);
    }
    fs.mkdirSync(path);
    expect(fs.statSync(path).isDirectory()).assertTrue();
    let failed: boolean = false;
    try {
      fs.mkdirSync(path);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
    fs.rmdirSync(path);
  });


  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0091
   * @tc.name      testFileError0091
   * @tc.desc      Copy from missing 1 fails
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0091', 'copy missing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const source: string = dir + '/copy_absent_01.txt';
    const target: string = dir + '/copy_absent_target_01.txt';
    if (fs.accessSync(source)) {
      fs.unlinkSync(source);
    }
    if (fs.accessSync(target)) {
      fs.unlinkSync(target);
    }
    let failed: boolean = false;
    try {
      fs.copyFileSync(source, target);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
    expect(fs.accessSync(target)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0092
   * @tc.name      testFileError0092
   * @tc.desc      Copy from missing 2 fails
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0092', 'copy missing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const source: string = dir + '/copy_absent_02.txt';
    const target: string = dir + '/copy_absent_target_02.txt';
    if (fs.accessSync(source)) {
      fs.unlinkSync(source);
    }
    if (fs.accessSync(target)) {
      fs.unlinkSync(target);
    }
    let failed: boolean = false;
    try {
      fs.copyFileSync(source, target);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
    expect(fs.accessSync(target)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0093
   * @tc.name      testFileError0093
   * @tc.desc      Copy from missing 3 fails
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0093', 'copy missing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const source: string = dir + '/copy_absent_03.txt';
    const target: string = dir + '/copy_absent_target_03.txt';
    if (fs.accessSync(source)) {
      fs.unlinkSync(source);
    }
    if (fs.accessSync(target)) {
      fs.unlinkSync(target);
    }
    let failed: boolean = false;
    try {
      fs.copyFileSync(source, target);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
    expect(fs.accessSync(target)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0094
   * @tc.name      testFileError0094
   * @tc.desc      Copy from missing 4 fails
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0094', 'copy missing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const source: string = dir + '/copy_absent_04.txt';
    const target: string = dir + '/copy_absent_target_04.txt';
    if (fs.accessSync(source)) {
      fs.unlinkSync(source);
    }
    if (fs.accessSync(target)) {
      fs.unlinkSync(target);
    }
    let failed: boolean = false;
    try {
      fs.copyFileSync(source, target);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
    expect(fs.accessSync(target)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0095
   * @tc.name      testFileError0095
   * @tc.desc      Copy from missing 5 fails
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0095', 'copy missing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const source: string = dir + '/copy_absent_05.txt';
    const target: string = dir + '/copy_absent_target_05.txt';
    if (fs.accessSync(source)) {
      fs.unlinkSync(source);
    }
    if (fs.accessSync(target)) {
      fs.unlinkSync(target);
    }
    let failed: boolean = false;
    try {
      fs.copyFileSync(source, target);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
    expect(fs.accessSync(target)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0096
   * @tc.name      testFileError0096
   * @tc.desc      Copy from missing 6 fails
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0096', 'copy missing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const source: string = dir + '/copy_absent_06.txt';
    const target: string = dir + '/copy_absent_target_06.txt';
    if (fs.accessSync(source)) {
      fs.unlinkSync(source);
    }
    if (fs.accessSync(target)) {
      fs.unlinkSync(target);
    }
    let failed: boolean = false;
    try {
      fs.copyFileSync(source, target);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
    expect(fs.accessSync(target)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0097
   * @tc.name      testFileError0097
   * @tc.desc      Copy from missing 7 fails
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0097', 'copy missing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const source: string = dir + '/copy_absent_07.txt';
    const target: string = dir + '/copy_absent_target_07.txt';
    if (fs.accessSync(source)) {
      fs.unlinkSync(source);
    }
    if (fs.accessSync(target)) {
      fs.unlinkSync(target);
    }
    let failed: boolean = false;
    try {
      fs.copyFileSync(source, target);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
    expect(fs.accessSync(target)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0098
   * @tc.name      testFileError0098
   * @tc.desc      Copy from missing 8 fails
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0098', 'copy missing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const source: string = dir + '/copy_absent_08.txt';
    const target: string = dir + '/copy_absent_target_08.txt';
    if (fs.accessSync(source)) {
      fs.unlinkSync(source);
    }
    if (fs.accessSync(target)) {
      fs.unlinkSync(target);
    }
    let failed: boolean = false;
    try {
      fs.copyFileSync(source, target);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
    expect(fs.accessSync(target)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0099
   * @tc.name      testFileError0099
   * @tc.desc      Copy from missing 9 fails
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0099', 'copy missing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const source: string = dir + '/copy_absent_09.txt';
    const target: string = dir + '/copy_absent_target_09.txt';
    if (fs.accessSync(source)) {
      fs.unlinkSync(source);
    }
    if (fs.accessSync(target)) {
      fs.unlinkSync(target);
    }
    let failed: boolean = false;
    try {
      fs.copyFileSync(source, target);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
    expect(fs.accessSync(target)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0100
   * @tc.name      testFileError0100
   * @tc.desc      Copy from missing 10 fails
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0100', 'copy missing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const source: string = dir + '/copy_absent_10.txt';
    const target: string = dir + '/copy_absent_target_10.txt';
    if (fs.accessSync(source)) {
      fs.unlinkSync(source);
    }
    if (fs.accessSync(target)) {
      fs.unlinkSync(target);
    }
    let failed: boolean = false;
    try {
      fs.copyFileSync(source, target);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
    expect(fs.accessSync(target)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0101
   * @tc.name      testFileError0101
   * @tc.desc      Copy from missing 11 fails
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0101', 'copy missing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const source: string = dir + '/copy_absent_11.txt';
    const target: string = dir + '/copy_absent_target_11.txt';
    if (fs.accessSync(source)) {
      fs.unlinkSync(source);
    }
    if (fs.accessSync(target)) {
      fs.unlinkSync(target);
    }
    let failed: boolean = false;
    try {
      fs.copyFileSync(source, target);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
    expect(fs.accessSync(target)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0102
   * @tc.name      testFileError0102
   * @tc.desc      Copy from missing 12 fails
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0102', 'copy missing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const source: string = dir + '/copy_absent_12.txt';
    const target: string = dir + '/copy_absent_target_12.txt';
    if (fs.accessSync(source)) {
      fs.unlinkSync(source);
    }
    if (fs.accessSync(target)) {
      fs.unlinkSync(target);
    }
    let failed: boolean = false;
    try {
      fs.copyFileSync(source, target);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
    expect(fs.accessSync(target)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0103
   * @tc.name      testFileError0103
   * @tc.desc      Copy from missing 13 fails
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0103', 'copy missing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const source: string = dir + '/copy_absent_13.txt';
    const target: string = dir + '/copy_absent_target_13.txt';
    if (fs.accessSync(source)) {
      fs.unlinkSync(source);
    }
    if (fs.accessSync(target)) {
      fs.unlinkSync(target);
    }
    let failed: boolean = false;
    try {
      fs.copyFileSync(source, target);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
    expect(fs.accessSync(target)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0104
   * @tc.name      testFileError0104
   * @tc.desc      Copy from missing 14 fails
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0104', 'copy missing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const source: string = dir + '/copy_absent_14.txt';
    const target: string = dir + '/copy_absent_target_14.txt';
    if (fs.accessSync(source)) {
      fs.unlinkSync(source);
    }
    if (fs.accessSync(target)) {
      fs.unlinkSync(target);
    }
    let failed: boolean = false;
    try {
      fs.copyFileSync(source, target);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
    expect(fs.accessSync(target)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0105
   * @tc.name      testFileError0105
   * @tc.desc      Copy from missing 15 fails
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0105', 'copy missing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const source: string = dir + '/copy_absent_15.txt';
    const target: string = dir + '/copy_absent_target_15.txt';
    if (fs.accessSync(source)) {
      fs.unlinkSync(source);
    }
    if (fs.accessSync(target)) {
      fs.unlinkSync(target);
    }
    let failed: boolean = false;
    try {
      fs.copyFileSync(source, target);
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
    expect(fs.accessSync(target)).assertFalse();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0106
   * @tc.name      testFileError0106
   * @tc.desc      Rename from missing 1 fails
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0106', 'rename missing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const source: string = dir + '/rename_absent_01.txt';
    if (fs.accessSync(source)) {
      fs.unlinkSync(source);
    }
    let failed: boolean = false;
    try {
      fs.renameSync(source, source + '.moved');
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0107
   * @tc.name      testFileError0107
   * @tc.desc      Rename from missing 2 fails
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0107', 'rename missing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const source: string = dir + '/rename_absent_02.txt';
    if (fs.accessSync(source)) {
      fs.unlinkSync(source);
    }
    let failed: boolean = false;
    try {
      fs.renameSync(source, source + '.moved');
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0108
   * @tc.name      testFileError0108
   * @tc.desc      Rename from missing 3 fails
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0108', 'rename missing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const source: string = dir + '/rename_absent_03.txt';
    if (fs.accessSync(source)) {
      fs.unlinkSync(source);
    }
    let failed: boolean = false;
    try {
      fs.renameSync(source, source + '.moved');
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0109
   * @tc.name      testFileError0109
   * @tc.desc      Rename from missing 4 fails
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0109', 'rename missing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const source: string = dir + '/rename_absent_04.txt';
    if (fs.accessSync(source)) {
      fs.unlinkSync(source);
    }
    let failed: boolean = false;
    try {
      fs.renameSync(source, source + '.moved');
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0110
   * @tc.name      testFileError0110
   * @tc.desc      Rename from missing 5 fails
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0110', 'rename missing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const source: string = dir + '/rename_absent_05.txt';
    if (fs.accessSync(source)) {
      fs.unlinkSync(source);
    }
    let failed: boolean = false;
    try {
      fs.renameSync(source, source + '.moved');
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0111
   * @tc.name      testFileError0111
   * @tc.desc      Rename from missing 6 fails
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0111', 'rename missing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const source: string = dir + '/rename_absent_06.txt';
    if (fs.accessSync(source)) {
      fs.unlinkSync(source);
    }
    let failed: boolean = false;
    try {
      fs.renameSync(source, source + '.moved');
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0112
   * @tc.name      testFileError0112
   * @tc.desc      Rename from missing 7 fails
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0112', 'rename missing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const source: string = dir + '/rename_absent_07.txt';
    if (fs.accessSync(source)) {
      fs.unlinkSync(source);
    }
    let failed: boolean = false;
    try {
      fs.renameSync(source, source + '.moved');
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0113
   * @tc.name      testFileError0113
   * @tc.desc      Rename from missing 8 fails
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0113', 'rename missing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const source: string = dir + '/rename_absent_08.txt';
    if (fs.accessSync(source)) {
      fs.unlinkSync(source);
    }
    let failed: boolean = false;
    try {
      fs.renameSync(source, source + '.moved');
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0114
   * @tc.name      testFileError0114
   * @tc.desc      Rename from missing 9 fails
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0114', 'rename missing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const source: string = dir + '/rename_absent_09.txt';
    if (fs.accessSync(source)) {
      fs.unlinkSync(source);
    }
    let failed: boolean = false;
    try {
      fs.renameSync(source, source + '.moved');
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0115
   * @tc.name      testFileError0115
   * @tc.desc      Rename from missing 10 fails
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0115', 'rename missing %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const source: string = dir + '/rename_absent_10.txt';
    if (fs.accessSync(source)) {
      fs.unlinkSync(source);
    }
    let failed: boolean = false;
    try {
      fs.renameSync(source, source + '.moved');
    } catch (error) {
      failed = Number((error as BusinessError).code) !== 0;
    }
    expect(failed).assertTrue();
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0116
   * @tc.name      testFileError0116
   * @tc.desc      Empty file read 1 returns empty text
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0116', 'empty read %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/empty_01.txt';
    const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
    fs.closeSync(file.fd);
    expect(fs.readTextSync(path)).assertEqual('');
    expect(fs.statSync(path).size).assertEqual(0);
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0117
   * @tc.name      testFileError0117
   * @tc.desc      Empty file read 2 returns empty text
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0117', 'empty read %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/empty_02.txt';
    const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
    fs.closeSync(file.fd);
    expect(fs.readTextSync(path)).assertEqual('');
    expect(fs.statSync(path).size).assertEqual(0);
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0118
   * @tc.name      testFileError0118
   * @tc.desc      Empty file read 3 returns empty text
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0118', 'empty read %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/empty_03.txt';
    const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
    fs.closeSync(file.fd);
    expect(fs.readTextSync(path)).assertEqual('');
    expect(fs.statSync(path).size).assertEqual(0);
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0119
   * @tc.name      testFileError0119
   * @tc.desc      Empty file read 4 returns empty text
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0119', 'empty read %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/empty_04.txt';
    const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
    fs.closeSync(file.fd);
    expect(fs.readTextSync(path)).assertEqual('');
    expect(fs.statSync(path).size).assertEqual(0);
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0120
   * @tc.name      testFileError0120
   * @tc.desc      Empty file read 5 returns empty text
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0120', 'empty read %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/empty_05.txt';
    const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
    fs.closeSync(file.fd);
    expect(fs.readTextSync(path)).assertEqual('');
    expect(fs.statSync(path).size).assertEqual(0);
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0121
   * @tc.name      testFileError0121
   * @tc.desc      Empty file read 6 returns empty text
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0121', 'empty read %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/empty_06.txt';
    const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
    fs.closeSync(file.fd);
    expect(fs.readTextSync(path)).assertEqual('');
    expect(fs.statSync(path).size).assertEqual(0);
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0122
   * @tc.name      testFileError0122
   * @tc.desc      Empty file read 7 returns empty text
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0122', 'empty read %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/empty_07.txt';
    const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
    fs.closeSync(file.fd);
    expect(fs.readTextSync(path)).assertEqual('');
    expect(fs.statSync(path).size).assertEqual(0);
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0123
   * @tc.name      testFileError0123
   * @tc.desc      Empty file read 8 returns empty text
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL0
   */
  it('testFileError0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
    logCase('testFileError0123', 'empty read %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/empty_08.txt';
    const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
    fs.closeSync(file.fd);
    expect(fs.readTextSync(path)).assertEqual('');
    expect(fs.statSync(path).size).assertEqual(0);
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0124
   * @tc.name      testFileError0124
   * @tc.desc      Empty file read 9 returns empty text
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL1
   */
  it('testFileError0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
    logCase('testFileError0124', 'empty read %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/empty_09.txt';
    const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
    fs.closeSync(file.fd);
    expect(fs.readTextSync(path)).assertEqual('');
    expect(fs.statSync(path).size).assertEqual(0);
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
  });

  /**
   * @tc.number    SUB_BMS_HARTOHSP_FERR_0125
   * @tc.name      testFileError0125
   * @tc.desc      Empty file read 10 returns empty text
   * @tc.size      MEDIUMTEST
   * @tc.type      FUNCTION
   * @tc.level     LEVEL2
   */
  it('testFileError0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    logCase('testFileError0125', 'empty read %d');
    const context: common.Context = entryContext();
    const dir: string = context.filesDir + '/error_work';
    if (!fs.accessSync(dir)) {
      fs.mkdirSync(dir);
    }
    const path: string = dir + '/empty_10.txt';
    const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
    fs.closeSync(file.fd);
    expect(fs.readTextSync(path)).assertEqual('');
    expect(fs.statSync(path).size).assertEqual(0);
    expect(fs.accessSync(path)).assertTrue();
    fs.unlinkSync(path);
  });
  });
}
