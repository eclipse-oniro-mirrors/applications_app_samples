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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
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
      const dir: string = '/data/app/cache';
      const joined: string = joinStoragePath(dir, '');
      expect(joined).assertEqual(dir);
      expect(joined.endsWith('/')).assertFalse();
      expect(joined.length).assertEqual(dir.length);
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
      expect(joinStoragePath('/data/app/files', '/test.txt')).assertEqual('/data/app/files/test.txt');
      expect(joinStoragePath('/data/app/files', '///test.txt')).assertEqual('/data/app/files/test.txt');
      expect(joinStoragePath('/data/app/files', 'test.txt')).assertEqual('/data/app/files/test.txt');
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
      const joined: string = joinStoragePath('/a/b', 'x/y.txt');
      expect(joined).assertEqual('/a/b/x/y.txt');
      expect(joined.includes('/x/y.txt')).assertTrue();
      expect(joined.startsWith('/a/b/')).assertTrue();
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
      expect(joinStoragePath('', '')).assertEqual('');
      expect(joinStoragePath('', 'a.txt')).assertEqual('/a.txt');
      expect(joinStoragePath('', '/a.txt')).assertEqual('/a.txt');
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
      const name: string = ' name.txt ';
      const joined: string = joinStoragePath('/d', name);
      expect(joined).assertEqual('/d/ name.txt ');
      expect(joined.endsWith(' ')).assertTrue();
      expect(joined.length).assertEqual(3 + name.length);
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
      const context: common.Context = getAppContext();
      expect(resolveStorageDir(context, StorageArea.CACHE)).assertEqual(context.cacheDir);
      expect(resolveStorageDir(context, StorageArea.FILES)).assertEqual(context.filesDir);
      expect(resolveStorageDir(context, StorageArea.PREFERENCES)).assertEqual(context.preferencesDir);
      expect(resolveStorageDir(context, StorageArea.TEMP)).assertEqual(context.tempDir);
      expect(resolveStorageDir(context, StorageArea.DATABASE)).assertEqual(context.databaseDir);
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
      const context: common.Context = getAppContext();
      const dirs: string[] = STORAGE_AREAS.map((area: StorageArea) => resolveStorageDir(context, area));
      expect(dirs.length).assertEqual(5);
      expect(dirs.filter((dir: string, index: number) => dirs.indexOf(dir) === index).length).assertEqual(5);
      dirs.forEach((dir: string) => {
        expect(dir.startsWith('/')).assertTrue();
        expect(dir.endsWith('/')).assertFalse();
      });
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
      const context: common.Context = getAppContext();
      const record: StoragePathRecord = recordStoragePath(context, StorageArea.CACHE, '/shape_probe.txt');
      expect(record.area).assertEqual(StorageArea.CACHE);
      expect(record.dir).assertEqual(context.cacheDir);
      expect(record.filePath).assertEqual(`${context.cacheDir}/shape_probe.txt`);
      expect(record.exists === true || record.exists === false).assertTrue();
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
      const context: common.Context = getAppContext();
      const name: string = '/never_created_probe_9f3.txt';
      const record: StoragePathRecord = recordStoragePath(context, StorageArea.FILES, name);
      expect(record.exists).assertFalse();
      expect(record.filePath.endsWith(name)).assertTrue();
      expect(record.filePath.startsWith(context.filesDir)).assertTrue();
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
      const context: common.Context = getAppContext();
      const records: StoragePathRecord[] = listStoragePaths(context);
      expect(records.length).assertEqual(STORAGE_AREAS.length);
      records.forEach((record: StoragePathRecord, index: number) => {
        expect(record.area).assertEqual(STORAGE_AREAS[index]);
      });
      expect(records.every((record: StoragePathRecord) => record.filePath.endsWith(SAMPLE_FILE_NAME))).assertTrue();
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
      const context: common.Context = getAppContext();
      const records: StoragePathRecord[] = listStoragePaths(context, '/custom_probe.txt');
      expect(records.length).assertEqual(5);
      expect(records.every((record: StoragePathRecord) => record.filePath.endsWith('/custom_probe.txt'))).assertTrue();
      expect(records.filter((record: StoragePathRecord) => record.dir.length > 0).length).assertEqual(5);
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
      const context: common.Context = getAppContext();
      const name: string = '/count_probe.txt';
      const existing: number = countExisting(context, name);
      const missing: StorageArea[] = countMissing(context, name);
      expect(existing + missing.length).assertEqual(5);
      expect(existing >= 0 && existing <= 5).assertTrue();
      expect(missing.length).assertEqual(5 - existing);
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
      const context: common.Context = getAppContext();
      const missing: StorageArea[] = countMissing(context, '/missing_probe.txt');
      expect(missing.length <= 5).assertTrue();
      expect(missing.filter((area: StorageArea, index: number) => missing.indexOf(area) === index).length)
        .assertEqual(missing.length);
      missing.forEach((area: StorageArea) => {
        expect(STORAGE_AREAS.indexOf(area) >= 0).assertTrue();
      });
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
      expect(STORAGE_AREAS.length).assertEqual(5);
      expect(STORAGE_AREAS.indexOf(StorageArea.CACHE)).assertEqual(0);
      expect(STORAGE_AREAS.indexOf(StorageArea.TEMP)).assertEqual(3);
      expect(STORAGE_AREAS.indexOf(StorageArea.DATABASE)).assertEqual(4);
    })
  })
}
