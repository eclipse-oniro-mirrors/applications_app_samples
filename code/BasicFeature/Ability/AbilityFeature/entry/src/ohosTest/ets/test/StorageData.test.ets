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

import { afterAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
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

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AbilityFeature]';

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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateAllStorageFiles0001 begin');
      const context: common.Context = getAppContext();
      removeStorageFiles(context);
      const result: StorageOperationResult = createStorageFiles(context);
      hilog.info(DOMAIN, TAG, '%{public}s', `testCreateAllStorageFiles0001 assert1 result.success=${result.success}`);
      expect(result.success).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testCreateAllStorageFiles0001 assert2 result.createdCount=${result.createdCount}`);
      expect(result.createdCount).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `testCreateAllStorageFiles0001 assert3 result.totalCount=${result.totalCount}`);
      expect(result.totalCount).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `testCreateAllStorageFiles0001 assert4 result.missing.length=${result.missing.length}`);
      expect(result.missing.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateAllStorageFiles0001 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountAfterCreate0002 begin');
      const context: common.Context = getAppContext();
      removeStorageFiles(context);
      createStorageFiles(context);
      const actual1: number = countExisting(context);
      hilog.info(DOMAIN, TAG, '%{public}s', `testCountAfterCreate0002 assert1 countExisting=${actual1}`);
      expect(actual1).assertEqual(5);
      const actual2: number = countMissing(context).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `testCountAfterCreate0002 assert2 countMissing.length=${actual2}`);
      expect(actual2).assertEqual(0);
      const actual3: boolean = listStoragePaths(context).every((record: StoragePathRecord) => record.exists);
      hilog.info(DOMAIN, TAG, '%{public}s', `testCountAfterCreate0002 assert3 listStoragePaths=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountAfterCreate0002 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateStorageFilesIsIdempotent0003 begin');
      const context: common.Context = getAppContext();
      removeStorageFiles(context);
      const first: StorageOperationResult = createStorageFiles(context);
      const second: StorageOperationResult = createStorageFiles(context);
      hilog.info(DOMAIN, TAG, '%{public}s', `testCreateStorageFilesIsIdempotent0003 assert1 first.success=${first.success}`);
      expect(first.success).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testCreateStorageFilesIsIdempotent0003 assert2 second.success=${second.success}`);
      expect(second.success).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testCreateStorageFilesIsIdempotent0003 assert3 second.createdCount=${second.createdCount}`);
      expect(second.createdCount).assertEqual(5);
      const actual4: number = countExisting(context);
      hilog.info(DOMAIN, TAG, '%{public}s', `testCreateStorageFilesIsIdempotent0003 assert4 countExisting=${actual4}`);
      expect(actual4).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateStorageFilesIsIdempotent0003 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateSingleStorageFile0004 begin');
      const context: common.Context = getAppContext();
      const filePath: string = joinStoragePath(context.cacheDir, '/single_probe.txt');
      removeStorageFiles(context, '/single_probe.txt');
      const actual1: boolean = createStorageFile(filePath);
      hilog.info(DOMAIN, TAG, '%{public}s', `testCreateSingleStorageFile0004 assert1 createStorageFile=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = fileExists(filePath);
      hilog.info(DOMAIN, TAG, '%{public}s', `testCreateSingleStorageFile0004 assert2 fileExists=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = createStorageFile(filePath);
      hilog.info(DOMAIN, TAG, '%{public}s', `testCreateSingleStorageFile0004 assert3 createStorageFile=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: number = removeStorageFiles(context, '/single_probe.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `testCreateSingleStorageFile0004 assert4 removeStorageFiles=${actual4}`);
      expect(actual4).assertEqual(1);
      const actual5: boolean = fileExists(filePath);
      hilog.info(DOMAIN, TAG, '%{public}s', `testCreateSingleStorageFile0004 assert5 fileExists=${actual5}`);
      expect(actual5).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateSingleStorageFile0004 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateStorageFileInMissingDir0005 begin');
      const badPath: string = '/data/storage/ability_feature_missing_dir/probe.txt';
      const actual1: boolean = createStorageFile(badPath);
      hilog.info(DOMAIN, TAG, '%{public}s', `testCreateStorageFileInMissingDir0005 assert1 createStorageFile=${actual1}`);
      expect(actual1).assertFalse();
      const actual2: boolean = fileExists(badPath);
      hilog.info(DOMAIN, TAG, '%{public}s', `testCreateStorageFileInMissingDir0005 assert2 fileExists=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: boolean = badPath.includes('ability_feature_missing_dir');
      hilog.info(DOMAIN, TAG, '%{public}s', `testCreateStorageFileInMissingDir0005 assert3 badPath.includes=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCreateStorageFileInMissingDir0005 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRemoveAllStorageFiles0006 begin');
      const context: common.Context = getAppContext();
      removeStorageFiles(context);
      createStorageFiles(context);
      const actual1: number = removeStorageFiles(context);
      hilog.info(DOMAIN, TAG, '%{public}s', `testRemoveAllStorageFiles0006 assert1 removeStorageFiles=${actual1}`);
      expect(actual1).assertEqual(5);
      const actual2: number = countExisting(context);
      hilog.info(DOMAIN, TAG, '%{public}s', `testRemoveAllStorageFiles0006 assert2 countExisting=${actual2}`);
      expect(actual2).assertEqual(0);
      const actual3: number = removeStorageFiles(context);
      hilog.info(DOMAIN, TAG, '%{public}s', `testRemoveAllStorageFiles0006 assert3 removeStorageFiles=${actual3}`);
      expect(actual3).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRemoveAllStorageFiles0006 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRemovePartialStorageFiles0007 begin');
      const context: common.Context = getAppContext();
      removeStorageFiles(context, '/partial_probe.txt');
      const cachePath: string = joinStoragePath(context.cacheDir, '/partial_probe.txt');
      const filesPath: string = joinStoragePath(context.filesDir, '/partial_probe.txt');
      const actual1: boolean = createStorageFile(cachePath);
      hilog.info(DOMAIN, TAG, '%{public}s', `testRemovePartialStorageFiles0007 assert1 createStorageFile=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = createStorageFile(filesPath);
      hilog.info(DOMAIN, TAG, '%{public}s', `testRemovePartialStorageFiles0007 assert2 createStorageFile=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: number = countExisting(context, '/partial_probe.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `testRemovePartialStorageFiles0007 assert3 countExisting=${actual3}`);
      expect(actual3).assertEqual(2);
      const actual4: number = removeStorageFiles(context, '/partial_probe.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `testRemovePartialStorageFiles0007 assert4 removeStorageFiles=${actual4}`);
      expect(actual4).assertEqual(2);
      const actual5: number = countExisting(context, '/partial_probe.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `testRemovePartialStorageFiles0007 assert5 countExisting=${actual5}`);
      expect(actual5).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRemovePartialStorageFiles0007 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCustomFileNameIsolation0008 begin');
      const context: common.Context = getAppContext();
      removeStorageFiles(context);
      removeStorageFiles(context, '/custom_probe.txt');
      const result: StorageOperationResult = createStorageFiles(context, '/custom_probe.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `testCustomFileNameIsolation0008 assert1 result.success=${result.success}`);
      expect(result.success).assertTrue();
      const actual2: number = countExisting(context, '/custom_probe.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `testCustomFileNameIsolation0008 assert2 countExisting=${actual2}`);
      expect(actual2).assertEqual(5);
      const actual3: number = countExisting(context);
      hilog.info(DOMAIN, TAG, '%{public}s', `testCustomFileNameIsolation0008 assert3 countExisting=${actual3}`);
      expect(actual3).assertEqual(0);
      const actual4: number = removeStorageFiles(context, '/custom_probe.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `testCustomFileNameIsolation0008 assert4 removeStorageFiles=${actual4}`);
      expect(actual4).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCustomFileNameIsolation0008 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileNameWithoutLeadingSlash0009 begin');
      const context: common.Context = getAppContext();
      removeStorageFiles(context, 'plain_probe.txt');
      const result: StorageOperationResult = createStorageFiles(context, 'plain_probe.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `testFileNameWithoutLeadingSlash0009 assert1 result.success=${result.success}`);
      expect(result.success).assertTrue();
      const records: StoragePathRecord[] = listStoragePaths(context, 'plain_probe.txt');
      const actual2: boolean = records.every((record: StoragePathRecord) => record.filePath.endsWith('/plain_probe.txt'));
      hilog.info(DOMAIN, TAG, '%{public}s', `testFileNameWithoutLeadingSlash0009 assert2 records.every=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: number = records.filter((record: StoragePathRecord) => record.filePath.includes('//')).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `testFileNameWithoutLeadingSlash0009 assert3 records.filter.length=${actual3}`);
      expect(actual3).assertEqual(0);
      removeStorageFiles(context, 'plain_probe.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testFileNameWithoutLeadingSlash0009 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationResultConsistency0010 begin');
      const context: common.Context = getAppContext();
      removeStorageFiles(context);
      const result: StorageOperationResult = createStorageFiles(context);
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationResultConsistency0010 assert1 result.success=${result.success}`);
      expect(result.success).assertEqual(result.missing.length === 0);
      const actual2: boolean = result.createdCount <= result.totalCount;
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationResultConsistency0010 assert2 value=${actual2}`);
      expect(actual2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testOperationResultConsistency0010 assert3 result.totalCount=${result.totalCount}`);
      expect(result.totalCount).assertEqual(listStoragePaths(context).length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testOperationResultConsistency0010 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMissingListAfterRemove0011 begin');
      const context: common.Context = getAppContext();
      removeStorageFiles(context);
      const actual1: number = countMissing(context).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `testMissingListAfterRemove0011 assert1 countMissing.length=${actual1}`);
      expect(actual1).assertEqual(5);
      const actual2: number = countExisting(context);
      hilog.info(DOMAIN, TAG, '%{public}s', `testMissingListAfterRemove0011 assert2 countExisting=${actual2}`);
      expect(actual2).assertEqual(0);
      createStorageFiles(context);
      const actual3: number = countMissing(context).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `testMissingListAfterRemove0011 assert3 countMissing.length=${actual3}`);
      expect(actual3).assertEqual(0);
      removeStorageFiles(context);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testMissingListAfterRemove0011 end');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreferencesAndDatabaseWritable0012 begin');
      const context: common.Context = getAppContext();
      const prefPath: string = joinStoragePath(resolveStorageDir(context, StorageArea.PREFERENCES), '/pref_probe.txt');
      const dbPath: string = joinStoragePath(resolveStorageDir(context, StorageArea.DATABASE), '/db_probe.txt');
      const actual1: boolean = createStorageFile(prefPath);
      hilog.info(DOMAIN, TAG, '%{public}s', `testPreferencesAndDatabaseWritable0012 assert1 createStorageFile=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = createStorageFile(dbPath);
      hilog.info(DOMAIN, TAG, '%{public}s', `testPreferencesAndDatabaseWritable0012 assert2 createStorageFile=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = fileExists(prefPath);
      hilog.info(DOMAIN, TAG, '%{public}s', `testPreferencesAndDatabaseWritable0012 assert3 fileExists=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = fileExists(dbPath);
      hilog.info(DOMAIN, TAG, '%{public}s', `testPreferencesAndDatabaseWritable0012 assert4 fileExists=${actual4}`);
      expect(actual4).assertTrue();
      const actual5: number = removeStorageFiles(context, '/pref_probe.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `testPreferencesAndDatabaseWritable0012 assert5 removeStorageFiles=${actual5}`);
      expect(actual5).assertEqual(1);
      const actual6: number = removeStorageFiles(context, '/db_probe.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `testPreferencesAndDatabaseWritable0012 assert6 removeStorageFiles=${actual6}`);
      expect(actual6).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPreferencesAndDatabaseWritable0012 end');
    })
  })
}
