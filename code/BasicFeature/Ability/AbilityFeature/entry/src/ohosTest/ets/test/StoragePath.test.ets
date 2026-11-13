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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { common } from '@kit.AbilityKit';
import {
  countExisting,
  countMissing,
  joinStoragePath,
  listStoragePaths,
  recordStoragePath,
  resolveStorageDir,
  STORAGE_AREAS,
  StorageArea,
  StoragePathRecord
} from '../../../main/ets/model/StoragePath';
import { SAMPLE_FILE_NAME } from '../../../main/ets/common/AppConstants';
import { getAppContext } from './TestHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AbilityFeature]';

export default function storagePathTest() {
  describe('AbilityFeatureStoragePathTest', () => {
    /**
     * @tc.number    SUB_ABILITY_FEATURE_STORAGE_PATH_0001
     * @tc.name      testJoinStoragePathEmptyName0001
     * @tc.desc      文件名为空时直接返回目录，不产生以斜杠结尾的路径
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testJoinStoragePathEmptyName0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinStoragePathEmptyName0001 begin');
      const dir: string = '/data/app/cache';
      const joined: string = joinStoragePath(dir, '');
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinStoragePathEmptyName0001 assert1 joined=${joined}`);
      expect(joined).assertEqual(dir);
      const actual2: boolean = joined.endsWith('/');
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinStoragePathEmptyName0001 assert2 joined.endsWith=${actual2}`);
      expect(actual2).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinStoragePathEmptyName0001 assert3 joined.length=${joined.length}`);
      expect(joined.length).assertEqual(dir.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinStoragePathEmptyName0001 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_STORAGE_PATH_0002
     * @tc.name      testJoinStoragePathLeadingSlash0002
     * @tc.desc      文件名带一个或多个前导斜杠时只保留一个分隔符
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testJoinStoragePathLeadingSlash0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinStoragePathLeadingSlash0002 begin');
      const actual1: string = joinStoragePath('/data/app/files', '/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinStoragePathLeadingSlash0002 assert1 joinStoragePath=${actual1}`);
      expect(actual1).assertEqual('/data/app/files/test.txt');
      const actual2: string = joinStoragePath('/data/app/files', '///test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinStoragePathLeadingSlash0002 assert2 joinStoragePath=${actual2}`);
      expect(actual2).assertEqual('/data/app/files/test.txt');
      const actual3: string = joinStoragePath('/data/app/files', 'test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinStoragePathLeadingSlash0002 assert3 joinStoragePath=${actual3}`);
      expect(actual3).assertEqual('/data/app/files/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinStoragePathLeadingSlash0002 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_STORAGE_PATH_0003
     * @tc.name      testJoinStoragePathInnerSlash0003
     * @tc.desc      文件名内部的斜杠原样保留，可拼出多级路径
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testJoinStoragePathInnerSlash0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinStoragePathInnerSlash0003 begin');
      const joined: string = joinStoragePath('/a/b', 'x/y.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinStoragePathInnerSlash0003 assert1 joined=${joined}`);
      expect(joined).assertEqual('/a/b/x/y.txt');
      const actual2: boolean = joined.includes('/x/y.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinStoragePathInnerSlash0003 assert2 joined.includes=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = joined.startsWith('/a/b/');
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinStoragePathInnerSlash0003 assert3 joined.startsWith=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinStoragePathInnerSlash0003 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_STORAGE_PATH_0004
     * @tc.name      testJoinStoragePathEmptyDir0004
     * @tc.desc      目录为空串时，结果只含分隔符与文件名
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testJoinStoragePathEmptyDir0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinStoragePathEmptyDir0004 begin');
      const actual1: string = joinStoragePath('', '');
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinStoragePathEmptyDir0004 assert1 joinStoragePath=${actual1}`);
      expect(actual1).assertEqual('');
      const actual2: string = joinStoragePath('', 'a.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinStoragePathEmptyDir0004 assert2 joinStoragePath=${actual2}`);
      expect(actual2).assertEqual('/a.txt');
      const actual3: string = joinStoragePath('', '/a.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinStoragePathEmptyDir0004 assert3 joinStoragePath=${actual3}`);
      expect(actual3).assertEqual('/a.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinStoragePathEmptyDir0004 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_STORAGE_PATH_0005
     * @tc.name      testJoinStoragePathKeepsSpaces0005
     * @tc.desc      文件名首尾空格不被裁剪，拼接结果保持原样
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testJoinStoragePathKeepsSpaces0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinStoragePathKeepsSpaces0005 begin');
      const name: string = ' name.txt ';
      const joined: string = joinStoragePath('/d', name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinStoragePathKeepsSpaces0005 assert1 joined=${joined}`);
      expect(joined).assertEqual('/d/ name.txt ');
      const actual2: boolean = joined.endsWith(' ');
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinStoragePathKeepsSpaces0005 assert2 joined.endsWith=${actual2}`);
      expect(actual2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testJoinStoragePathKeepsSpaces0005 assert3 joined.length=${joined.length}`);
      expect(joined.length).assertEqual(3 + name.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testJoinStoragePathKeepsSpaces0005 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_STORAGE_PATH_0006
     * @tc.name      testResolveStorageDirMapping0006
     * @tc.desc      五类沙箱目录分别映射到 Context 上对应的目录属性
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testResolveStorageDirMapping0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolveStorageDirMapping0006 begin');
      const context: common.Context = getAppContext();
      const actual1: string = resolveStorageDir(context, StorageArea.CACHE);
      hilog.info(DOMAIN, TAG, '%{public}s', `testResolveStorageDirMapping0006 assert1 resolveStorageDir=${actual1}`);
      expect(actual1).assertEqual(context.cacheDir);
      const actual2: string = resolveStorageDir(context, StorageArea.FILES);
      hilog.info(DOMAIN, TAG, '%{public}s', `testResolveStorageDirMapping0006 assert2 resolveStorageDir=${actual2}`);
      expect(actual2).assertEqual(context.filesDir);
      const actual3: string = resolveStorageDir(context, StorageArea.PREFERENCES);
      hilog.info(DOMAIN, TAG, '%{public}s', `testResolveStorageDirMapping0006 assert3 resolveStorageDir=${actual3}`);
      expect(actual3).assertEqual(context.preferencesDir);
      const actual4: string = resolveStorageDir(context, StorageArea.TEMP);
      hilog.info(DOMAIN, TAG, '%{public}s', `testResolveStorageDirMapping0006 assert4 resolveStorageDir=${actual4}`);
      expect(actual4).assertEqual(context.tempDir);
      const actual5: string = resolveStorageDir(context, StorageArea.DATABASE);
      hilog.info(DOMAIN, TAG, '%{public}s', `testResolveStorageDirMapping0006 assert5 resolveStorageDir=${actual5}`);
      expect(actual5).assertEqual(context.databaseDir);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolveStorageDirMapping0006 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_STORAGE_PATH_0007
     * @tc.name      testResolveStorageDirDistinct0007
     * @tc.desc      五类目录互不相同且都是绝对路径
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testResolveStorageDirDistinct0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolveStorageDirDistinct0007 begin');
      const context: common.Context = getAppContext();
      const dirs: string[] = STORAGE_AREAS.map((area: StorageArea) => resolveStorageDir(context, area));
      hilog.info(DOMAIN, TAG, '%{public}s', `testResolveStorageDirDistinct0007 assert1 dirs.length=${dirs.length}`);
      expect(dirs.length).assertEqual(5);
      const actual2: number = dirs.filter((dir: string, index: number) => dirs.indexOf(dir) === index).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `testResolveStorageDirDistinct0007 assert2 dirs.filter.length=${actual2}`);
      expect(actual2).assertEqual(5);
      dirs.forEach((dir: string) => {
        const actual3: boolean = dir.startsWith('/');
        hilog.info(DOMAIN, TAG, '%{public}s', `testResolveStorageDirDistinct0007 assert3 dir.startsWith=${actual3}`);
        expect(actual3).assertTrue();
        const actual4: boolean = dir.endsWith('/');
        hilog.info(DOMAIN, TAG, '%{public}s', `testResolveStorageDirDistinct0007 assert4 dir.endsWith=${actual4}`);
        expect(actual4).assertFalse();
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'testResolveStorageDirDistinct0007 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_STORAGE_PATH_0008
     * @tc.name      testRecordStoragePathShape0008
     * @tc.desc      路径记录里的目录、文件路径与区域字段保持一致
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordStoragePathShape0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecordStoragePathShape0008 begin');
      const context: common.Context = getAppContext();
      const record: StoragePathRecord = recordStoragePath(context, StorageArea.CACHE, '/shape_probe.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `testRecordStoragePathShape0008 assert1 record.area=${record.area}`);
      expect(record.area).assertEqual(StorageArea.CACHE);
      hilog.info(DOMAIN, TAG, '%{public}s', `testRecordStoragePathShape0008 assert2 record.dir=${record.dir}`);
      expect(record.dir).assertEqual(context.cacheDir);
      hilog.info(DOMAIN, TAG, '%{public}s', `testRecordStoragePathShape0008 assert3 record.filePath=${record.filePath}`);
      expect(record.filePath).assertEqual(`${context.cacheDir}/shape_probe.txt`);
      const actual4: boolean = record.exists === true || record.exists === false;
      hilog.info(DOMAIN, TAG, '%{public}s', `testRecordStoragePathShape0008 assert4 value=${actual4}`);
      expect(actual4).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecordStoragePathShape0008 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_STORAGE_PATH_0009
     * @tc.name      testRecordStoragePathMissingFile0009
     * @tc.desc      不存在的文件被记录为 exists=false，路径仍拼装完整
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRecordStoragePathMissingFile0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecordStoragePathMissingFile0009 begin');
      const context: common.Context = getAppContext();
      const name: string = '/never_created_probe_9f3.txt';
      const record: StoragePathRecord = recordStoragePath(context, StorageArea.FILES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testRecordStoragePathMissingFile0009 assert1 record.exists=${record.exists}`);
      expect(record.exists).assertFalse();
      const actual2: boolean = record.filePath.endsWith(name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testRecordStoragePathMissingFile0009 assert2 record.filePath.endsWith=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = record.filePath.startsWith(context.filesDir);
      hilog.info(DOMAIN, TAG, '%{public}s', `testRecordStoragePathMissingFile0009 assert3 record.filePath.startsWith=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecordStoragePathMissingFile0009 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_STORAGE_PATH_0010
     * @tc.name      testListStoragePathsDefaultName0010
     * @tc.desc      默认文件名下按固定顺序列出五个目录
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testListStoragePathsDefaultName0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListStoragePathsDefaultName0010 begin');
      const context: common.Context = getAppContext();
      const records: StoragePathRecord[] = listStoragePaths(context);
      hilog.info(DOMAIN, TAG, '%{public}s', `testListStoragePathsDefaultName0010 assert1 records.length=${records.length}`);
      expect(records.length).assertEqual(STORAGE_AREAS.length);
      records.forEach((record: StoragePathRecord, index: number) => {
        hilog.info(DOMAIN, TAG, '%{public}s', `testListStoragePathsDefaultName0010 assert2 record.area=${record.area}`);
        expect(record.area).assertEqual(STORAGE_AREAS[index]);
      });
      const actual3: boolean = records.every((record: StoragePathRecord) => record.filePath.endsWith(SAMPLE_FILE_NAME));
      hilog.info(DOMAIN, TAG, '%{public}s', `testListStoragePathsDefaultName0010 assert3 records.every=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListStoragePathsDefaultName0010 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_STORAGE_PATH_0011
     * @tc.name      testListStoragePathsCustomName0011
     * @tc.desc      自定义文件名会体现在全部五个目录的路径上
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testListStoragePathsCustomName0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListStoragePathsCustomName0011 begin');
      const context: common.Context = getAppContext();
      const records: StoragePathRecord[] = listStoragePaths(context, '/custom_probe.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `testListStoragePathsCustomName0011 assert1 records.length=${records.length}`);
      expect(records.length).assertEqual(5);
      const actual2: boolean = records.every((record: StoragePathRecord) => record.filePath.endsWith('/custom_probe.txt'));
      hilog.info(DOMAIN, TAG, '%{public}s', `testListStoragePathsCustomName0011 assert2 records.every=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: number = records.filter((record: StoragePathRecord) => record.dir.length > 0).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `testListStoragePathsCustomName0011 assert3 records.filter.length=${actual3}`);
      expect(actual3).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testListStoragePathsCustomName0011 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_STORAGE_PATH_0012
     * @tc.name      testCountExistingPlusMissing0012
     * @tc.desc      已存在数与缺失数之和恒为目录总数
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCountExistingPlusMissing0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountExistingPlusMissing0012 begin');
      const context: common.Context = getAppContext();
      const name: string = '/count_probe.txt';
      const existing: number = countExisting(context, name);
      const missing: StorageArea[] = countMissing(context, name);
      const actual1: number = existing + missing.length;
      hilog.info(DOMAIN, TAG, '%{public}s', `testCountExistingPlusMissing0012 assert1 value.length=${actual1}`);
      expect(actual1).assertEqual(5);
      const actual2: boolean = existing >= 0 && existing <= 5;
      hilog.info(DOMAIN, TAG, '%{public}s', `testCountExistingPlusMissing0012 assert2 value=${actual2}`);
      expect(actual2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `testCountExistingPlusMissing0012 assert3 missing.length=${missing.length}`);
      expect(missing.length).assertEqual(5 - existing);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountExistingPlusMissing0012 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_STORAGE_PATH_0013
     * @tc.name      testCountMissingNoDuplicate0013
     * @tc.desc      缺失列表不重复，且每项都是合法区域
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCountMissingNoDuplicate0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountMissingNoDuplicate0013 begin');
      const context: common.Context = getAppContext();
      const missing: StorageArea[] = countMissing(context, '/missing_probe.txt');
      const actual1: boolean = missing.length <= 5;
      hilog.info(DOMAIN, TAG, '%{public}s', `testCountMissingNoDuplicate0013 assert1 value=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: number = missing.filter((area: StorageArea, index: number) => missing.indexOf(area) === index).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `testCountMissingNoDuplicate0013 assert2 missing.filter.length=${actual2}`);
      expect(actual2).assertEqual(missing.length);
      missing.forEach((area: StorageArea) => {
        const actual3: boolean = STORAGE_AREAS.indexOf(area) >= 0;
        hilog.info(DOMAIN, TAG, '%{public}s', `testCountMissingNoDuplicate0013 assert3 STORAGE_AREAS.indexOf=${actual3}`);
        expect(actual3).assertTrue();
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCountMissingNoDuplicate0013 end');
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_STORAGE_PATH_0014
     * @tc.name      testStorageAreasConstant0014
     * @tc.desc      目录常量列表覆盖全部五个区域且顺序固定
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStorageAreasConstant0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreasConstant0014 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreasConstant0014 assert1 STORAGE_AREAS.length=${STORAGE_AREAS.length}`);
      expect(STORAGE_AREAS.length).assertEqual(5);
      const actual2: number = STORAGE_AREAS.indexOf(StorageArea.CACHE);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreasConstant0014 assert2 STORAGE_AREAS.indexOf=${actual2}`);
      expect(actual2).assertEqual(0);
      const actual3: number = STORAGE_AREAS.indexOf(StorageArea.TEMP);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreasConstant0014 assert3 STORAGE_AREAS.indexOf=${actual3}`);
      expect(actual3).assertEqual(3);
      const actual4: number = STORAGE_AREAS.indexOf(StorageArea.DATABASE);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreasConstant0014 assert4 STORAGE_AREAS.indexOf=${actual4}`);
      expect(actual4).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreasConstant0014 end');
    })
  })
}
