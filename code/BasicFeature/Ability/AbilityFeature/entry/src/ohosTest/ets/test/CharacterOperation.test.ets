/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { afterAll, beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import CharacterOperation from '../../../main/ets/characteroperation/CharacterOperation';
import {
  countExisting,
  countMissing,
  listStoragePaths,
  removeStorageFiles,
  StorageOperationResult,
  StoragePathRecord
} from '../../../main/ets/model/StoragePath';
import { SAMPLE_FILE_NAME } from '../../../main/ets/common/AppConstants';
import { fileExists, getAppContext, loadEntryContext, sleep } from './TestHelper';


let operation: CharacterOperation | undefined = undefined;
/** 与 operation 配套的 UIAbilityContext，文件就落在它的沙箱目录里 */
let operationContext: common.UIAbilityContext | undefined = undefined;

/**
 * 能力封装类只接受 UIAbilityContext，这里取首页 EntryAbility 的 context；
 * 不传 UIContext，因此调用过程中的 Toast 全部跳过，只校验返回值与文件副作用。
 */
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

/**
 * 能力封装类用的是 UIAbilityContext，其 cacheDir 形如 .../haps/entry/cache；
 * AbilityDelegator.getAppContext() 拿到的是应用级 Context，目录少了 haps/entry 这一段。
 * 两套目录互不相同，所以凡是校验落盘情况都必须用与 operation 相同的 context。
 */
function sandboxContext(): common.Context {
  return operationContext === undefined ? getAppContext() : operationContext;
}

export default function characterOperationTest() {
  describe('AbilityFeatureCharacterOperationTest', () => {
    beforeAll(async (done: Function) => {
      await obtainOperation();
      await sleep(500);
      done();
    })

    afterAll(async (done: Function) => {
      removeStorageFiles(sandboxContext());
      removeStorageFiles(sandboxContext(), '/op_probe.txt');
      removeStorageFiles(sandboxContext(), '/op_custom.txt');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CHARACTER_OPERATION_0001
     * @tc.name      testGenerateStorageFilesCount0001
     * @tc.desc      一次返回五个沙箱目录下的占位文件路径
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGenerateStorageFilesCount0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined) {
        done();
        return;
      }
      const paths: string[] = op.generateStorageFiles();
      expect(paths.length).assertEqual(5);
      expect(paths.every((path: string) => path.startsWith('/'))).assertTrue();
      expect(paths.every((path: string) => path.endsWith(SAMPLE_FILE_NAME))).assertTrue();
      expect(paths.filter((path: string, index: number) => paths.indexOf(path) === index).length).assertEqual(5);
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CHARACTER_OPERATION_0002
     * @tc.name      testGenerateStorageFilesCustomName0002
     * @tc.desc      自定义文件名同样生成五条合法路径且无重复分隔符
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGenerateStorageFilesCustomName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined) {
        done();
        return;
      }
      const paths: string[] = op.generateStorageFiles('/op_probe.txt');
      expect(paths.length).assertEqual(5);
      expect(paths.every((path: string) => path.endsWith('/op_probe.txt'))).assertTrue();
      expect(paths.filter((path: string) => path.includes('//')).length).assertEqual(0);
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CHARACTER_OPERATION_0003
     * @tc.name      testCreateStorageDataSuccess0003
     * @tc.desc      创建数据返回成功且五份文件全部落盘
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateStorageDataSuccess0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined) {
        done();
        return;
      }
      const context: common.Context = sandboxContext();
      removeStorageFiles(context);
      const result: StorageOperationResult = op.createStorageData();
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(countExisting(context)).assertEqual(5);
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CHARACTER_OPERATION_0004
     * @tc.name      testCheckStorageDataTrue0004
     * @tc.desc      五份文件齐全时检查返回 true
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCheckStorageDataTrue0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined) {
        done();
        return;
      }
      const context: common.Context = sandboxContext();
      removeStorageFiles(context);
      op.createStorageData();
      expect(op.checkStorageData()).assertTrue();
      expect(countExisting(context)).assertEqual(5);
      expect(countMissing(context).length).assertEqual(0);
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CHARACTER_OPERATION_0005
     * @tc.name      testCheckStorageDataFalse0005
     * @tc.desc      文件被删除后检查返回 false
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCheckStorageDataFalse0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined) {
        done();
        return;
      }
      const context: common.Context = sandboxContext();
      removeStorageFiles(context);
      expect(op.checkStorageData()).assertFalse();
      expect(countExisting(context)).assertEqual(0);
      expect(countMissing(context).length).assertEqual(5);
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CHARACTER_OPERATION_0006
     * @tc.name      testClearStorageDataGuard0006
     * @tc.desc      文件不齐时清理被拦下，返回 false 且不结束进程
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testClearStorageDataGuard0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined) {
        done();
        return;
      }
      const context: common.Context = sandboxContext();
      removeStorageFiles(context);
      expect(op.clearStorageData()).assertFalse();
      expect(countExisting(context)).assertEqual(0);
      expect(removeStorageFiles(context)).assertEqual(0);
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CHARACTER_OPERATION_0007
     * @tc.name      testCreateAndCheckCustomName0007
     * @tc.desc      自定义文件名的创建与检查结果保持一致
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateAndCheckCustomName0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined) {
        done();
        return;
      }
      const context: common.Context = sandboxContext();
      removeStorageFiles(context, '/op_custom.txt');
      const result: StorageOperationResult = op.createStorageData('/op_custom.txt');
      expect(result.success).assertTrue();
      expect(op.checkStorageData('/op_custom.txt')).assertTrue();
      removeStorageFiles(context, '/op_custom.txt');
      expect(op.checkStorageData('/op_custom.txt')).assertFalse();
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CHARACTER_OPERATION_0008
     * @tc.name      testRepeatedCreateStorageData0008
     * @tc.desc      连续两次创建都成功，文件数保持五份
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRepeatedCreateStorageData0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined) {
        done();
        return;
      }
      const context: common.Context = sandboxContext();
      removeStorageFiles(context);
      const first: StorageOperationResult = op.createStorageData();
      const second: StorageOperationResult = op.createStorageData();
      expect(first.success).assertTrue();
      expect(second.success).assertTrue();
      expect(second.createdCount).assertEqual(5);
      expect(countExisting(context)).assertEqual(5);
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CHARACTER_OPERATION_0009
     * @tc.name      testGeneratedPathsExistAfterCreate0009
     * @tc.desc      生成路径与落盘结果一一对应
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testGeneratedPathsExistAfterCreate0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined) {
        done();
        return;
      }
      removeStorageFiles(sandboxContext());
      op.createStorageData();
      const paths: string[] = op.generateStorageFiles();
      expect(paths.every((path: string) => fileExists(path))).assertTrue();
      expect(paths.filter((path: string) => fileExists(path)).length).assertEqual(5);
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_CHARACTER_OPERATION_0010
     * @tc.name      testGeneratedPathsMatchModel0010
     * @tc.desc      封装类返回的路径与模型层列出的路径完全一致
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testGeneratedPathsMatchModel0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const op: CharacterOperation | undefined = await obtainOperation();
      expect(op !== undefined).assertTrue();
      if (op === undefined) {
        done();
        return;
      }
      const records: StoragePathRecord[] = listStoragePaths(sandboxContext());
      const paths: string[] = op.generateStorageFiles();
      expect(paths.length).assertEqual(records.length);
      paths.forEach((path: string, index: number) => {
        expect(path).assertEqual(records[index].filePath);
      });
      expect(paths.length).assertEqual(5);
      done();
    })
  })
}
