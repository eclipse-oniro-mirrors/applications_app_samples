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

import { afterAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import {
  countExisting,
  countMissing,
  createStorageFile,
  createStorageFiles,
  joinStoragePath,
  listStoragePaths,
  removeStorageFiles,
  resolveStorageDir,
  StorageArea,
  StorageOperationResult,
  StoragePathRecord
} from '../../../main/ets/model/StoragePath';
import { fileExists, getAppContext } from './TestHelper';


export default function storageDataTest() {
  describe('AbilityFeatureStorageDataTest', () => {
    afterAll(() => {
      // 用例结束时把占位文件清干净，避免影响后续套件的“文件不存在”分支
      const context: common.Context = getAppContext();
      removeStorageFiles(context);
      removeStorageFiles(context, '/custom_probe.txt');
      removeStorageFiles(context, '/plain_probe.txt');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_STORAGE_DATA_0001
     * @tc.name      testCreateAllStorageFiles0001
     * @tc.desc      五个沙箱目录下都能创建出占位文件
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateAllStorageFiles0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const context: common.Context = getAppContext();
      removeStorageFiles(context);
      const result: StorageOperationResult = createStorageFiles(context);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.totalCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_STORAGE_DATA_0002
     * @tc.name      testCountAfterCreate0002
     * @tc.desc      创建后统计到五份文件，缺失列表为空
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountAfterCreate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const context: common.Context = getAppContext();
      removeStorageFiles(context);
      createStorageFiles(context);
      expect(countExisting(context)).assertEqual(5);
      expect(countMissing(context).length).assertEqual(0);
      expect(listStoragePaths(context).every((record: StoragePathRecord) => record.exists)).assertTrue();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_STORAGE_DATA_0003
     * @tc.name      testCreateStorageFilesIsIdempotent0003
     * @tc.desc      重复创建不报错，第二次仍然创建满五份
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateStorageFilesIsIdempotent0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const context: common.Context = getAppContext();
      removeStorageFiles(context);
      const first: StorageOperationResult = createStorageFiles(context);
      const second: StorageOperationResult = createStorageFiles(context);
      expect(first.success).assertTrue();
      expect(second.success).assertTrue();
      expect(second.createdCount).assertEqual(5);
      expect(countExisting(context)).assertEqual(5);
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_STORAGE_DATA_0004
     * @tc.name      testCreateSingleStorageFile0004
     * @tc.desc      单个文件可重复创建，删除后访问失败
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCreateSingleStorageFile0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const context: common.Context = getAppContext();
      const filePath: string = joinStoragePath(context.cacheDir, '/single_probe.txt');
      removeStorageFiles(context, '/single_probe.txt');
      expect(createStorageFile(filePath)).assertTrue();
      expect(fileExists(filePath)).assertTrue();
      expect(createStorageFile(filePath)).assertTrue();
      expect(removeStorageFiles(context, '/single_probe.txt')).assertEqual(1);
      expect(fileExists(filePath)).assertFalse();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_STORAGE_DATA_0005
     * @tc.name      testCreateStorageFileInMissingDir0005
     * @tc.desc      目录不存在时创建失败并返回 false，不抛异常
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCreateStorageFileInMissingDir0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const badPath: string = '/data/storage/ability_feature_missing_dir/probe.txt';
      expect(createStorageFile(badPath)).assertFalse();
      expect(fileExists(badPath)).assertFalse();
      expect(badPath.includes('ability_feature_missing_dir')).assertTrue();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_STORAGE_DATA_0006
     * @tc.name      testRemoveAllStorageFiles0006
     * @tc.desc      删除返回实际删除数，再次删除为 0
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRemoveAllStorageFiles0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const context: common.Context = getAppContext();
      removeStorageFiles(context);
      createStorageFiles(context);
      expect(removeStorageFiles(context)).assertEqual(5);
      expect(countExisting(context)).assertEqual(0);
      expect(removeStorageFiles(context)).assertEqual(0);
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_STORAGE_DATA_0007
     * @tc.name      testRemovePartialStorageFiles0007
     * @tc.desc      只存在两份文件时删除计数为 2
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRemovePartialStorageFiles0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const context: common.Context = getAppContext();
      removeStorageFiles(context, '/partial_probe.txt');
      const cachePath: string = joinStoragePath(context.cacheDir, '/partial_probe.txt');
      const filesPath: string = joinStoragePath(context.filesDir, '/partial_probe.txt');
      expect(createStorageFile(cachePath)).assertTrue();
      expect(createStorageFile(filesPath)).assertTrue();
      expect(countExisting(context, '/partial_probe.txt')).assertEqual(2);
      expect(removeStorageFiles(context, '/partial_probe.txt')).assertEqual(2);
      expect(countExisting(context, '/partial_probe.txt')).assertEqual(0);
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_STORAGE_DATA_0008
     * @tc.name      testCustomFileNameIsolation0008
     * @tc.desc      自定义文件名的创建与统计不影响默认文件名
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCustomFileNameIsolation0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const context: common.Context = getAppContext();
      removeStorageFiles(context);
      removeStorageFiles(context, '/custom_probe.txt');
      const result: StorageOperationResult = createStorageFiles(context, '/custom_probe.txt');
      expect(result.success).assertTrue();
      expect(countExisting(context, '/custom_probe.txt')).assertEqual(5);
      expect(countExisting(context)).assertEqual(0);
      expect(removeStorageFiles(context, '/custom_probe.txt')).assertEqual(5);
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_STORAGE_DATA_0009
     * @tc.name      testFileNameWithoutLeadingSlash0009
     * @tc.desc      不带前导斜杠的文件名同样拼接正常，不出现双斜杠
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileNameWithoutLeadingSlash0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const context: common.Context = getAppContext();
      removeStorageFiles(context, 'plain_probe.txt');
      const result: StorageOperationResult = createStorageFiles(context, 'plain_probe.txt');
      expect(result.success).assertTrue();
      const records: StoragePathRecord[] = listStoragePaths(context, 'plain_probe.txt');
      expect(records.every((record: StoragePathRecord) => record.filePath.endsWith('/plain_probe.txt'))).assertTrue();
      expect(records.filter((record: StoragePathRecord) => record.filePath.includes('//')).length).assertEqual(0);
      removeStorageFiles(context, 'plain_probe.txt');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_STORAGE_DATA_0010
     * @tc.name      testOperationResultConsistency0010
     * @tc.desc      success 与 missing、createdCount 与 totalCount 的取值互相自洽
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testOperationResultConsistency0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const context: common.Context = getAppContext();
      removeStorageFiles(context);
      const result: StorageOperationResult = createStorageFiles(context);
      expect(result.success).assertEqual(result.missing.length === 0);
      expect(result.createdCount <= result.totalCount).assertTrue();
      expect(result.totalCount).assertEqual(listStoragePaths(context).length);
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_STORAGE_DATA_0011
     * @tc.name      testMissingListAfterRemove0011
     * @tc.desc      删除后五个目录全部计入缺失，重建后缺失清空
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMissingListAfterRemove0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const context: common.Context = getAppContext();
      removeStorageFiles(context);
      expect(countMissing(context).length).assertEqual(5);
      expect(countExisting(context)).assertEqual(0);
      createStorageFiles(context);
      expect(countMissing(context).length).assertEqual(0);
      removeStorageFiles(context);
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_STORAGE_DATA_0012
     * @tc.name      testPreferencesAndDatabaseWritable0012
     * @tc.desc      偏好与数据库目录同样可写可删
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPreferencesAndDatabaseWritable0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const context: common.Context = getAppContext();
      const prefPath: string = joinStoragePath(resolveStorageDir(context, StorageArea.PREFERENCES), '/pref_probe.txt');
      const dbPath: string = joinStoragePath(resolveStorageDir(context, StorageArea.DATABASE), '/db_probe.txt');
      expect(createStorageFile(prefPath)).assertTrue();
      expect(createStorageFile(dbPath)).assertTrue();
      expect(fileExists(prefPath)).assertTrue();
      expect(fileExists(dbPath)).assertTrue();
      expect(removeStorageFiles(context, '/pref_probe.txt')).assertEqual(1);
      expect(removeStorageFiles(context, '/db_probe.txt')).assertEqual(1);
    })
  })
}
