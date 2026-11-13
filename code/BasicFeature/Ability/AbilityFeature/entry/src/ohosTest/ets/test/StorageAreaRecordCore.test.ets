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

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AbilityFeature]';

export default function storageAreaRecordCoreTest(): void {
  describe('AbilityFeatureStorageAreaRecordCoreTest', () => {
    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0001
     * @tc.name      testStorageAreaRecord0001
     * @tc.desc      应用级 Context下 cache 目录记录文件 "/rec_plain.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testStorageAreaRecord0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0001 begin');
      const context: common.Context = getAppContext();
      const name: string = '/rec_plain.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.CACHE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.CACHE, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0001 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.CACHE);
      expect(before.dir).assertEqual(context.cacheDir);
      expect(before.dir.endsWith('/cache')).assertTrue();
      expect(before.filePath).assertEqual(context.cacheDir + '/rec_plain.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0001 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0002
     * @tc.name      testStorageAreaRecord0002
     * @tc.desc      应用级 Context下 cache 目录记录文件 "rec_noslash.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testStorageAreaRecord0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0002 begin');
      const context: common.Context = getAppContext();
      const name: string = 'rec_noslash.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.CACHE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.CACHE, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0002 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.CACHE);
      expect(before.dir).assertEqual(context.cacheDir);
      expect(before.dir.endsWith('/cache')).assertTrue();
      expect(before.filePath).assertEqual(context.cacheDir + '/rec_noslash.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0002 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0003
     * @tc.name      testStorageAreaRecord0003
     * @tc.desc      应用级 Context下 cache 目录记录文件 "//rec_double.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaRecord0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0003 begin');
      const context: common.Context = getAppContext();
      const name: string = '//rec_double.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.CACHE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.CACHE, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0003 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.CACHE);
      expect(before.dir).assertEqual(context.cacheDir);
      expect(before.dir.endsWith('/cache')).assertTrue();
      expect(before.filePath).assertEqual(context.cacheDir + '/rec_double.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0003 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0004
     * @tc.name      testStorageAreaRecord0004
     * @tc.desc      应用级 Context下 cache 目录记录文件 "/rec_中文.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaRecord0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0004 begin');
      const context: common.Context = getAppContext();
      const name: string = '/rec_中文.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.CACHE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.CACHE, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0004 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.CACHE);
      expect(before.dir).assertEqual(context.cacheDir);
      expect(before.dir.endsWith('/cache')).assertTrue();
      expect(before.filePath).assertEqual(context.cacheDir + '/rec_中文.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0004 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0005
     * @tc.name      testStorageAreaRecord0005
     * @tc.desc      应用级 Context下 cache 目录记录文件 "/rec sp.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0005 begin');
      const context: common.Context = getAppContext();
      const name: string = '/rec sp.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.CACHE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.CACHE, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0005 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.CACHE);
      expect(before.dir).assertEqual(context.cacheDir);
      expect(before.dir.endsWith('/cache')).assertTrue();
      expect(before.filePath).assertEqual(context.cacheDir + '/rec sp.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0005 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0006
     * @tc.name      testStorageAreaRecord0006
     * @tc.desc      应用级 Context下 cache 目录记录文件 "/.rec_hidden"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0006 begin');
      const context: common.Context = getAppContext();
      const name: string = '/.rec_hidden';
      removeFileIfExists(recordStoragePath(context, StorageArea.CACHE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.CACHE, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0006 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.CACHE);
      expect(before.dir).assertEqual(context.cacheDir);
      expect(before.dir.endsWith('/cache')).assertTrue();
      expect(before.filePath).assertEqual(context.cacheDir + '/.rec_hidden');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0006 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0007
     * @tc.name      testStorageAreaRecord0007
     * @tc.desc      应用级 Context下 cache 目录记录文件 "/rec.multi.dot.log"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0007 begin');
      const context: common.Context = getAppContext();
      const name: string = '/rec.multi.dot.log';
      removeFileIfExists(recordStoragePath(context, StorageArea.CACHE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.CACHE, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0007 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.CACHE);
      expect(before.dir).assertEqual(context.cacheDir);
      expect(before.dir.endsWith('/cache')).assertTrue();
      expect(before.filePath).assertEqual(context.cacheDir + '/rec.multi.dot.log');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0007 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0008
     * @tc.name      testStorageAreaRecord0008
     * @tc.desc      应用级 Context下 cache 目录记录文件 "/rec_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0008 begin');
      const context: common.Context = getAppContext();
      const name: string = '/rec_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.CACHE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.CACHE, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0008 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.CACHE);
      expect(before.dir).assertEqual(context.cacheDir);
      expect(before.dir.endsWith('/cache')).assertTrue();
      expect(before.filePath).assertEqual(context.cacheDir + '/rec_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0008 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0009
     * @tc.name      testStorageAreaRecord0009
     * @tc.desc      应用级 Context下 files 目录记录文件 "/rec_plain.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testStorageAreaRecord0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0009 begin');
      const context: common.Context = getAppContext();
      const name: string = '/rec_plain.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.FILES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.FILES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0009 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.FILES);
      expect(before.dir).assertEqual(context.filesDir);
      expect(before.dir.endsWith('/files')).assertTrue();
      expect(before.filePath).assertEqual(context.filesDir + '/rec_plain.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0009 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0010
     * @tc.name      testStorageAreaRecord0010
     * @tc.desc      应用级 Context下 files 目录记录文件 "rec_noslash.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testStorageAreaRecord0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0010 begin');
      const context: common.Context = getAppContext();
      const name: string = 'rec_noslash.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.FILES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.FILES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0010 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.FILES);
      expect(before.dir).assertEqual(context.filesDir);
      expect(before.dir.endsWith('/files')).assertTrue();
      expect(before.filePath).assertEqual(context.filesDir + '/rec_noslash.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0010 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0011
     * @tc.name      testStorageAreaRecord0011
     * @tc.desc      应用级 Context下 files 目录记录文件 "//rec_double.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaRecord0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0011 begin');
      const context: common.Context = getAppContext();
      const name: string = '//rec_double.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.FILES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.FILES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0011 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.FILES);
      expect(before.dir).assertEqual(context.filesDir);
      expect(before.dir.endsWith('/files')).assertTrue();
      expect(before.filePath).assertEqual(context.filesDir + '/rec_double.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0011 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0012
     * @tc.name      testStorageAreaRecord0012
     * @tc.desc      应用级 Context下 files 目录记录文件 "/rec_中文.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaRecord0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0012 begin');
      const context: common.Context = getAppContext();
      const name: string = '/rec_中文.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.FILES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.FILES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0012 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.FILES);
      expect(before.dir).assertEqual(context.filesDir);
      expect(before.dir.endsWith('/files')).assertTrue();
      expect(before.filePath).assertEqual(context.filesDir + '/rec_中文.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0012 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0013
     * @tc.name      testStorageAreaRecord0013
     * @tc.desc      应用级 Context下 files 目录记录文件 "/rec sp.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0013 begin');
      const context: common.Context = getAppContext();
      const name: string = '/rec sp.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.FILES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.FILES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0013 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.FILES);
      expect(before.dir).assertEqual(context.filesDir);
      expect(before.dir.endsWith('/files')).assertTrue();
      expect(before.filePath).assertEqual(context.filesDir + '/rec sp.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0013 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0014
     * @tc.name      testStorageAreaRecord0014
     * @tc.desc      应用级 Context下 files 目录记录文件 "/.rec_hidden"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0014 begin');
      const context: common.Context = getAppContext();
      const name: string = '/.rec_hidden';
      removeFileIfExists(recordStoragePath(context, StorageArea.FILES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.FILES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0014 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.FILES);
      expect(before.dir).assertEqual(context.filesDir);
      expect(before.dir.endsWith('/files')).assertTrue();
      expect(before.filePath).assertEqual(context.filesDir + '/.rec_hidden');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0014 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0015
     * @tc.name      testStorageAreaRecord0015
     * @tc.desc      应用级 Context下 files 目录记录文件 "/rec.multi.dot.log"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0015 begin');
      const context: common.Context = getAppContext();
      const name: string = '/rec.multi.dot.log';
      removeFileIfExists(recordStoragePath(context, StorageArea.FILES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.FILES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0015 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.FILES);
      expect(before.dir).assertEqual(context.filesDir);
      expect(before.dir.endsWith('/files')).assertTrue();
      expect(before.filePath).assertEqual(context.filesDir + '/rec.multi.dot.log');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0015 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0016
     * @tc.name      testStorageAreaRecord0016
     * @tc.desc      应用级 Context下 files 目录记录文件 "/rec_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0016 begin');
      const context: common.Context = getAppContext();
      const name: string = '/rec_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.FILES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.FILES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0016 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.FILES);
      expect(before.dir).assertEqual(context.filesDir);
      expect(before.dir.endsWith('/files')).assertTrue();
      expect(before.filePath).assertEqual(context.filesDir + '/rec_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0016 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0017
     * @tc.name      testStorageAreaRecord0017
     * @tc.desc      应用级 Context下 preferences 目录记录文件 "/rec_plain.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testStorageAreaRecord0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0017 begin');
      const context: common.Context = getAppContext();
      const name: string = '/rec_plain.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.PREFERENCES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.PREFERENCES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0017 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.PREFERENCES);
      expect(before.dir).assertEqual(context.preferencesDir);
      expect(before.dir.endsWith('/preferences')).assertTrue();
      expect(before.filePath).assertEqual(context.preferencesDir + '/rec_plain.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0017 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0018
     * @tc.name      testStorageAreaRecord0018
     * @tc.desc      应用级 Context下 preferences 目录记录文件 "rec_noslash.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testStorageAreaRecord0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0018 begin');
      const context: common.Context = getAppContext();
      const name: string = 'rec_noslash.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.PREFERENCES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.PREFERENCES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0018 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.PREFERENCES);
      expect(before.dir).assertEqual(context.preferencesDir);
      expect(before.dir.endsWith('/preferences')).assertTrue();
      expect(before.filePath).assertEqual(context.preferencesDir + '/rec_noslash.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0018 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0019
     * @tc.name      testStorageAreaRecord0019
     * @tc.desc      应用级 Context下 preferences 目录记录文件 "//rec_double.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaRecord0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0019 begin');
      const context: common.Context = getAppContext();
      const name: string = '//rec_double.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.PREFERENCES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.PREFERENCES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0019 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.PREFERENCES);
      expect(before.dir).assertEqual(context.preferencesDir);
      expect(before.dir.endsWith('/preferences')).assertTrue();
      expect(before.filePath).assertEqual(context.preferencesDir + '/rec_double.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0019 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0020
     * @tc.name      testStorageAreaRecord0020
     * @tc.desc      应用级 Context下 preferences 目录记录文件 "/rec_中文.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaRecord0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0020 begin');
      const context: common.Context = getAppContext();
      const name: string = '/rec_中文.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.PREFERENCES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.PREFERENCES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0020 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.PREFERENCES);
      expect(before.dir).assertEqual(context.preferencesDir);
      expect(before.dir.endsWith('/preferences')).assertTrue();
      expect(before.filePath).assertEqual(context.preferencesDir + '/rec_中文.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0020 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0021
     * @tc.name      testStorageAreaRecord0021
     * @tc.desc      应用级 Context下 preferences 目录记录文件 "/rec sp.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0021 begin');
      const context: common.Context = getAppContext();
      const name: string = '/rec sp.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.PREFERENCES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.PREFERENCES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0021 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.PREFERENCES);
      expect(before.dir).assertEqual(context.preferencesDir);
      expect(before.dir.endsWith('/preferences')).assertTrue();
      expect(before.filePath).assertEqual(context.preferencesDir + '/rec sp.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0021 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0022
     * @tc.name      testStorageAreaRecord0022
     * @tc.desc      应用级 Context下 preferences 目录记录文件 "/.rec_hidden"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0022 begin');
      const context: common.Context = getAppContext();
      const name: string = '/.rec_hidden';
      removeFileIfExists(recordStoragePath(context, StorageArea.PREFERENCES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.PREFERENCES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0022 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.PREFERENCES);
      expect(before.dir).assertEqual(context.preferencesDir);
      expect(before.dir.endsWith('/preferences')).assertTrue();
      expect(before.filePath).assertEqual(context.preferencesDir + '/.rec_hidden');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0022 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0023
     * @tc.name      testStorageAreaRecord0023
     * @tc.desc      应用级 Context下 preferences 目录记录文件 "/rec.multi.dot.log"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0023 begin');
      const context: common.Context = getAppContext();
      const name: string = '/rec.multi.dot.log';
      removeFileIfExists(recordStoragePath(context, StorageArea.PREFERENCES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.PREFERENCES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0023 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.PREFERENCES);
      expect(before.dir).assertEqual(context.preferencesDir);
      expect(before.dir.endsWith('/preferences')).assertTrue();
      expect(before.filePath).assertEqual(context.preferencesDir + '/rec.multi.dot.log');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0023 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0024
     * @tc.name      testStorageAreaRecord0024
     * @tc.desc      应用级 Context下 preferences 目录记录文件 "/rec_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0024 begin');
      const context: common.Context = getAppContext();
      const name: string = '/rec_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.PREFERENCES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.PREFERENCES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0024 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.PREFERENCES);
      expect(before.dir).assertEqual(context.preferencesDir);
      expect(before.dir.endsWith('/preferences')).assertTrue();
      expect(before.filePath).assertEqual(context.preferencesDir + '/rec_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0024 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0025
     * @tc.name      testStorageAreaRecord0025
     * @tc.desc      应用级 Context下 temp 目录记录文件 "/rec_plain.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testStorageAreaRecord0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0025 begin');
      const context: common.Context = getAppContext();
      const name: string = '/rec_plain.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.TEMP, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.TEMP, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0025 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.TEMP);
      expect(before.dir).assertEqual(context.tempDir);
      expect(before.dir.endsWith('/temp')).assertTrue();
      expect(before.filePath).assertEqual(context.tempDir + '/rec_plain.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0025 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0026
     * @tc.name      testStorageAreaRecord0026
     * @tc.desc      应用级 Context下 temp 目录记录文件 "rec_noslash.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testStorageAreaRecord0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0026 begin');
      const context: common.Context = getAppContext();
      const name: string = 'rec_noslash.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.TEMP, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.TEMP, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0026 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.TEMP);
      expect(before.dir).assertEqual(context.tempDir);
      expect(before.dir.endsWith('/temp')).assertTrue();
      expect(before.filePath).assertEqual(context.tempDir + '/rec_noslash.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0026 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0027
     * @tc.name      testStorageAreaRecord0027
     * @tc.desc      应用级 Context下 temp 目录记录文件 "//rec_double.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaRecord0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0027 begin');
      const context: common.Context = getAppContext();
      const name: string = '//rec_double.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.TEMP, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.TEMP, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0027 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.TEMP);
      expect(before.dir).assertEqual(context.tempDir);
      expect(before.dir.endsWith('/temp')).assertTrue();
      expect(before.filePath).assertEqual(context.tempDir + '/rec_double.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0027 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0028
     * @tc.name      testStorageAreaRecord0028
     * @tc.desc      应用级 Context下 temp 目录记录文件 "/rec_中文.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaRecord0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0028 begin');
      const context: common.Context = getAppContext();
      const name: string = '/rec_中文.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.TEMP, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.TEMP, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0028 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.TEMP);
      expect(before.dir).assertEqual(context.tempDir);
      expect(before.dir.endsWith('/temp')).assertTrue();
      expect(before.filePath).assertEqual(context.tempDir + '/rec_中文.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0028 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0029
     * @tc.name      testStorageAreaRecord0029
     * @tc.desc      应用级 Context下 temp 目录记录文件 "/rec sp.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0029 begin');
      const context: common.Context = getAppContext();
      const name: string = '/rec sp.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.TEMP, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.TEMP, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0029 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.TEMP);
      expect(before.dir).assertEqual(context.tempDir);
      expect(before.dir.endsWith('/temp')).assertTrue();
      expect(before.filePath).assertEqual(context.tempDir + '/rec sp.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0029 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0030
     * @tc.name      testStorageAreaRecord0030
     * @tc.desc      应用级 Context下 temp 目录记录文件 "/.rec_hidden"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0030 begin');
      const context: common.Context = getAppContext();
      const name: string = '/.rec_hidden';
      removeFileIfExists(recordStoragePath(context, StorageArea.TEMP, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.TEMP, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0030 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.TEMP);
      expect(before.dir).assertEqual(context.tempDir);
      expect(before.dir.endsWith('/temp')).assertTrue();
      expect(before.filePath).assertEqual(context.tempDir + '/.rec_hidden');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0030 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0031
     * @tc.name      testStorageAreaRecord0031
     * @tc.desc      应用级 Context下 temp 目录记录文件 "/rec.multi.dot.log"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0031 begin');
      const context: common.Context = getAppContext();
      const name: string = '/rec.multi.dot.log';
      removeFileIfExists(recordStoragePath(context, StorageArea.TEMP, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.TEMP, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0031 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.TEMP);
      expect(before.dir).assertEqual(context.tempDir);
      expect(before.dir.endsWith('/temp')).assertTrue();
      expect(before.filePath).assertEqual(context.tempDir + '/rec.multi.dot.log');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0031 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0032
     * @tc.name      testStorageAreaRecord0032
     * @tc.desc      应用级 Context下 temp 目录记录文件 "/rec_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0032 begin');
      const context: common.Context = getAppContext();
      const name: string = '/rec_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.TEMP, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.TEMP, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0032 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.TEMP);
      expect(before.dir).assertEqual(context.tempDir);
      expect(before.dir.endsWith('/temp')).assertTrue();
      expect(before.filePath).assertEqual(context.tempDir + '/rec_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0032 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0033
     * @tc.name      testStorageAreaRecord0033
     * @tc.desc      应用级 Context下 database 目录记录文件 "/rec_plain.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testStorageAreaRecord0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0033 begin');
      const context: common.Context = getAppContext();
      const name: string = '/rec_plain.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.DATABASE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.DATABASE, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0033 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.DATABASE);
      expect(before.dir).assertEqual(context.databaseDir);
      expect(before.dir.includes('/database')).assertTrue();
      expect(before.filePath).assertEqual(context.databaseDir + '/rec_plain.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0033 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0034
     * @tc.name      testStorageAreaRecord0034
     * @tc.desc      应用级 Context下 database 目录记录文件 "rec_noslash.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testStorageAreaRecord0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0034 begin');
      const context: common.Context = getAppContext();
      const name: string = 'rec_noslash.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.DATABASE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.DATABASE, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0034 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.DATABASE);
      expect(before.dir).assertEqual(context.databaseDir);
      expect(before.dir.includes('/database')).assertTrue();
      expect(before.filePath).assertEqual(context.databaseDir + '/rec_noslash.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0034 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0035
     * @tc.name      testStorageAreaRecord0035
     * @tc.desc      应用级 Context下 database 目录记录文件 "//rec_double.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaRecord0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0035 begin');
      const context: common.Context = getAppContext();
      const name: string = '//rec_double.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.DATABASE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.DATABASE, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0035 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.DATABASE);
      expect(before.dir).assertEqual(context.databaseDir);
      expect(before.dir.includes('/database')).assertTrue();
      expect(before.filePath).assertEqual(context.databaseDir + '/rec_double.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0035 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0036
     * @tc.name      testStorageAreaRecord0036
     * @tc.desc      应用级 Context下 database 目录记录文件 "/rec_中文.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaRecord0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0036 begin');
      const context: common.Context = getAppContext();
      const name: string = '/rec_中文.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.DATABASE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.DATABASE, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0036 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.DATABASE);
      expect(before.dir).assertEqual(context.databaseDir);
      expect(before.dir.includes('/database')).assertTrue();
      expect(before.filePath).assertEqual(context.databaseDir + '/rec_中文.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0036 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0037
     * @tc.name      testStorageAreaRecord0037
     * @tc.desc      应用级 Context下 database 目录记录文件 "/rec sp.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0037 begin');
      const context: common.Context = getAppContext();
      const name: string = '/rec sp.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.DATABASE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.DATABASE, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0037 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.DATABASE);
      expect(before.dir).assertEqual(context.databaseDir);
      expect(before.dir.includes('/database')).assertTrue();
      expect(before.filePath).assertEqual(context.databaseDir + '/rec sp.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0037 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0038
     * @tc.name      testStorageAreaRecord0038
     * @tc.desc      应用级 Context下 database 目录记录文件 "/.rec_hidden"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0038 begin');
      const context: common.Context = getAppContext();
      const name: string = '/.rec_hidden';
      removeFileIfExists(recordStoragePath(context, StorageArea.DATABASE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.DATABASE, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0038 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.DATABASE);
      expect(before.dir).assertEqual(context.databaseDir);
      expect(before.dir.includes('/database')).assertTrue();
      expect(before.filePath).assertEqual(context.databaseDir + '/.rec_hidden');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0038 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0039
     * @tc.name      testStorageAreaRecord0039
     * @tc.desc      应用级 Context下 database 目录记录文件 "/rec.multi.dot.log"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0039 begin');
      const context: common.Context = getAppContext();
      const name: string = '/rec.multi.dot.log';
      removeFileIfExists(recordStoragePath(context, StorageArea.DATABASE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.DATABASE, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0039 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.DATABASE);
      expect(before.dir).assertEqual(context.databaseDir);
      expect(before.dir.includes('/database')).assertTrue();
      expect(before.filePath).assertEqual(context.databaseDir + '/rec.multi.dot.log');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0039 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0040
     * @tc.name      testStorageAreaRecord0040
     * @tc.desc      应用级 Context下 database 目录记录文件 "/rec_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0040 begin');
      const context: common.Context = getAppContext();
      const name: string = '/rec_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.DATABASE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.DATABASE, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0040 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.DATABASE);
      expect(before.dir).assertEqual(context.databaseDir);
      expect(before.dir.includes('/database')).assertTrue();
      expect(before.filePath).assertEqual(context.databaseDir + '/rec_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.DATABASE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0040 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0041
     * @tc.name      testStorageAreaRecord0041
     * @tc.desc      entry 模块 Context下 cache 目录记录文件 "/rec_plain.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testStorageAreaRecord0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0041 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '/rec_plain.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.CACHE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.CACHE, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0041 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.CACHE);
      expect(before.dir).assertEqual(context.cacheDir);
      expect(before.dir.endsWith('/cache')).assertTrue();
      expect(before.filePath).assertEqual(context.cacheDir + '/rec_plain.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0041 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0042
     * @tc.name      testStorageAreaRecord0042
     * @tc.desc      entry 模块 Context下 cache 目录记录文件 "rec_noslash.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testStorageAreaRecord0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0042 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = 'rec_noslash.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.CACHE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.CACHE, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0042 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.CACHE);
      expect(before.dir).assertEqual(context.cacheDir);
      expect(before.dir.endsWith('/cache')).assertTrue();
      expect(before.filePath).assertEqual(context.cacheDir + '/rec_noslash.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0042 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0043
     * @tc.name      testStorageAreaRecord0043
     * @tc.desc      entry 模块 Context下 cache 目录记录文件 "//rec_double.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaRecord0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0043 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '//rec_double.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.CACHE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.CACHE, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0043 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.CACHE);
      expect(before.dir).assertEqual(context.cacheDir);
      expect(before.dir.endsWith('/cache')).assertTrue();
      expect(before.filePath).assertEqual(context.cacheDir + '/rec_double.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0043 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0044
     * @tc.name      testStorageAreaRecord0044
     * @tc.desc      entry 模块 Context下 cache 目录记录文件 "/rec_中文.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaRecord0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0044 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '/rec_中文.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.CACHE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.CACHE, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0044 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.CACHE);
      expect(before.dir).assertEqual(context.cacheDir);
      expect(before.dir.endsWith('/cache')).assertTrue();
      expect(before.filePath).assertEqual(context.cacheDir + '/rec_中文.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0044 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0045
     * @tc.name      testStorageAreaRecord0045
     * @tc.desc      entry 模块 Context下 cache 目录记录文件 "/rec sp.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0045 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '/rec sp.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.CACHE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.CACHE, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0045 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.CACHE);
      expect(before.dir).assertEqual(context.cacheDir);
      expect(before.dir.endsWith('/cache')).assertTrue();
      expect(before.filePath).assertEqual(context.cacheDir + '/rec sp.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0045 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0046
     * @tc.name      testStorageAreaRecord0046
     * @tc.desc      entry 模块 Context下 cache 目录记录文件 "/.rec_hidden"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0046 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '/.rec_hidden';
      removeFileIfExists(recordStoragePath(context, StorageArea.CACHE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.CACHE, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0046 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.CACHE);
      expect(before.dir).assertEqual(context.cacheDir);
      expect(before.dir.endsWith('/cache')).assertTrue();
      expect(before.filePath).assertEqual(context.cacheDir + '/.rec_hidden');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0046 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0047
     * @tc.name      testStorageAreaRecord0047
     * @tc.desc      entry 模块 Context下 cache 目录记录文件 "/rec.multi.dot.log"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0047 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '/rec.multi.dot.log';
      removeFileIfExists(recordStoragePath(context, StorageArea.CACHE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.CACHE, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0047 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.CACHE);
      expect(before.dir).assertEqual(context.cacheDir);
      expect(before.dir.endsWith('/cache')).assertTrue();
      expect(before.filePath).assertEqual(context.cacheDir + '/rec.multi.dot.log');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0047 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0048
     * @tc.name      testStorageAreaRecord0048
     * @tc.desc      entry 模块 Context下 cache 目录记录文件 "/rec_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0048 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '/rec_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.CACHE, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.CACHE, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0048 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.CACHE);
      expect(before.dir).assertEqual(context.cacheDir);
      expect(before.dir.endsWith('/cache')).assertTrue();
      expect(before.filePath).assertEqual(context.cacheDir + '/rec_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.CACHE, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0048 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0049
     * @tc.name      testStorageAreaRecord0049
     * @tc.desc      entry 模块 Context下 files 目录记录文件 "/rec_plain.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testStorageAreaRecord0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0049 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '/rec_plain.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.FILES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.FILES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0049 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.FILES);
      expect(before.dir).assertEqual(context.filesDir);
      expect(before.dir.endsWith('/files')).assertTrue();
      expect(before.filePath).assertEqual(context.filesDir + '/rec_plain.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0049 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0050
     * @tc.name      testStorageAreaRecord0050
     * @tc.desc      entry 模块 Context下 files 目录记录文件 "rec_noslash.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testStorageAreaRecord0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0050 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = 'rec_noslash.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.FILES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.FILES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0050 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.FILES);
      expect(before.dir).assertEqual(context.filesDir);
      expect(before.dir.endsWith('/files')).assertTrue();
      expect(before.filePath).assertEqual(context.filesDir + '/rec_noslash.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0050 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0051
     * @tc.name      testStorageAreaRecord0051
     * @tc.desc      entry 模块 Context下 files 目录记录文件 "//rec_double.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaRecord0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0051 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '//rec_double.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.FILES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.FILES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0051 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.FILES);
      expect(before.dir).assertEqual(context.filesDir);
      expect(before.dir.endsWith('/files')).assertTrue();
      expect(before.filePath).assertEqual(context.filesDir + '/rec_double.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0051 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0052
     * @tc.name      testStorageAreaRecord0052
     * @tc.desc      entry 模块 Context下 files 目录记录文件 "/rec_中文.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaRecord0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0052 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '/rec_中文.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.FILES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.FILES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0052 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.FILES);
      expect(before.dir).assertEqual(context.filesDir);
      expect(before.dir.endsWith('/files')).assertTrue();
      expect(before.filePath).assertEqual(context.filesDir + '/rec_中文.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0052 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0053
     * @tc.name      testStorageAreaRecord0053
     * @tc.desc      entry 模块 Context下 files 目录记录文件 "/rec sp.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0053 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '/rec sp.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.FILES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.FILES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0053 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.FILES);
      expect(before.dir).assertEqual(context.filesDir);
      expect(before.dir.endsWith('/files')).assertTrue();
      expect(before.filePath).assertEqual(context.filesDir + '/rec sp.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0053 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0054
     * @tc.name      testStorageAreaRecord0054
     * @tc.desc      entry 模块 Context下 files 目录记录文件 "/.rec_hidden"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0054 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '/.rec_hidden';
      removeFileIfExists(recordStoragePath(context, StorageArea.FILES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.FILES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0054 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.FILES);
      expect(before.dir).assertEqual(context.filesDir);
      expect(before.dir.endsWith('/files')).assertTrue();
      expect(before.filePath).assertEqual(context.filesDir + '/.rec_hidden');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0054 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0055
     * @tc.name      testStorageAreaRecord0055
     * @tc.desc      entry 模块 Context下 files 目录记录文件 "/rec.multi.dot.log"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0055 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '/rec.multi.dot.log';
      removeFileIfExists(recordStoragePath(context, StorageArea.FILES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.FILES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0055 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.FILES);
      expect(before.dir).assertEqual(context.filesDir);
      expect(before.dir.endsWith('/files')).assertTrue();
      expect(before.filePath).assertEqual(context.filesDir + '/rec.multi.dot.log');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0055 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0056
     * @tc.name      testStorageAreaRecord0056
     * @tc.desc      entry 模块 Context下 files 目录记录文件 "/rec_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0056 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '/rec_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.FILES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.FILES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0056 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.FILES);
      expect(before.dir).assertEqual(context.filesDir);
      expect(before.dir.endsWith('/files')).assertTrue();
      expect(before.filePath).assertEqual(context.filesDir + '/rec_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.FILES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0056 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0057
     * @tc.name      testStorageAreaRecord0057
     * @tc.desc      entry 模块 Context下 preferences 目录记录文件 "/rec_plain.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testStorageAreaRecord0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0057 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '/rec_plain.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.PREFERENCES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.PREFERENCES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0057 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.PREFERENCES);
      expect(before.dir).assertEqual(context.preferencesDir);
      expect(before.dir.endsWith('/preferences')).assertTrue();
      expect(before.filePath).assertEqual(context.preferencesDir + '/rec_plain.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0057 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0058
     * @tc.name      testStorageAreaRecord0058
     * @tc.desc      entry 模块 Context下 preferences 目录记录文件 "rec_noslash.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testStorageAreaRecord0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0058 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = 'rec_noslash.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.PREFERENCES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.PREFERENCES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0058 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.PREFERENCES);
      expect(before.dir).assertEqual(context.preferencesDir);
      expect(before.dir.endsWith('/preferences')).assertTrue();
      expect(before.filePath).assertEqual(context.preferencesDir + '/rec_noslash.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0058 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0059
     * @tc.name      testStorageAreaRecord0059
     * @tc.desc      entry 模块 Context下 preferences 目录记录文件 "//rec_double.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaRecord0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0059 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '//rec_double.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.PREFERENCES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.PREFERENCES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0059 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.PREFERENCES);
      expect(before.dir).assertEqual(context.preferencesDir);
      expect(before.dir.endsWith('/preferences')).assertTrue();
      expect(before.filePath).assertEqual(context.preferencesDir + '/rec_double.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0059 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0060
     * @tc.name      testStorageAreaRecord0060
     * @tc.desc      entry 模块 Context下 preferences 目录记录文件 "/rec_中文.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaRecord0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0060 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '/rec_中文.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.PREFERENCES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.PREFERENCES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0060 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.PREFERENCES);
      expect(before.dir).assertEqual(context.preferencesDir);
      expect(before.dir.endsWith('/preferences')).assertTrue();
      expect(before.filePath).assertEqual(context.preferencesDir + '/rec_中文.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0060 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0061
     * @tc.name      testStorageAreaRecord0061
     * @tc.desc      entry 模块 Context下 preferences 目录记录文件 "/rec sp.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0061 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '/rec sp.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.PREFERENCES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.PREFERENCES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0061 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.PREFERENCES);
      expect(before.dir).assertEqual(context.preferencesDir);
      expect(before.dir.endsWith('/preferences')).assertTrue();
      expect(before.filePath).assertEqual(context.preferencesDir + '/rec sp.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0061 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0062
     * @tc.name      testStorageAreaRecord0062
     * @tc.desc      entry 模块 Context下 preferences 目录记录文件 "/.rec_hidden"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0062 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '/.rec_hidden';
      removeFileIfExists(recordStoragePath(context, StorageArea.PREFERENCES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.PREFERENCES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0062 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.PREFERENCES);
      expect(before.dir).assertEqual(context.preferencesDir);
      expect(before.dir.endsWith('/preferences')).assertTrue();
      expect(before.filePath).assertEqual(context.preferencesDir + '/.rec_hidden');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0062 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0063
     * @tc.name      testStorageAreaRecord0063
     * @tc.desc      entry 模块 Context下 preferences 目录记录文件 "/rec.multi.dot.log"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0063 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '/rec.multi.dot.log';
      removeFileIfExists(recordStoragePath(context, StorageArea.PREFERENCES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.PREFERENCES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0063 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.PREFERENCES);
      expect(before.dir).assertEqual(context.preferencesDir);
      expect(before.dir.endsWith('/preferences')).assertTrue();
      expect(before.filePath).assertEqual(context.preferencesDir + '/rec.multi.dot.log');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0063 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0064
     * @tc.name      testStorageAreaRecord0064
     * @tc.desc      entry 模块 Context下 preferences 目录记录文件 "/rec_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0064 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '/rec_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.PREFERENCES, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.PREFERENCES, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0064 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.PREFERENCES);
      expect(before.dir).assertEqual(context.preferencesDir);
      expect(before.dir.endsWith('/preferences')).assertTrue();
      expect(before.filePath).assertEqual(context.preferencesDir + '/rec_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.PREFERENCES, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0064 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0065
     * @tc.name      testStorageAreaRecord0065
     * @tc.desc      entry 模块 Context下 temp 目录记录文件 "/rec_plain.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testStorageAreaRecord0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0065 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '/rec_plain.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.TEMP, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.TEMP, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0065 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.TEMP);
      expect(before.dir).assertEqual(context.tempDir);
      expect(before.dir.endsWith('/temp')).assertTrue();
      expect(before.filePath).assertEqual(context.tempDir + '/rec_plain.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0065 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0066
     * @tc.name      testStorageAreaRecord0066
     * @tc.desc      entry 模块 Context下 temp 目录记录文件 "rec_noslash.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testStorageAreaRecord0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0066 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = 'rec_noslash.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.TEMP, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.TEMP, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0066 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.TEMP);
      expect(before.dir).assertEqual(context.tempDir);
      expect(before.dir.endsWith('/temp')).assertTrue();
      expect(before.filePath).assertEqual(context.tempDir + '/rec_noslash.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0066 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0067
     * @tc.name      testStorageAreaRecord0067
     * @tc.desc      entry 模块 Context下 temp 目录记录文件 "//rec_double.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaRecord0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0067 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '//rec_double.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.TEMP, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.TEMP, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0067 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.TEMP);
      expect(before.dir).assertEqual(context.tempDir);
      expect(before.dir.endsWith('/temp')).assertTrue();
      expect(before.filePath).assertEqual(context.tempDir + '/rec_double.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0067 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0068
     * @tc.name      testStorageAreaRecord0068
     * @tc.desc      entry 模块 Context下 temp 目录记录文件 "/rec_中文.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testStorageAreaRecord0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0068 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '/rec_中文.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.TEMP, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.TEMP, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0068 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.TEMP);
      expect(before.dir).assertEqual(context.tempDir);
      expect(before.dir.endsWith('/temp')).assertTrue();
      expect(before.filePath).assertEqual(context.tempDir + '/rec_中文.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0068 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0069
     * @tc.name      testStorageAreaRecord0069
     * @tc.desc      entry 模块 Context下 temp 目录记录文件 "/rec sp.txt"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0069 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '/rec sp.txt';
      removeFileIfExists(recordStoragePath(context, StorageArea.TEMP, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.TEMP, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0069 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.TEMP);
      expect(before.dir).assertEqual(context.tempDir);
      expect(before.dir.endsWith('/temp')).assertTrue();
      expect(before.filePath).assertEqual(context.tempDir + '/rec sp.txt');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0069 end');
      done();
    })

    /**
     * @tc.number    SUB_ABILITY_FEATURE_AREA_RECORD_0070
     * @tc.name      testStorageAreaRecord0070
     * @tc.desc      entry 模块 Context下 temp 目录记录文件 "/.rec_hidden"：创建前不存在，创建后存在，删除后再次不存在
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testStorageAreaRecord0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0070 begin');
      const context: common.Context = await loadEntryModuleContext();
      const name: string = '/.rec_hidden';
      removeFileIfExists(recordStoragePath(context, StorageArea.TEMP, name).filePath);
      const before: StoragePathRecord = recordStoragePath(context, StorageArea.TEMP, name);
      hilog.info(DOMAIN, TAG, '%{public}s', `testStorageAreaRecord0070 params: name=${name}, before=${JSON.stringify(before)}`);
      expect(before.area).assertEqual(StorageArea.TEMP);
      expect(before.dir).assertEqual(context.tempDir);
      expect(before.dir.endsWith('/temp')).assertTrue();
      expect(before.filePath).assertEqual(context.tempDir + '/.rec_hidden');
      expect(before.exists).assertFalse();
      expect(createStorageFile(before.filePath)).assertTrue();
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertTrue();
      fileIo.unlinkSync(before.filePath);
      expect(recordStoragePath(context, StorageArea.TEMP, name).exists).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStorageAreaRecord0070 end');
      done();
    })
  })
}
