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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  countExisting,
  countMissing,
  createStorageFile,
  createStorageFiles,
  joinStoragePath,
  listStoragePaths,
  removeStorageFiles,
  StorageOperationResult,
  StoragePathRecord
} from '../../../main/ets/model/StoragePath';
import { getAppContext } from './TestHelper';

const DOMAIN: number = 0xFF00;
const TAG: string = '[Sample_AbilityFeature_AreaSubset]';

export default function storageAreaSubsetTest(): void {
  describe('AbilityFeatureStorageAreaSubsetTest', () => {
    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0001
     * @tc.name      testStorageAreaSubset0001
     * @tc.desc      预先只在 无目录 落盘时已存在 0 个，缺失列表为 "cache,files,preferences,temp,database"，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testStorageAreaSubset0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0001 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_00.txt';
      removeStorageFiles(context, name);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).join(',')).assertEqual('cache,files,preferences,temp,database');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('00000');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0001 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0002
     * @tc.name      testStorageAreaSubset0002
     * @tc.desc      预先只在 cache 落盘时已存在 1 个，缺失列表为 "files,preferences,temp,database"，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0002 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_01.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      expect(countExisting(context, name)).assertEqual(1);
      expect(countMissing(context, name).join(',')).assertEqual('files,preferences,temp,database');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('10000');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0002 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0003
     * @tc.name      testStorageAreaSubset0003
     * @tc.desc      预先只在 files 落盘时已存在 1 个，缺失列表为 "cache,preferences,temp,database"，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0003 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_02.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.filesDir, name));
      expect(countExisting(context, name)).assertEqual(1);
      expect(countMissing(context, name).join(',')).assertEqual('cache,preferences,temp,database');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('01000');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0003 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0004
     * @tc.name      testStorageAreaSubset0004
     * @tc.desc      预先只在 cache+files 落盘时已存在 2 个，缺失列表为 "preferences,temp,database"，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0004 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_03.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.filesDir, name));
      expect(countExisting(context, name)).assertEqual(2);
      expect(countMissing(context, name).join(',')).assertEqual('preferences,temp,database');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('11000');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0004 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0005
     * @tc.name      testStorageAreaSubset0005
     * @tc.desc      预先只在 preferences 落盘时已存在 1 个，缺失列表为 "cache,files,temp,database"，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0005 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_04.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      expect(countExisting(context, name)).assertEqual(1);
      expect(countMissing(context, name).join(',')).assertEqual('cache,files,temp,database');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('00100');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0005 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0006
     * @tc.name      testStorageAreaSubset0006
     * @tc.desc      预先只在 cache+preferences 落盘时已存在 2 个，缺失列表为 "files,temp,database"，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0006 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_05.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      expect(countExisting(context, name)).assertEqual(2);
      expect(countMissing(context, name).join(',')).assertEqual('files,temp,database');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('10100');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0006 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0007
     * @tc.name      testStorageAreaSubset0007
     * @tc.desc      预先只在 files+preferences 落盘时已存在 2 个，缺失列表为 "cache,temp,database"，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0007 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_06.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      expect(countExisting(context, name)).assertEqual(2);
      expect(countMissing(context, name).join(',')).assertEqual('cache,temp,database');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('01100');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0007 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0008
     * @tc.name      testStorageAreaSubset0008
     * @tc.desc      预先只在 cache+files+preferences 落盘时已存在 3 个，缺失列表为 "temp,database"，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0008 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_07.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      expect(countExisting(context, name)).assertEqual(3);
      expect(countMissing(context, name).join(',')).assertEqual('temp,database');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('11100');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0008 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0009
     * @tc.name      testStorageAreaSubset0009
     * @tc.desc      预先只在 temp 落盘时已存在 1 个，缺失列表为 "cache,files,preferences,database"，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0009 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_08.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.tempDir, name));
      expect(countExisting(context, name)).assertEqual(1);
      expect(countMissing(context, name).join(',')).assertEqual('cache,files,preferences,database');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('00010');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0009 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0010
     * @tc.name      testStorageAreaSubset0010
     * @tc.desc      预先只在 cache+temp 落盘时已存在 2 个，缺失列表为 "files,preferences,database"，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0010 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_09.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      expect(countExisting(context, name)).assertEqual(2);
      expect(countMissing(context, name).join(',')).assertEqual('files,preferences,database');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('10010');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0010 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0011
     * @tc.name      testStorageAreaSubset0011
     * @tc.desc      预先只在 files+temp 落盘时已存在 2 个，缺失列表为 "cache,preferences,database"，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0011 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_10.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      expect(countExisting(context, name)).assertEqual(2);
      expect(countMissing(context, name).join(',')).assertEqual('cache,preferences,database');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('01010');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0011 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0012
     * @tc.name      testStorageAreaSubset0012
     * @tc.desc      预先只在 cache+files+temp 落盘时已存在 3 个，缺失列表为 "preferences,database"，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0012 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_11.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      expect(countExisting(context, name)).assertEqual(3);
      expect(countMissing(context, name).join(',')).assertEqual('preferences,database');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('11010');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0012 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0013
     * @tc.name      testStorageAreaSubset0013
     * @tc.desc      预先只在 preferences+temp 落盘时已存在 2 个，缺失列表为 "cache,files,database"，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0013 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_12.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      expect(countExisting(context, name)).assertEqual(2);
      expect(countMissing(context, name).join(',')).assertEqual('cache,files,database');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('00110');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0013 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0014
     * @tc.name      testStorageAreaSubset0014
     * @tc.desc      预先只在 cache+preferences+temp 落盘时已存在 3 个，缺失列表为 "files,database"，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0014 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_13.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      expect(countExisting(context, name)).assertEqual(3);
      expect(countMissing(context, name).join(',')).assertEqual('files,database');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('10110');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0014 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0015
     * @tc.name      testStorageAreaSubset0015
     * @tc.desc      预先只在 files+preferences+temp 落盘时已存在 3 个，缺失列表为 "cache,database"，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0015 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_14.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      expect(countExisting(context, name)).assertEqual(3);
      expect(countMissing(context, name).join(',')).assertEqual('cache,database');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('01110');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0015 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0016
     * @tc.name      testStorageAreaSubset0016
     * @tc.desc      预先只在 cache+files+preferences+temp 落盘时已存在 4 个，缺失列表为 "database"，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0016 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_15.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      expect(countExisting(context, name)).assertEqual(4);
      expect(countMissing(context, name).join(',')).assertEqual('database');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('11110');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0016 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0017
     * @tc.name      testStorageAreaSubset0017
     * @tc.desc      预先只在 database 落盘时已存在 1 个，缺失列表为 "cache,files,preferences,temp"，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0017 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_16.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(countExisting(context, name)).assertEqual(1);
      expect(countMissing(context, name).join(',')).assertEqual('cache,files,preferences,temp');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('00001');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0017 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0018
     * @tc.name      testStorageAreaSubset0018
     * @tc.desc      预先只在 cache+database 落盘时已存在 2 个，缺失列表为 "files,preferences,temp"，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0018 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_17.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(countExisting(context, name)).assertEqual(2);
      expect(countMissing(context, name).join(',')).assertEqual('files,preferences,temp');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('10001');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0018 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0019
     * @tc.name      testStorageAreaSubset0019
     * @tc.desc      预先只在 files+database 落盘时已存在 2 个，缺失列表为 "cache,preferences,temp"，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0019 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_18.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(countExisting(context, name)).assertEqual(2);
      expect(countMissing(context, name).join(',')).assertEqual('cache,preferences,temp');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('01001');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0019 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0020
     * @tc.name      testStorageAreaSubset0020
     * @tc.desc      预先只在 cache+files+database 落盘时已存在 3 个，缺失列表为 "preferences,temp"，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0020 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_19.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(countExisting(context, name)).assertEqual(3);
      expect(countMissing(context, name).join(',')).assertEqual('preferences,temp');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('11001');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0020 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0021
     * @tc.name      testStorageAreaSubset0021
     * @tc.desc      预先只在 preferences+database 落盘时已存在 2 个，缺失列表为 "cache,files,temp"，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0021 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_20.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(countExisting(context, name)).assertEqual(2);
      expect(countMissing(context, name).join(',')).assertEqual('cache,files,temp');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('00101');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0021 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0022
     * @tc.name      testStorageAreaSubset0022
     * @tc.desc      预先只在 cache+preferences+database 落盘时已存在 3 个，缺失列表为 "files,temp"，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0022 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_21.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(countExisting(context, name)).assertEqual(3);
      expect(countMissing(context, name).join(',')).assertEqual('files,temp');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('10101');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0022 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0023
     * @tc.name      testStorageAreaSubset0023
     * @tc.desc      预先只在 files+preferences+database 落盘时已存在 3 个，缺失列表为 "cache,temp"，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0023 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_22.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(countExisting(context, name)).assertEqual(3);
      expect(countMissing(context, name).join(',')).assertEqual('cache,temp');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('01101');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0023 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0024
     * @tc.name      testStorageAreaSubset0024
     * @tc.desc      预先只在 cache+files+preferences+database 落盘时已存在 4 个，缺失列表为 "temp"，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0024 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_23.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(countExisting(context, name)).assertEqual(4);
      expect(countMissing(context, name).join(',')).assertEqual('temp');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('11101');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0024 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0025
     * @tc.name      testStorageAreaSubset0025
     * @tc.desc      预先只在 temp+database 落盘时已存在 2 个，缺失列表为 "cache,files,preferences"，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0025 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_24.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.tempDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(countExisting(context, name)).assertEqual(2);
      expect(countMissing(context, name).join(',')).assertEqual('cache,files,preferences');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('00011');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0025 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0026
     * @tc.name      testStorageAreaSubset0026
     * @tc.desc      预先只在 cache+temp+database 落盘时已存在 3 个，缺失列表为 "files,preferences"，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0026 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_25.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(countExisting(context, name)).assertEqual(3);
      expect(countMissing(context, name).join(',')).assertEqual('files,preferences');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('10011');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0026 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0027
     * @tc.name      testStorageAreaSubset0027
     * @tc.desc      预先只在 files+temp+database 落盘时已存在 3 个，缺失列表为 "cache,preferences"，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0027 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_26.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(countExisting(context, name)).assertEqual(3);
      expect(countMissing(context, name).join(',')).assertEqual('cache,preferences');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('01011');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0027 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0028
     * @tc.name      testStorageAreaSubset0028
     * @tc.desc      预先只在 cache+files+temp+database 落盘时已存在 4 个，缺失列表为 "preferences"，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0028 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_27.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(countExisting(context, name)).assertEqual(4);
      expect(countMissing(context, name).join(',')).assertEqual('preferences');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('11011');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0028 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0029
     * @tc.name      testStorageAreaSubset0029
     * @tc.desc      预先只在 preferences+temp+database 落盘时已存在 3 个，缺失列表为 "cache,files"，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0029 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_28.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(countExisting(context, name)).assertEqual(3);
      expect(countMissing(context, name).join(',')).assertEqual('cache,files');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('00111');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0029 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0030
     * @tc.name      testStorageAreaSubset0030
     * @tc.desc      预先只在 cache+preferences+temp+database 落盘时已存在 4 个，缺失列表为 "files"，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0030 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_29.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(countExisting(context, name)).assertEqual(4);
      expect(countMissing(context, name).join(',')).assertEqual('files');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('10111');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0030 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0031
     * @tc.name      testStorageAreaSubset0031
     * @tc.desc      预先只在 files+preferences+temp+database 落盘时已存在 4 个，缺失列表为 "cache"，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0031 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_30.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(countExisting(context, name)).assertEqual(4);
      expect(countMissing(context, name).join(',')).assertEqual('cache');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('01111');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0031 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0032
     * @tc.name      testStorageAreaSubset0032
     * @tc.desc      预先只在 cache+files+preferences+temp+database 落盘时已存在 5 个，缺失列表为 空串，createStorageFiles 补齐后五个全在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testStorageAreaSubset0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0032 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_fill_31.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(countExisting(context, name)).assertEqual(5);
      expect(countMissing(context, name).join(',')).assertEqual('');
      expect(listStoragePaths(context, name).map((record: StoragePathRecord) => record.exists ? '1' : '0').join('')).assertEqual('11111');
      const result: StorageOperationResult = createStorageFiles(context, name);
      expect(result.success).assertTrue();
      expect(result.createdCount).assertEqual(5);
      expect(result.missing.length).assertEqual(0);
      expect(removeStorageFiles(context, name)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0032 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0033
     * @tc.name      testStorageAreaSubset0033
     * @tc.desc      只在 无目录 落盘时 removeStorageFiles 返回 0，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testStorageAreaSubset0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0033 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_00.txt';
      removeStorageFiles(context, name);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0033 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0034
     * @tc.name      testStorageAreaSubset0034
     * @tc.desc      只在 cache 落盘时 removeStorageFiles 返回 1，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0034 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_01.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      expect(removeStorageFiles(context, name)).assertEqual(1);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0034 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0035
     * @tc.name      testStorageAreaSubset0035
     * @tc.desc      只在 files 落盘时 removeStorageFiles 返回 1，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0035 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_02.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.filesDir, name));
      expect(removeStorageFiles(context, name)).assertEqual(1);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0035 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0036
     * @tc.name      testStorageAreaSubset0036
     * @tc.desc      只在 cache+files 落盘时 removeStorageFiles 返回 2，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0036 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_03.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.filesDir, name));
      expect(removeStorageFiles(context, name)).assertEqual(2);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0036 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0037
     * @tc.name      testStorageAreaSubset0037
     * @tc.desc      只在 preferences 落盘时 removeStorageFiles 返回 1，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0037 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_04.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      expect(removeStorageFiles(context, name)).assertEqual(1);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0037 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0038
     * @tc.name      testStorageAreaSubset0038
     * @tc.desc      只在 cache+preferences 落盘时 removeStorageFiles 返回 2，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0038 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_05.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      expect(removeStorageFiles(context, name)).assertEqual(2);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0038 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0039
     * @tc.name      testStorageAreaSubset0039
     * @tc.desc      只在 files+preferences 落盘时 removeStorageFiles 返回 2，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0039 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_06.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      expect(removeStorageFiles(context, name)).assertEqual(2);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0039 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0040
     * @tc.name      testStorageAreaSubset0040
     * @tc.desc      只在 cache+files+preferences 落盘时 removeStorageFiles 返回 3，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0040 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_07.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      expect(removeStorageFiles(context, name)).assertEqual(3);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0040 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0041
     * @tc.name      testStorageAreaSubset0041
     * @tc.desc      只在 temp 落盘时 removeStorageFiles 返回 1，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0041 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_08.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.tempDir, name));
      expect(removeStorageFiles(context, name)).assertEqual(1);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0041 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0042
     * @tc.name      testStorageAreaSubset0042
     * @tc.desc      只在 cache+temp 落盘时 removeStorageFiles 返回 2，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0042 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_09.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      expect(removeStorageFiles(context, name)).assertEqual(2);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0042 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0043
     * @tc.name      testStorageAreaSubset0043
     * @tc.desc      只在 files+temp 落盘时 removeStorageFiles 返回 2，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0043 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_10.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      expect(removeStorageFiles(context, name)).assertEqual(2);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0043 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0044
     * @tc.name      testStorageAreaSubset0044
     * @tc.desc      只在 cache+files+temp 落盘时 removeStorageFiles 返回 3，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0044 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_11.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      expect(removeStorageFiles(context, name)).assertEqual(3);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0044 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0045
     * @tc.name      testStorageAreaSubset0045
     * @tc.desc      只在 preferences+temp 落盘时 removeStorageFiles 返回 2，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0045 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_12.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      expect(removeStorageFiles(context, name)).assertEqual(2);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0045 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0046
     * @tc.name      testStorageAreaSubset0046
     * @tc.desc      只在 cache+preferences+temp 落盘时 removeStorageFiles 返回 3，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0046 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_13.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      expect(removeStorageFiles(context, name)).assertEqual(3);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0046 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0047
     * @tc.name      testStorageAreaSubset0047
     * @tc.desc      只在 files+preferences+temp 落盘时 removeStorageFiles 返回 3，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0047 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_14.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      expect(removeStorageFiles(context, name)).assertEqual(3);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0047 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0048
     * @tc.name      testStorageAreaSubset0048
     * @tc.desc      只在 cache+files+preferences+temp 落盘时 removeStorageFiles 返回 4，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0048 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_15.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      expect(removeStorageFiles(context, name)).assertEqual(4);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0048 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0049
     * @tc.name      testStorageAreaSubset0049
     * @tc.desc      只在 database 落盘时 removeStorageFiles 返回 1，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0049 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_16.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(removeStorageFiles(context, name)).assertEqual(1);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0049 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0050
     * @tc.name      testStorageAreaSubset0050
     * @tc.desc      只在 cache+database 落盘时 removeStorageFiles 返回 2，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0050 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_17.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(removeStorageFiles(context, name)).assertEqual(2);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0050 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0051
     * @tc.name      testStorageAreaSubset0051
     * @tc.desc      只在 files+database 落盘时 removeStorageFiles 返回 2，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0051 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_18.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(removeStorageFiles(context, name)).assertEqual(2);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0051 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0052
     * @tc.name      testStorageAreaSubset0052
     * @tc.desc      只在 cache+files+database 落盘时 removeStorageFiles 返回 3，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0052 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_19.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(removeStorageFiles(context, name)).assertEqual(3);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0052 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0053
     * @tc.name      testStorageAreaSubset0053
     * @tc.desc      只在 preferences+database 落盘时 removeStorageFiles 返回 2，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0053 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_20.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(removeStorageFiles(context, name)).assertEqual(2);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0053 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0054
     * @tc.name      testStorageAreaSubset0054
     * @tc.desc      只在 cache+preferences+database 落盘时 removeStorageFiles 返回 3，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0054 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_21.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(removeStorageFiles(context, name)).assertEqual(3);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0054 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0055
     * @tc.name      testStorageAreaSubset0055
     * @tc.desc      只在 files+preferences+database 落盘时 removeStorageFiles 返回 3，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0055 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_22.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(removeStorageFiles(context, name)).assertEqual(3);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0055 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0056
     * @tc.name      testStorageAreaSubset0056
     * @tc.desc      只在 cache+files+preferences+database 落盘时 removeStorageFiles 返回 4，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0056 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_23.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(removeStorageFiles(context, name)).assertEqual(4);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0056 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0057
     * @tc.name      testStorageAreaSubset0057
     * @tc.desc      只在 temp+database 落盘时 removeStorageFiles 返回 2，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0057 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_24.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.tempDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(removeStorageFiles(context, name)).assertEqual(2);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0057 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0058
     * @tc.name      testStorageAreaSubset0058
     * @tc.desc      只在 cache+temp+database 落盘时 removeStorageFiles 返回 3，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0058 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_25.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(removeStorageFiles(context, name)).assertEqual(3);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0058 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0059
     * @tc.name      testStorageAreaSubset0059
     * @tc.desc      只在 files+temp+database 落盘时 removeStorageFiles 返回 3，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0059 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_26.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(removeStorageFiles(context, name)).assertEqual(3);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0059 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0060
     * @tc.name      testStorageAreaSubset0060
     * @tc.desc      只在 cache+files+temp+database 落盘时 removeStorageFiles 返回 4，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0060 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_27.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(removeStorageFiles(context, name)).assertEqual(4);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0060 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0061
     * @tc.name      testStorageAreaSubset0061
     * @tc.desc      只在 preferences+temp+database 落盘时 removeStorageFiles 返回 3，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0061 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_28.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(removeStorageFiles(context, name)).assertEqual(3);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0061 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0062
     * @tc.name      testStorageAreaSubset0062
     * @tc.desc      只在 cache+preferences+temp+database 落盘时 removeStorageFiles 返回 4，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0062 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_29.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(removeStorageFiles(context, name)).assertEqual(4);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0062 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0063
     * @tc.name      testStorageAreaSubset0063
     * @tc.desc      只在 files+preferences+temp+database 落盘时 removeStorageFiles 返回 4，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaSubset0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0063 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_30.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(removeStorageFiles(context, name)).assertEqual(4);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0063 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_SUBSET_0064
     * @tc.name      testStorageAreaSubset0064
     * @tc.desc      只在 cache+files+preferences+temp+database 落盘时 removeStorageFiles 返回 5，删除后五个目录全部缺失，再删返回 0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testStorageAreaSubset0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0064 begin');
      const context: common.Context = getAppContext();
      const name: string = '/subset_drop_31.txt';
      removeStorageFiles(context, name);
      createStorageFile(joinStoragePath(context.cacheDir, name));
      createStorageFile(joinStoragePath(context.filesDir, name));
      createStorageFile(joinStoragePath(context.preferencesDir, name));
      createStorageFile(joinStoragePath(context.tempDir, name));
      createStorageFile(joinStoragePath(context.databaseDir, name));
      expect(removeStorageFiles(context, name)).assertEqual(5);
      expect(countExisting(context, name)).assertEqual(0);
      expect(countMissing(context, name).length).assertEqual(5);
      expect(removeStorageFiles(context, name)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaSubset0064 end');
    })
  })
}
