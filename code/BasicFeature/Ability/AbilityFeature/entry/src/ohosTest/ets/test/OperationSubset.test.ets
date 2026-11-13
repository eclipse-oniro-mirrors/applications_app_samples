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

import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import CharacterOperation from '../../../main/ets/characteroperation/CharacterOperation';
import {
  countExisting,
  createStorageFile,
  joinStoragePath,
  removeStorageFiles
} from '../../../main/ets/model/StoragePath';
import { fileExists, loadEntryContext, sleep } from './TestHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AbilityFeature]';

let operation: CharacterOperation | undefined = undefined;
let operationContext: common.UIAbilityContext | undefined = undefined;

/** 与存量 CharacterOperation 套件一致：取首页 EntryAbility 的 context，不传 UIContext，Toast 全部跳过。 */
async function obtainOperation(): Promise<CharacterOperation | undefined> {
  if (operation !== undefined) {
    return operation;
  }
  try {
    const context: common.UIAbilityContext = await loadEntryContext();
    operation = new CharacterOperation(context);
    operationContext = context;
  } catch (error) {
    operation = undefined;
    operationContext = undefined;
  }
  return operation;
}

export default function operationSubsetTest(): void {
  describe('AbilityFeatureOperationSubsetTest', () => {
    beforeAll(async (done: Function) => {
      await obtainOperation();
      await sleep(500);
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0001
     * @tc.name      testOperationSubset0001
     * @tc.desc      只在 无目录 落盘时检查数据不通过，清理被拦下且已有的 0 个文件原样保留
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testOperationSubset0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0001 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_00.txt';
      removeStorageFiles(context, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0001 params: name=${name}`);
      expect(op.checkStorageData(name)).assertFalse();
      expect(op.clearStorageData(name)).assertFalse();
      expect(countExisting(context, name)).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0001 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0002
     * @tc.name      testOperationSubset0002
     * @tc.desc      只在 cache 落盘时检查数据不通过，清理被拦下且已有的 1 个文件原样保留
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0002 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_01.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0002 params: name=${name}`);
      expect(op.checkStorageData(name)).assertFalse();
      expect(op.clearStorageData(name)).assertFalse();
      expect(countExisting(context, name)).assertEqual(1);
      expect(removeStorageFiles(context, name)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0002 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0003
     * @tc.name      testOperationSubset0003
     * @tc.desc      只在 files 落盘时检查数据不通过，清理被拦下且已有的 1 个文件原样保留
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0003 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_02.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.filesDir, name));
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0003 params: name=${name}`);
      expect(op.checkStorageData(name)).assertFalse();
      expect(op.clearStorageData(name)).assertFalse();
      expect(countExisting(context, name)).assertEqual(1);
      expect(removeStorageFiles(context, name)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0003 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0004
     * @tc.name      testOperationSubset0004
     * @tc.desc      只在 cache+files 落盘时检查数据不通过，清理被拦下且已有的 2 个文件原样保留
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0004 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_03.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.filesDir, name));
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0004 params: name=${name}`);
      expect(op.checkStorageData(name)).assertFalse();
      expect(op.clearStorageData(name)).assertFalse();
      expect(countExisting(context, name)).assertEqual(2);
      expect(removeStorageFiles(context, name)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0004 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0005
     * @tc.name      testOperationSubset0005
     * @tc.desc      只在 preferences 落盘时检查数据不通过，清理被拦下且已有的 1 个文件原样保留
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0005 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_04.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0005 params: name=${name}`);
      expect(op.checkStorageData(name)).assertFalse();
      expect(op.clearStorageData(name)).assertFalse();
      expect(countExisting(context, name)).assertEqual(1);
      expect(removeStorageFiles(context, name)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0005 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0006
     * @tc.name      testOperationSubset0006
     * @tc.desc      只在 cache+preferences 落盘时检查数据不通过，清理被拦下且已有的 2 个文件原样保留
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0006 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_05.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0006 params: name=${name}`);
      expect(op.checkStorageData(name)).assertFalse();
      expect(op.clearStorageData(name)).assertFalse();
      expect(countExisting(context, name)).assertEqual(2);
      expect(removeStorageFiles(context, name)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0006 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0007
     * @tc.name      testOperationSubset0007
     * @tc.desc      只在 files+preferences 落盘时检查数据不通过，清理被拦下且已有的 2 个文件原样保留
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0007 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_06.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0007 params: name=${name}`);
      expect(op.checkStorageData(name)).assertFalse();
      expect(op.clearStorageData(name)).assertFalse();
      expect(countExisting(context, name)).assertEqual(2);
      expect(removeStorageFiles(context, name)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0007 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0008
     * @tc.name      testOperationSubset0008
     * @tc.desc      只在 cache+files+preferences 落盘时检查数据不通过，清理被拦下且已有的 3 个文件原样保留
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0008 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_07.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0008 params: name=${name}`);
      expect(op.checkStorageData(name)).assertFalse();
      expect(op.clearStorageData(name)).assertFalse();
      expect(countExisting(context, name)).assertEqual(3);
      expect(removeStorageFiles(context, name)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0008 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0009
     * @tc.name      testOperationSubset0009
     * @tc.desc      只在 temp 落盘时检查数据不通过，清理被拦下且已有的 1 个文件原样保留
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0009 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_08.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.tempDir, name));
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0009 params: name=${name}`);
      expect(op.checkStorageData(name)).assertFalse();
      expect(op.clearStorageData(name)).assertFalse();
      expect(countExisting(context, name)).assertEqual(1);
      expect(removeStorageFiles(context, name)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0009 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0010
     * @tc.name      testOperationSubset0010
     * @tc.desc      只在 cache+temp 落盘时检查数据不通过，清理被拦下且已有的 2 个文件原样保留
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0010 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_09.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0010 params: name=${name}`);
      expect(op.checkStorageData(name)).assertFalse();
      expect(op.clearStorageData(name)).assertFalse();
      expect(countExisting(context, name)).assertEqual(2);
      expect(removeStorageFiles(context, name)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0010 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0011
     * @tc.name      testOperationSubset0011
     * @tc.desc      只在 files+temp 落盘时检查数据不通过，清理被拦下且已有的 2 个文件原样保留
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0011 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_10.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0011 params: name=${name}`);
      expect(op.checkStorageData(name)).assertFalse();
      expect(op.clearStorageData(name)).assertFalse();
      expect(countExisting(context, name)).assertEqual(2);
      expect(removeStorageFiles(context, name)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0011 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0012
     * @tc.name      testOperationSubset0012
     * @tc.desc      只在 cache+files+temp 落盘时检查数据不通过，清理被拦下且已有的 3 个文件原样保留
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0012 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_11.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0012 params: name=${name}`);
      expect(op.checkStorageData(name)).assertFalse();
      expect(op.clearStorageData(name)).assertFalse();
      expect(countExisting(context, name)).assertEqual(3);
      expect(removeStorageFiles(context, name)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0012 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0013
     * @tc.name      testOperationSubset0013
     * @tc.desc      只在 preferences+temp 落盘时检查数据不通过，清理被拦下且已有的 2 个文件原样保留
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0013 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_12.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0013 params: name=${name}`);
      expect(op.checkStorageData(name)).assertFalse();
      expect(op.clearStorageData(name)).assertFalse();
      expect(countExisting(context, name)).assertEqual(2);
      expect(removeStorageFiles(context, name)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0013 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0014
     * @tc.name      testOperationSubset0014
     * @tc.desc      只在 cache+preferences+temp 落盘时检查数据不通过，清理被拦下且已有的 3 个文件原样保留
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0014 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_13.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0014 params: name=${name}`);
      expect(op.checkStorageData(name)).assertFalse();
      expect(op.clearStorageData(name)).assertFalse();
      expect(countExisting(context, name)).assertEqual(3);
      expect(removeStorageFiles(context, name)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0014 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0015
     * @tc.name      testOperationSubset0015
     * @tc.desc      只在 files+preferences+temp 落盘时检查数据不通过，清理被拦下且已有的 3 个文件原样保留
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0015 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_14.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0015 params: name=${name}`);
      expect(op.checkStorageData(name)).assertFalse();
      expect(op.clearStorageData(name)).assertFalse();
      expect(countExisting(context, name)).assertEqual(3);
      expect(removeStorageFiles(context, name)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0015 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0016
     * @tc.name      testOperationSubset0016
     * @tc.desc      只在 cache+files+preferences+temp 落盘时检查数据不通过，清理被拦下且已有的 4 个文件原样保留
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0016 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_15.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0016 params: name=${name}`);
      expect(op.checkStorageData(name)).assertFalse();
      expect(op.clearStorageData(name)).assertFalse();
      expect(countExisting(context, name)).assertEqual(4);
      expect(removeStorageFiles(context, name)).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0016 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0017
     * @tc.name      testOperationSubset0017
     * @tc.desc      只在 database 落盘时检查数据不通过，清理被拦下且已有的 1 个文件原样保留
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0017 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_16.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.databaseDir, name));
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0017 params: name=${name}`);
      expect(op.checkStorageData(name)).assertFalse();
      expect(op.clearStorageData(name)).assertFalse();
      expect(countExisting(context, name)).assertEqual(1);
      expect(removeStorageFiles(context, name)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0017 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0018
     * @tc.name      testOperationSubset0018
     * @tc.desc      只在 cache+database 落盘时检查数据不通过，清理被拦下且已有的 2 个文件原样保留
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0018 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_17.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0018 params: name=${name}`);
      expect(op.checkStorageData(name)).assertFalse();
      expect(op.clearStorageData(name)).assertFalse();
      expect(countExisting(context, name)).assertEqual(2);
      expect(removeStorageFiles(context, name)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0018 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0019
     * @tc.name      testOperationSubset0019
     * @tc.desc      只在 files+database 落盘时检查数据不通过，清理被拦下且已有的 2 个文件原样保留
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0019 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_18.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0019 params: name=${name}`);
      expect(op.checkStorageData(name)).assertFalse();
      expect(op.clearStorageData(name)).assertFalse();
      expect(countExisting(context, name)).assertEqual(2);
      expect(removeStorageFiles(context, name)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0019 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0020
     * @tc.name      testOperationSubset0020
     * @tc.desc      只在 cache+files+database 落盘时检查数据不通过，清理被拦下且已有的 3 个文件原样保留
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0020 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_19.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0020 params: name=${name}`);
      expect(op.checkStorageData(name)).assertFalse();
      expect(op.clearStorageData(name)).assertFalse();
      expect(countExisting(context, name)).assertEqual(3);
      expect(removeStorageFiles(context, name)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0020 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0021
     * @tc.name      testOperationSubset0021
     * @tc.desc      只在 preferences+database 落盘时检查数据不通过，清理被拦下且已有的 2 个文件原样保留
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0021 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_20.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0021 params: name=${name}`);
      expect(op.checkStorageData(name)).assertFalse();
      expect(op.clearStorageData(name)).assertFalse();
      expect(countExisting(context, name)).assertEqual(2);
      expect(removeStorageFiles(context, name)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0021 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0022
     * @tc.name      testOperationSubset0022
     * @tc.desc      只在 cache+preferences+database 落盘时检查数据不通过，清理被拦下且已有的 3 个文件原样保留
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0022 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_21.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0022 params: name=${name}`);
      expect(op.checkStorageData(name)).assertFalse();
      expect(op.clearStorageData(name)).assertFalse();
      expect(countExisting(context, name)).assertEqual(3);
      expect(removeStorageFiles(context, name)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0022 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0023
     * @tc.name      testOperationSubset0023
     * @tc.desc      只在 files+preferences+database 落盘时检查数据不通过，清理被拦下且已有的 3 个文件原样保留
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0023 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_22.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0023 params: name=${name}`);
      expect(op.checkStorageData(name)).assertFalse();
      expect(op.clearStorageData(name)).assertFalse();
      expect(countExisting(context, name)).assertEqual(3);
      expect(removeStorageFiles(context, name)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0023 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0024
     * @tc.name      testOperationSubset0024
     * @tc.desc      只在 cache+files+preferences+database 落盘时检查数据不通过，清理被拦下且已有的 4 个文件原样保留
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0024 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_23.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0024 params: name=${name}`);
      expect(op.checkStorageData(name)).assertFalse();
      expect(op.clearStorageData(name)).assertFalse();
      expect(countExisting(context, name)).assertEqual(4);
      expect(removeStorageFiles(context, name)).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0024 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0025
     * @tc.name      testOperationSubset0025
     * @tc.desc      只在 temp+database 落盘时检查数据不通过，清理被拦下且已有的 2 个文件原样保留
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0025 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_24.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.tempDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0025 params: name=${name}`);
      expect(op.checkStorageData(name)).assertFalse();
      expect(op.clearStorageData(name)).assertFalse();
      expect(countExisting(context, name)).assertEqual(2);
      expect(removeStorageFiles(context, name)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0025 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0026
     * @tc.name      testOperationSubset0026
     * @tc.desc      只在 cache+temp+database 落盘时检查数据不通过，清理被拦下且已有的 3 个文件原样保留
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0026 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_25.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0026 params: name=${name}`);
      expect(op.checkStorageData(name)).assertFalse();
      expect(op.clearStorageData(name)).assertFalse();
      expect(countExisting(context, name)).assertEqual(3);
      expect(removeStorageFiles(context, name)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0026 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0027
     * @tc.name      testOperationSubset0027
     * @tc.desc      只在 files+temp+database 落盘时检查数据不通过，清理被拦下且已有的 3 个文件原样保留
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0027 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_26.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0027 params: name=${name}`);
      expect(op.checkStorageData(name)).assertFalse();
      expect(op.clearStorageData(name)).assertFalse();
      expect(countExisting(context, name)).assertEqual(3);
      expect(removeStorageFiles(context, name)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0027 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0028
     * @tc.name      testOperationSubset0028
     * @tc.desc      只在 cache+files+temp+database 落盘时检查数据不通过，清理被拦下且已有的 4 个文件原样保留
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0028 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_27.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0028 params: name=${name}`);
      expect(op.checkStorageData(name)).assertFalse();
      expect(op.clearStorageData(name)).assertFalse();
      expect(countExisting(context, name)).assertEqual(4);
      expect(removeStorageFiles(context, name)).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0028 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0029
     * @tc.name      testOperationSubset0029
     * @tc.desc      只在 preferences+temp+database 落盘时检查数据不通过，清理被拦下且已有的 3 个文件原样保留
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0029 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_28.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0029 params: name=${name}`);
      expect(op.checkStorageData(name)).assertFalse();
      expect(op.clearStorageData(name)).assertFalse();
      expect(countExisting(context, name)).assertEqual(3);
      expect(removeStorageFiles(context, name)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0029 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0030
     * @tc.name      testOperationSubset0030
     * @tc.desc      只在 cache+preferences+temp+database 落盘时检查数据不通过，清理被拦下且已有的 4 个文件原样保留
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0030 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_29.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0030 params: name=${name}`);
      expect(op.checkStorageData(name)).assertFalse();
      expect(op.clearStorageData(name)).assertFalse();
      expect(countExisting(context, name)).assertEqual(4);
      expect(removeStorageFiles(context, name)).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0030 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0031
     * @tc.name      testOperationSubset0031
     * @tc.desc      只在 files+preferences+temp+database 落盘时检查数据不通过，清理被拦下且已有的 4 个文件原样保留
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0031 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_30.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0031 params: name=${name}`);
      expect(op.checkStorageData(name)).assertFalse();
      expect(op.clearStorageData(name)).assertFalse();
      expect(countExisting(context, name)).assertEqual(4);
      expect(removeStorageFiles(context, name)).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0031 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0032
     * @tc.name      testOperationSubset0032
     * @tc.desc      五个目录都落盘时检查数据通过，生成的五条路径全部存在（不触发会结束进程的真正清理）
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testOperationSubset0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0032 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const name: string = '/op_subset_31.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0032 params: name=${name}`);
      expect(op.checkStorageData(name)).assertTrue();
      expect(op.generateStorageFiles(name).every((filePath: string) => fileExists(filePath))).assertTrue();
      expect(countExisting(context, name)).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0032 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0033
     * @tc.name      testOperationSubset0033
     * @tc.desc      generateStorageFiles(空串) 按 cache/files/preferences/temp/database 顺序返回 五个目录本身
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testOperationSubset0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0033 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const paths: string[] = op.generateStorageFiles('');
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0033 params: paths=${JSON.stringify(paths)}`);
      expect(paths.length).assertEqual(5);
      expect(paths[0]).assertEqual(context.cacheDir + '');
      expect(paths[1]).assertEqual(context.filesDir + '');
      expect(paths[2]).assertEqual(context.preferencesDir + '');
      expect(paths[3]).assertEqual(context.tempDir + '');
      expect(paths[4]).assertEqual(context.databaseDir + '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0033 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0034
     * @tc.name      testOperationSubset0034
     * @tc.desc      generateStorageFiles("/") 按 cache/files/preferences/temp/database 顺序返回 五个目录本身
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testOperationSubset0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0034 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const paths: string[] = op.generateStorageFiles('/');
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0034 params: paths=${JSON.stringify(paths)}`);
      expect(paths.length).assertEqual(5);
      expect(paths[0]).assertEqual(context.cacheDir + '');
      expect(paths[1]).assertEqual(context.filesDir + '');
      expect(paths[2]).assertEqual(context.preferencesDir + '');
      expect(paths[3]).assertEqual(context.tempDir + '');
      expect(paths[4]).assertEqual(context.databaseDir + '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0034 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0035
     * @tc.name      testOperationSubset0035
     * @tc.desc      generateStorageFiles("gen_plain.txt") 按 cache/files/preferences/temp/database 顺序返回 目录 + "/gen_plain.txt"
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testOperationSubset0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0035 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const paths: string[] = op.generateStorageFiles('gen_plain.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0035 params: paths=${JSON.stringify(paths)}`);
      expect(paths.length).assertEqual(5);
      expect(paths[0]).assertEqual(context.cacheDir + '/gen_plain.txt');
      expect(paths[1]).assertEqual(context.filesDir + '/gen_plain.txt');
      expect(paths[2]).assertEqual(context.preferencesDir + '/gen_plain.txt');
      expect(paths[3]).assertEqual(context.tempDir + '/gen_plain.txt');
      expect(paths[4]).assertEqual(context.databaseDir + '/gen_plain.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0035 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0036
     * @tc.name      testOperationSubset0036
     * @tc.desc      generateStorageFiles("/gen_slash.txt") 按 cache/files/preferences/temp/database 顺序返回 目录 + "/gen_slash.txt"
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testOperationSubset0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0036 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const paths: string[] = op.generateStorageFiles('/gen_slash.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0036 params: paths=${JSON.stringify(paths)}`);
      expect(paths.length).assertEqual(5);
      expect(paths[0]).assertEqual(context.cacheDir + '/gen_slash.txt');
      expect(paths[1]).assertEqual(context.filesDir + '/gen_slash.txt');
      expect(paths[2]).assertEqual(context.preferencesDir + '/gen_slash.txt');
      expect(paths[3]).assertEqual(context.tempDir + '/gen_slash.txt');
      expect(paths[4]).assertEqual(context.databaseDir + '/gen_slash.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0036 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0037
     * @tc.name      testOperationSubset0037
     * @tc.desc      generateStorageFiles("///gen_triple.txt") 按 cache/files/preferences/temp/database 顺序返回 目录 + "/gen_triple.txt"
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0037 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const paths: string[] = op.generateStorageFiles('///gen_triple.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0037 params: paths=${JSON.stringify(paths)}`);
      expect(paths.length).assertEqual(5);
      expect(paths[0]).assertEqual(context.cacheDir + '/gen_triple.txt');
      expect(paths[1]).assertEqual(context.filesDir + '/gen_triple.txt');
      expect(paths[2]).assertEqual(context.preferencesDir + '/gen_triple.txt');
      expect(paths[3]).assertEqual(context.tempDir + '/gen_triple.txt');
      expect(paths[4]).assertEqual(context.databaseDir + '/gen_triple.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0037 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0038
     * @tc.name      testOperationSubset0038
     * @tc.desc      generateStorageFiles("/gen/nested.txt") 按 cache/files/preferences/temp/database 顺序返回 目录 + "/gen/nested.txt"
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0038 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const paths: string[] = op.generateStorageFiles('/gen/nested.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0038 params: paths=${JSON.stringify(paths)}`);
      expect(paths.length).assertEqual(5);
      expect(paths[0]).assertEqual(context.cacheDir + '/gen/nested.txt');
      expect(paths[1]).assertEqual(context.filesDir + '/gen/nested.txt');
      expect(paths[2]).assertEqual(context.preferencesDir + '/gen/nested.txt');
      expect(paths[3]).assertEqual(context.tempDir + '/gen/nested.txt');
      expect(paths[4]).assertEqual(context.databaseDir + '/gen/nested.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0038 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0039
     * @tc.name      testOperationSubset0039
     * @tc.desc      generateStorageFiles("/gen_中文.txt") 按 cache/files/preferences/temp/database 顺序返回 目录 + "/gen_中文.txt"
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0039 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const paths: string[] = op.generateStorageFiles('/gen_中文.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0039 params: paths=${JSON.stringify(paths)}`);
      expect(paths.length).assertEqual(5);
      expect(paths[0]).assertEqual(context.cacheDir + '/gen_中文.txt');
      expect(paths[1]).assertEqual(context.filesDir + '/gen_中文.txt');
      expect(paths[2]).assertEqual(context.preferencesDir + '/gen_中文.txt');
      expect(paths[3]).assertEqual(context.tempDir + '/gen_中文.txt');
      expect(paths[4]).assertEqual(context.databaseDir + '/gen_中文.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0039 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0040
     * @tc.name      testOperationSubset0040
     * @tc.desc      generateStorageFiles("/gen sp.txt") 按 cache/files/preferences/temp/database 顺序返回 目录 + "/gen sp.txt"
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testOperationSubset0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0040 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const paths: string[] = op.generateStorageFiles('/gen sp.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0040 params: paths=${JSON.stringify(paths)}`);
      expect(paths.length).assertEqual(5);
      expect(paths[0]).assertEqual(context.cacheDir + '/gen sp.txt');
      expect(paths[1]).assertEqual(context.filesDir + '/gen sp.txt');
      expect(paths[2]).assertEqual(context.preferencesDir + '/gen sp.txt');
      expect(paths[3]).assertEqual(context.tempDir + '/gen sp.txt');
      expect(paths[4]).assertEqual(context.databaseDir + '/gen sp.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0040 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0041
     * @tc.name      testOperationSubset0041
     * @tc.desc      generateStorageFiles("/.gen_hidden") 按 cache/files/preferences/temp/database 顺序返回 目录 + "/.gen_hidden"
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOperationSubset0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0041 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const paths: string[] = op.generateStorageFiles('/.gen_hidden');
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0041 params: paths=${JSON.stringify(paths)}`);
      expect(paths.length).assertEqual(5);
      expect(paths[0]).assertEqual(context.cacheDir + '/.gen_hidden');
      expect(paths[1]).assertEqual(context.filesDir + '/.gen_hidden');
      expect(paths[2]).assertEqual(context.preferencesDir + '/.gen_hidden');
      expect(paths[3]).assertEqual(context.tempDir + '/.gen_hidden');
      expect(paths[4]).assertEqual(context.databaseDir + '/.gen_hidden');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0041 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0042
     * @tc.name      testOperationSubset0042
     * @tc.desc      generateStorageFiles("/gen.a.b.c") 按 cache/files/preferences/temp/database 顺序返回 目录 + "/gen.a.b.c"
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOperationSubset0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0042 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const paths: string[] = op.generateStorageFiles('/gen.a.b.c');
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0042 params: paths=${JSON.stringify(paths)}`);
      expect(paths.length).assertEqual(5);
      expect(paths[0]).assertEqual(context.cacheDir + '/gen.a.b.c');
      expect(paths[1]).assertEqual(context.filesDir + '/gen.a.b.c');
      expect(paths[2]).assertEqual(context.preferencesDir + '/gen.a.b.c');
      expect(paths[3]).assertEqual(context.tempDir + '/gen.a.b.c');
      expect(paths[4]).assertEqual(context.databaseDir + '/gen.a.b.c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0042 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0043
     * @tc.name      testOperationSubset0043
     * @tc.desc      generateStorageFiles("/GEN_UPPER.TXT") 按 cache/files/preferences/temp/database 顺序返回 目录 + "/GEN_UPPER.TXT"
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOperationSubset0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0043 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const paths: string[] = op.generateStorageFiles('/GEN_UPPER.TXT');
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0043 params: paths=${JSON.stringify(paths)}`);
      expect(paths.length).assertEqual(5);
      expect(paths[0]).assertEqual(context.cacheDir + '/GEN_UPPER.TXT');
      expect(paths[1]).assertEqual(context.filesDir + '/GEN_UPPER.TXT');
      expect(paths[2]).assertEqual(context.preferencesDir + '/GEN_UPPER.TXT');
      expect(paths[3]).assertEqual(context.tempDir + '/GEN_UPPER.TXT');
      expect(paths[4]).assertEqual(context.databaseDir + '/GEN_UPPER.TXT');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0043 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0044
     * @tc.name      testOperationSubset0044
     * @tc.desc      generateStorageFiles("/gen-dash.db") 按 cache/files/preferences/temp/database 顺序返回 目录 + "/gen-dash.db"
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOperationSubset0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0044 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const paths: string[] = op.generateStorageFiles('/gen-dash.db');
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0044 params: paths=${JSON.stringify(paths)}`);
      expect(paths.length).assertEqual(5);
      expect(paths[0]).assertEqual(context.cacheDir + '/gen-dash.db');
      expect(paths[1]).assertEqual(context.filesDir + '/gen-dash.db');
      expect(paths[2]).assertEqual(context.preferencesDir + '/gen-dash.db');
      expect(paths[3]).assertEqual(context.tempDir + '/gen-dash.db');
      expect(paths[4]).assertEqual(context.databaseDir + '/gen-dash.db');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0044 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0045
     * @tc.name      testOperationSubset0045
     * @tc.desc      generateStorageFiles("/gen_😀.txt") 按 cache/files/preferences/temp/database 顺序返回 目录 + "/gen_😀.txt"
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOperationSubset0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0045 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const paths: string[] = op.generateStorageFiles('/gen_😀.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0045 params: paths=${JSON.stringify(paths)}`);
      expect(paths.length).assertEqual(5);
      expect(paths[0]).assertEqual(context.cacheDir + '/gen_😀.txt');
      expect(paths[1]).assertEqual(context.filesDir + '/gen_😀.txt');
      expect(paths[2]).assertEqual(context.preferencesDir + '/gen_😀.txt');
      expect(paths[3]).assertEqual(context.tempDir + '/gen_😀.txt');
      expect(paths[4]).assertEqual(context.databaseDir + '/gen_😀.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0045 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0046
     * @tc.name      testOperationSubset0046
     * @tc.desc      generateStorageFiles("/gen_yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy") 按 cache/files/preferences/temp/database 顺序返回 目录 + "/gen_yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy"
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOperationSubset0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0046 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const paths: string[] = op.generateStorageFiles('/gen_yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0046 params: paths=${JSON.stringify(paths)}`);
      expect(paths.length).assertEqual(5);
      expect(paths[0]).assertEqual(context.cacheDir + '/gen_yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
      expect(paths[1]).assertEqual(context.filesDir + '/gen_yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
      expect(paths[2]).assertEqual(context.preferencesDir + '/gen_yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
      expect(paths[3]).assertEqual(context.tempDir + '/gen_yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
      expect(paths[4]).assertEqual(context.databaseDir + '/gen_yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0046 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0047
     * @tc.name      testOperationSubset0047
     * @tc.desc      generateStorageFiles("/./gen_dot.txt") 按 cache/files/preferences/temp/database 顺序返回 目录 + "/./gen_dot.txt"
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOperationSubset0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0047 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const paths: string[] = op.generateStorageFiles('/./gen_dot.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0047 params: paths=${JSON.stringify(paths)}`);
      expect(paths.length).assertEqual(5);
      expect(paths[0]).assertEqual(context.cacheDir + '/./gen_dot.txt');
      expect(paths[1]).assertEqual(context.filesDir + '/./gen_dot.txt');
      expect(paths[2]).assertEqual(context.preferencesDir + '/./gen_dot.txt');
      expect(paths[3]).assertEqual(context.tempDir + '/./gen_dot.txt');
      expect(paths[4]).assertEqual(context.databaseDir + '/./gen_dot.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0047 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_OPERATION_SUBSET_0048
     * @tc.name      testOperationSubset0048
     * @tc.desc      generateStorageFiles("/../gen_up.txt") 按 cache/files/preferences/temp/database 顺序返回 目录 + "/../gen_up.txt"
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testOperationSubset0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0048 begin');
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined || operationContext === undefined) {
        done();
        return;
      }
      const context: common.UIAbilityContext = operationContext;
      const paths: string[] = op.generateStorageFiles('/../gen_up.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationSubset0048 params: paths=${JSON.stringify(paths)}`);
      expect(paths.length).assertEqual(5);
      expect(paths[0]).assertEqual(context.cacheDir + '/../gen_up.txt');
      expect(paths[1]).assertEqual(context.filesDir + '/../gen_up.txt');
      expect(paths[2]).assertEqual(context.preferencesDir + '/../gen_up.txt');
      expect(paths[3]).assertEqual(context.tempDir + '/../gen_up.txt');
      expect(paths[4]).assertEqual(context.databaseDir + '/../gen_up.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationSubset0048 end');
      done();
    })
  })
}
