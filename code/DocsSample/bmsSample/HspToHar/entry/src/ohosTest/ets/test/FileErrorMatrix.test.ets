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
   * @tc.number    SUB_BMS_HSPTOHAR_FERR_0001
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
   * @tc.number    SUB_BMS_HSPTOHAR_FERR_0002
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
   * @tc.number    SUB_BMS_HSPTOHAR_FERR_0003
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
   * @tc.number    SUB_BMS_HSPTOHAR_FERR_0004
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
