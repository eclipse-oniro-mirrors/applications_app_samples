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
import { fileIo } from '@kit.CoreFileKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  createStorageFile,
  recordStoragePath,
  StorageArea,
  StoragePathRecord
} from '../../../main/ets/model/StoragePath';
import { getAppContext, loadEntryModuleContext, removeFileIfExists } from './TestHelper';

const DOMAIN: number = 0xFF00;
const TAG: string = '[Sample_AbilityFeature_AreaRecord]';

export default function storageAreaRecordTailTest(): void {
  describe('AbilityFeatureStorageAreaRecordTailTest', () => {
    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0071
     * @tc.name      testStorageAreaRecord0071
     * @tc.desc      entry 模块 Context下 temp 目录记录文件 "/rec.multi.dot.log"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0071 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '/rec.multi.dot.log';
      removeFileIfExists(recordStoragePath(context, StorageArea.TEMP, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.TEMP, name);
      expect(before.area).assertEqual(StorageArea.TEMP);
      expect(before.dir).assertEqual(context.tempDir);
      expect(before.dir.endsWith('/temp')).assertTrue();
      expect(before.filePath).assertEqual(context.tempDir + '/rec.multi.dot.log');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0071 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0072
     * @tc.name      testStorageAreaRecord0072
     * @tc.desc      entry 模块 Context下 temp 目录记录文件 "/rec_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0072 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '/rec_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.TEMP, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.TEMP, name);
      expect(before.area).assertEqual(StorageArea.TEMP);
      expect(before.dir).assertEqual(context.tempDir);
      expect(before.dir.endsWith('/temp')).assertTrue();
      expect(before.filePath).assertEqual(context.tempDir + '/rec_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0072 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0073
     * @tc.name      testStorageAreaRecord0073
     * @tc.desc      entry 模块 Context下 database 目录记录文件 "/rec_plain.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testStorageAreaRecord0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0073 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '/rec_plain.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.DATABASE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.DATABASE, name);
      expect(before.area).assertEqual(StorageArea.DATABASE);
      expect(before.dir).assertEqual(context.databaseDir);
      expect(before.dir.includes('/database')).assertTrue();
      expect(before.filePath).assertEqual(context.databaseDir + '/rec_plain.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0073 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0074
     * @tc.name      testStorageAreaRecord0074
     * @tc.desc      entry 模块 Context下 database 目录记录文件 "rec_noslash.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testStorageAreaRecord0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0074 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = 'rec_noslash.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.DATABASE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.DATABASE, name);
      expect(before.area).assertEqual(StorageArea.DATABASE);
      expect(before.dir).assertEqual(context.databaseDir);
      expect(before.dir.includes('/database')).assertTrue();
      expect(before.filePath).assertEqual(context.databaseDir + '/rec_noslash.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0074 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0075
     * @tc.name      testStorageAreaRecord0075
     * @tc.desc      entry 模块 Context下 database 目录记录文件 "//rec_double.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaRecord0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0075 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '//rec_double.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.DATABASE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.DATABASE, name);
      expect(before.area).assertEqual(StorageArea.DATABASE);
      expect(before.dir).assertEqual(context.databaseDir);
      expect(before.dir.includes('/database')).assertTrue();
      expect(before.filePath).assertEqual(context.databaseDir + '/rec_double.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0075 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0076
     * @tc.name      testStorageAreaRecord0076
     * @tc.desc      entry 模块 Context下 database 目录记录文件 "/rec_中文.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaRecord0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0076 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '/rec_中文.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.DATABASE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.DATABASE, name);
      expect(before.area).assertEqual(StorageArea.DATABASE);
      expect(before.dir).assertEqual(context.databaseDir);
      expect(before.dir.includes('/database')).assertTrue();
      expect(before.filePath).assertEqual(context.databaseDir + '/rec_中文.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0076 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0077
     * @tc.name      testStorageAreaRecord0077
     * @tc.desc      entry 模块 Context下 database 目录记录文件 "/rec sp.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0077 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '/rec sp.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.DATABASE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.DATABASE, name);
      expect(before.area).assertEqual(StorageArea.DATABASE);
      expect(before.dir).assertEqual(context.databaseDir);
      expect(before.dir.includes('/database')).assertTrue();
      expect(before.filePath).assertEqual(context.databaseDir + '/rec sp.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0077 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0078
     * @tc.name      testStorageAreaRecord0078
     * @tc.desc      entry 模块 Context下 database 目录记录文件 "/.rec_hidden"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0078 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '/.rec_hidden';
      removeFileIfExists(recordStoragePath(context, StorageArea.DATABASE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.DATABASE, name);
      expect(before.area).assertEqual(StorageArea.DATABASE);
      expect(before.dir).assertEqual(context.databaseDir);
      expect(before.dir.includes('/database')).assertTrue();
      expect(before.filePath).assertEqual(context.databaseDir + '/.rec_hidden');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0078 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0079
     * @tc.name      testStorageAreaRecord0079
     * @tc.desc      entry 模块 Context下 database 目录记录文件 "/rec.multi.dot.log"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0079 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '/rec.multi.dot.log';
      removeFileIfExists(recordStoragePath(context, StorageArea.DATABASE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.DATABASE, name);
      expect(before.area).assertEqual(StorageArea.DATABASE);
      expect(before.dir).assertEqual(context.databaseDir);
      expect(before.dir.includes('/database')).assertTrue();
      expect(before.filePath).assertEqual(context.databaseDir + '/rec.multi.dot.log');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0079 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0080
     * @tc.name      testStorageAreaRecord0080
     * @tc.desc      entry 模块 Context下 database 目录记录文件 "/rec_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0080 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '/rec_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.DATABASE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.DATABASE, name);
      expect(before.area).assertEqual(StorageArea.DATABASE);
      expect(before.dir).assertEqual(context.databaseDir);
      expect(before.dir.includes('/database')).assertTrue();
      expect(before.filePath).assertEqual(context.databaseDir + '/rec_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0080 end');
      done();
    })
  })
}
