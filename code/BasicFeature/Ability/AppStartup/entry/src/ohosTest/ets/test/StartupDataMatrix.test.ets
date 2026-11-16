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

import { afterAll, beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { common, contextConstant, startupManager } from '@kit.AbilityKit';
import { relationalStore } from '@kit.ArkData';
import { fileIo } from '@kit.CoreFileKit';
import { image } from '@kit.ImageKit';
import { resourceManager } from '@kit.LocalizationKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  AUTO_TASK_NAMES, deleteKv, EmployeeRow, ensureEntryStarted, ENTRY_DATABASE_DIR, ENTRY_FILES_DIR, entryFileSize,
  FILE_CONTENT, getKvString, KV_KEY, KV_VALUE, openBusinessRdbStore, putKv, queryEmployees, readEntryFile,
  readEntryRange, resetBaseline, resultClass, runResult, sleep, utf8Length
} from './TestHelper';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppStartup]';
const APP_FILES_DIR: string = '/data/storage/el2/base/files';

function requireImage(): PixelMap {
  const pixelMap: PixelMap | undefined = AppStorage.get<PixelMap>('image');
  if (pixelMap === undefined) {
    throw new Error('AppStorage image missing');
  }
  return pixelMap;
}

async function countWhere(store: relationalStore.RdbStore, where: string): Promise<number> {
  const resultSet: relationalStore.ResultSet = await store.querySql('SELECT ID FROM EMPLOYEE WHERE ' + where);
  let count: number = 0;
  while (resultSet.goToNextRow()) {
    count++;
  }
  resultSet.close();
  return count;
}

export default function startupDataMatrixTest(): void {
  describe('AppStartupStartupDataMatrixTest', () => {
    beforeAll(async (done: Function) => {
      await ensureEntryStarted();
      await resetBaseline();
      done();
    })

    afterAll(async (done: Function) => {
      await resetBaseline();
      done();
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0001
     * @tc.name      testStartupDataMatrix0001
     * @tc.desc      FileTask 写入的源文件 test.txt 位于 EntryAbility 的 filesDir，内容为业务写入的固定字符串
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStartupDataMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0001 begin');
      const actual1: number = entryFileSize('test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(36);
      const actual2: string | number | boolean = readEntryFile('test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(FILE_CONTENT);
      const actual3: number = utf8Length(readEntryFile('test.txt'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(36);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0001 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0002
     * @tc.name      testStartupDataMatrix0002
     * @tc.desc      test.txt 按空格切成 5 个单词，第二个是 StartupTask_003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupDataMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0002 begin');
      const words: string[] = readEntryFile('test.txt').split(' ');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 words.length=${words.length}`);
      expect(words.length).assertEqual(5);
      const actual2: string = words[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('StartupTask_003');
      const actual3: string = words.join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('test|StartupTask_003|file|write|data');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0002 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0003
     * @tc.name      testStartupDataMatrix0003
     * @tc.desc      从 test.txt 偏移 0 处读 4 字节得到 "test"；读得更长时截到文件末尾
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupDataMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0003 begin');
      const actual1: string = readEntryRange('test.txt', 0, 4);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('test');
      const actual2: string = readEntryRange('test.txt', 0, 1024);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('test StartupTask_003 file write data');
      const actual3: number = readEntryRange('test.txt', 0, 4).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0003 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0004
     * @tc.name      testStartupDataMatrix0004
     * @tc.desc      从 test.txt 偏移 5 处读 11 字节得到 "StartupTask"；读得更长时截到文件末尾
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0004 begin');
      const actual1: string = readEntryRange('test.txt', 5, 11);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('StartupTask');
      const actual2: string = readEntryRange('test.txt', 5, 1024);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('StartupTask_003 file write data');
      const actual3: number = readEntryRange('test.txt', 5, 11).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0004 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0005
     * @tc.name      testStartupDataMatrix0005
     * @tc.desc      从 test.txt 偏移 5 处读 15 字节得到 "StartupTask_003"；读得更长时截到文件末尾
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0005 begin');
      const actual1: string = readEntryRange('test.txt', 5, 15);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('StartupTask_003');
      const actual2: string = readEntryRange('test.txt', 5, 1024);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('StartupTask_003 file write data');
      const actual3: number = readEntryRange('test.txt', 5, 15).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0005 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0006
     * @tc.name      testStartupDataMatrix0006
     * @tc.desc      从 test.txt 偏移 17 处读 3 字节得到 "003"；读得更长时截到文件末尾
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0006 begin');
      const actual1: string = readEntryRange('test.txt', 17, 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('003');
      const actual2: string = readEntryRange('test.txt', 17, 1024);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('003 file write data');
      const actual3: number = readEntryRange('test.txt', 17, 3).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0006 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0007
     * @tc.name      testStartupDataMatrix0007
     * @tc.desc      从 test.txt 偏移 21 处读 4 字节得到 "file"；读得更长时截到文件末尾
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0007 begin');
      const actual1: string = readEntryRange('test.txt', 21, 4);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('file');
      const actual2: string = readEntryRange('test.txt', 21, 1024);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('file write data');
      const actual3: number = readEntryRange('test.txt', 21, 4).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0007 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0008
     * @tc.name      testStartupDataMatrix0008
     * @tc.desc      从 test.txt 偏移 26 处读 5 字节得到 "write"；读得更长时截到文件末尾
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0008 begin');
      const actual1: string = readEntryRange('test.txt', 26, 5);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('write');
      const actual2: string = readEntryRange('test.txt', 26, 1024);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('write data');
      const actual3: number = readEntryRange('test.txt', 26, 5).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0008 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0009
     * @tc.name      testStartupDataMatrix0009
     * @tc.desc      从 test.txt 偏移 32 处读 4 字节得到 "data"；读得更长时截到文件末尾
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0009 begin');
      const actual1: string = readEntryRange('test.txt', 32, 4);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('data');
      const actual2: string = readEntryRange('test.txt', 32, 1024);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('data');
      const actual3: number = readEntryRange('test.txt', 32, 4).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0009 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0010
     * @tc.name      testStartupDataMatrix0010
     * @tc.desc      从 test.txt 偏移 0 处读 36 字节得到 "test StartupTask_003 file write data"；读得更长时截到文件末尾
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupDataMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0010 begin');
      const actual1: string = readEntryRange('test.txt', 0, 36);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('test StartupTask_003 file write data');
      const actual2: string = readEntryRange('test.txt', 0, 1024);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('test StartupTask_003 file write data');
      const actual3: number = readEntryRange('test.txt', 0, 36).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(36);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0010 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0011
     * @tc.name      testStartupDataMatrix0011
     * @tc.desc      从 test.txt 偏移 35 处读 1 字节得到 "a"；读得更长时截到文件末尾
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0011 begin');
      const actual1: string = readEntryRange('test.txt', 35, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('a');
      const actual2: string = readEntryRange('test.txt', 35, 1024);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('a');
      const actual3: number = readEntryRange('test.txt', 35, 1).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0011 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0012
     * @tc.name      testStartupDataMatrix0012
     * @tc.desc      从 test.txt 偏移 10 处读 10 字节得到 "upTask_003"；读得更长时截到文件末尾
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0012 begin');
      const actual1: string = readEntryRange('test.txt', 10, 10);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('upTask_003');
      const actual2: string = readEntryRange('test.txt', 10, 1024);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('upTask_003 file write data');
      const actual3: number = readEntryRange('test.txt', 10, 10).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0012 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0013
     * @tc.name      testStartupDataMatrix0013
     * @tc.desc      从 test.txt 末尾（偏移 36）及之后读取得到空串
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0013 begin');
      const actual1: string = readEntryRange('test.txt', 36, 16);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('');
      const actual2: string = readEntryRange('test.txt', 46, 16);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('');
      const actual3: number = entryFileSize('test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(36);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0013 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0014
     * @tc.name      testStartupDataMatrix0014
     * @tc.desc      FileTask 复制出的目标文件 destFile.txt 位于 EntryAbility 的 filesDir，内容为业务写入的固定字符串
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStartupDataMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0014 begin');
      const actual1: number = entryFileSize('destFile.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(36);
      const actual2: string | number | boolean = readEntryFile('destFile.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(FILE_CONTENT);
      const actual3: number = utf8Length(readEntryFile('destFile.txt'));
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(36);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0014 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0015
     * @tc.name      testStartupDataMatrix0015
     * @tc.desc      destFile.txt 按空格切成 5 个单词，第二个是 StartupTask_003
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupDataMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0015 begin');
      const words: string[] = readEntryFile('destFile.txt').split(' ');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 words.length=${words.length}`);
      expect(words.length).assertEqual(5);
      const actual2: string = words[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('StartupTask_003');
      const actual3: string = words.join('|');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('test|StartupTask_003|file|write|data');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0015 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0016
     * @tc.name      testStartupDataMatrix0016
     * @tc.desc      从 destFile.txt 偏移 0 处读 4 字节得到 "test"；读得更长时截到文件末尾
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0016 begin');
      const actual1: string = readEntryRange('destFile.txt', 0, 4);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('test');
      const actual2: string = readEntryRange('destFile.txt', 0, 1024);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('test StartupTask_003 file write data');
      const actual3: number = readEntryRange('destFile.txt', 0, 4).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0016 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0017
     * @tc.name      testStartupDataMatrix0017
     * @tc.desc      从 destFile.txt 偏移 5 处读 11 字节得到 "StartupTask"；读得更长时截到文件末尾
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0017 begin');
      const actual1: string = readEntryRange('destFile.txt', 5, 11);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('StartupTask');
      const actual2: string = readEntryRange('destFile.txt', 5, 1024);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('StartupTask_003 file write data');
      const actual3: number = readEntryRange('destFile.txt', 5, 11).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0017 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0018
     * @tc.name      testStartupDataMatrix0018
     * @tc.desc      从 destFile.txt 偏移 5 处读 15 字节得到 "StartupTask_003"；读得更长时截到文件末尾
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0018 begin');
      const actual1: string = readEntryRange('destFile.txt', 5, 15);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('StartupTask_003');
      const actual2: string = readEntryRange('destFile.txt', 5, 1024);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('StartupTask_003 file write data');
      const actual3: number = readEntryRange('destFile.txt', 5, 15).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0018 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0019
     * @tc.name      testStartupDataMatrix0019
     * @tc.desc      从 destFile.txt 偏移 17 处读 3 字节得到 "003"；读得更长时截到文件末尾
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0019 begin');
      const actual1: string = readEntryRange('destFile.txt', 17, 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('003');
      const actual2: string = readEntryRange('destFile.txt', 17, 1024);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('003 file write data');
      const actual3: number = readEntryRange('destFile.txt', 17, 3).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0019 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0020
     * @tc.name      testStartupDataMatrix0020
     * @tc.desc      从 destFile.txt 偏移 21 处读 4 字节得到 "file"；读得更长时截到文件末尾
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0020 begin');
      const actual1: string = readEntryRange('destFile.txt', 21, 4);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('file');
      const actual2: string = readEntryRange('destFile.txt', 21, 1024);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('file write data');
      const actual3: number = readEntryRange('destFile.txt', 21, 4).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0020 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0021
     * @tc.name      testStartupDataMatrix0021
     * @tc.desc      从 destFile.txt 偏移 26 处读 5 字节得到 "write"；读得更长时截到文件末尾
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0021 begin');
      const actual1: string = readEntryRange('destFile.txt', 26, 5);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('write');
      const actual2: string = readEntryRange('destFile.txt', 26, 1024);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('write data');
      const actual3: number = readEntryRange('destFile.txt', 26, 5).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0021 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0022
     * @tc.name      testStartupDataMatrix0022
     * @tc.desc      从 destFile.txt 偏移 32 处读 4 字节得到 "data"；读得更长时截到文件末尾
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0022 begin');
      const actual1: string = readEntryRange('destFile.txt', 32, 4);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('data');
      const actual2: string = readEntryRange('destFile.txt', 32, 1024);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('data');
      const actual3: number = readEntryRange('destFile.txt', 32, 4).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0022 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0023
     * @tc.name      testStartupDataMatrix0023
     * @tc.desc      从 destFile.txt 偏移 0 处读 36 字节得到 "test StartupTask_003 file write data"；读得更长时截到文件末尾
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0023 begin');
      const actual1: string = readEntryRange('destFile.txt', 0, 36);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('test StartupTask_003 file write data');
      const actual2: string = readEntryRange('destFile.txt', 0, 1024);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('test StartupTask_003 file write data');
      const actual3: number = readEntryRange('destFile.txt', 0, 36).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(36);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0023 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0024
     * @tc.name      testStartupDataMatrix0024
     * @tc.desc      从 destFile.txt 偏移 35 处读 1 字节得到 "a"；读得更长时截到文件末尾
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0024 begin');
      const actual1: string = readEntryRange('destFile.txt', 35, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('a');
      const actual2: string = readEntryRange('destFile.txt', 35, 1024);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('a');
      const actual3: number = readEntryRange('destFile.txt', 35, 1).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0024 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0025
     * @tc.name      testStartupDataMatrix0025
     * @tc.desc      从 destFile.txt 偏移 10 处读 10 字节得到 "upTask_003"；读得更长时截到文件末尾
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0025 begin');
      const actual1: string = readEntryRange('destFile.txt', 10, 10);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('upTask_003');
      const actual2: string = readEntryRange('destFile.txt', 10, 1024);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('upTask_003 file write data');
      const actual3: number = readEntryRange('destFile.txt', 10, 10).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0025 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0026
     * @tc.name      testStartupDataMatrix0026
     * @tc.desc      从 destFile.txt 末尾（偏移 36）及之后读取得到空串
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0026 begin');
      const actual1: string = readEntryRange('destFile.txt', 36, 16);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('');
      const actual2: string = readEntryRange('destFile.txt', 46, 16);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('');
      const actual3: number = entryFileSize('destFile.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(36);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0026 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0027
     * @tc.name      testStartupDataMatrix0027
     * @tc.desc      源文件与目标文件内容逐字节一致，两者都不在应用级 filesDir 下
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupDataMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0027 begin');
      const actual1: string | number | boolean = readEntryFile('destFile.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(readEntryFile('test.txt'));
      const actual2: boolean = fileIo.accessSync(APP_FILES_DIR + '/test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: boolean = fileIo.accessSync(APP_FILES_DIR + '/destFile.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0027 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0028
     * @tc.name      testStartupDataMatrix0028
     * @tc.desc      filesDir 下不存在的文件读取返回 none、大小为 -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0028 begin');
      const actual1: string = readEntryFile('no_such_file.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('none');
      const actual2: number = entryFileSize('no_such_file.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(-1);
      const actual3: number = entryFileSize('TEST.TXT');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0028 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0029
     * @tc.name      testStartupDataMatrix0029
     * @tc.desc      FileTask 重新执行后文件仍为 36 字节：内容固定，打开时虽不截断但每次从头覆盖
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupDataMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0029 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('FileTask');
      const actual1: string = await runResult(AUTO_TASK_NAMES);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      await sleep(500);
      const actual2: number = entryFileSize('test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(36);
      const actual3: number = entryFileSize('destFile.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(36);
      const actual4: string | number | boolean = readEntryFile('destFile.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual(FILE_CONTENT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0029 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0030
     * @tc.name      testStartupDataMatrix0030
     * @tc.desc      filesDir 下能列出 FileTask 写的两个文件
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0030 begin');
      const names: string[] = fileIo.listFileSync(ENTRY_FILES_DIR);
      const actual1: boolean = names.includes('test.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = names.includes('destFile.txt');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = fileIo.statSync(ENTRY_FILES_DIR + '/test.txt').isFile();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0030 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0031
     * @tc.name      testStartupDataMatrix0031
     * @tc.desc      EntryAbility 的 filesDir、databaseDir 与启动任务拿到的 AbilityStageContext 一致（entry 模块级）
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStartupDataMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0031 begin');
      const context: common.UIAbilityContext = await ensureEntryStarted();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 context.filesDir=${context.filesDir}`);
      expect(context.filesDir).assertEqual(ENTRY_FILES_DIR);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 context.databaseDir=${context.databaseDir}`);
      expect(context.databaseDir).assertEqual(ENTRY_DATABASE_DIR);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 context.abilityInfo.moduleName=${context.abilityInfo.moduleName}`);
      expect(context.abilityInfo.moduleName).assertEqual('entry');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0031 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0032
     * @tc.name      testStartupDataMatrix0032
     * @tc.desc      EntryAbility 的 preferencesDir 在 entry 模块目录下，加密分区为 EL2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupDataMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0032 begin');
      const context: common.UIAbilityContext = await ensureEntryStarted();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 context.preferencesDir=${context.preferencesDir}`);
      expect(context.preferencesDir).assertEqual('/data/storage/el2/base/haps/entry/preferences');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 context.area=${context.area}`);
      expect(context.area).assertEqual(contextConstant.AreaMode.EL2);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 context.area=${context.area}`);
      expect(context.area).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0032 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0033
     * @tc.name      testStartupDataMatrix0033
     * @tc.desc      EntryAbility 的 cacheDir 与 tempDir 都在 entry 模块目录下
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0033 begin');
      const context: common.UIAbilityContext = await ensureEntryStarted();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 context.cacheDir=${context.cacheDir}`);
      expect(context.cacheDir).assertEqual('/data/storage/el2/base/haps/entry/cache');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 context.tempDir=${context.tempDir}`);
      expect(context.tempDir).assertEqual('/data/storage/el2/base/haps/entry/temp');
      const actual3: boolean = context.cacheDir.startsWith('/data/storage/el2/base/haps/entry/');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0033 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0034
     * @tc.name      testStartupDataMatrix0034
     * @tc.desc      应用级 Context 的 filesDir 是 /data/storage/el2/base/files，与模块级不同
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupDataMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0034 begin');
      const context: common.UIAbilityContext = await ensureEntryStarted();
      const actual1: string | number | boolean = context.getApplicationContext().filesDir;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(APP_FILES_DIR);
      const actual2: boolean = context.getApplicationContext().filesDir === context.filesDir;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: string = context.getApplicationContext().applicationInfo.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('com.samples.appstartup');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0034 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0035
     * @tc.name      testStartupDataMatrix0035
     * @tc.desc      EntryAbility 资源管理器按系统语言 zh_Hans_CN 解析：按钮文案为手动模式，模块描述为中文
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupDataMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0035 begin');
      const context: common.UIAbilityContext = await ensureEntryStarted();
      const actual1: string = context.resourceManager.getStringByNameSync('Manual_mode');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('手动模式');
      const actual2: string = context.resourceManager.getStringByNameSync('module_desc');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('模块描述');
      const actual3: string = context.resourceManager.getConfigurationSync().locale;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('zh_Hans_CN');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0035 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0036
     * @tc.name      testStartupDataMatrix0036
     * @tc.desc      KVStoreTask 往 storeId 键值库写入了 key_test_string = value_test_string
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStartupDataMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0036 begin');
      const actual1: string = await getKvString(KV_KEY);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string:value_test_string');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 KV_KEY=${KV_KEY}`);
      expect(KV_KEY).assertEqual('key_test_string');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 KV_VALUE=${KV_VALUE}`);
      expect(KV_VALUE).assertEqual('value_test_string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0036 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0037
     * @tc.name      testStartupDataMatrix0037
     * @tc.desc      键值库句柄来自 KvManagerUtilTask 的结果，两次打开读到同一个值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupDataMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0037 begin');
      const actual1: string = resultClass('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('JsKVManager');
      const actual2: string = await getKvString(KV_KEY);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string:value_test_string');
      const actual3: string = await getKvString(KV_KEY);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string:value_test_string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0037 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0038
     * @tc.name      testStartupDataMatrix0038
     * @tc.desc      读取不存在的键 "no_such_key" 返回 15100004，业务键不受影响
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0038 begin');
      const actual1: string = await getKvString('no_such_key');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('code:15100004');
      const actual2: string = await getKvString('no_such_key');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('code:15100004');
      const actual3: string = await getKvString(KV_KEY);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string:value_test_string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0038 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0039
     * @tc.name      testStartupDataMatrix0039
     * @tc.desc      读取大写的业务键 "KEY_TEST_STRING" 返回 15100004，业务键不受影响
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0039 begin');
      const actual1: string = await getKvString('KEY_TEST_STRING');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('code:15100004');
      const actual2: string = await getKvString('KEY_TEST_STRING');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('code:15100004');
      const actual3: string = await getKvString(KV_KEY);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string:value_test_string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0039 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0040
     * @tc.name      testStartupDataMatrix0040
     * @tc.desc      读取业务值当作键 "value_test_string" 返回 15100004，业务键不受影响
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0040 begin');
      const actual1: string = await getKvString('value_test_string');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('code:15100004');
      const actual2: string = await getKvString('value_test_string');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('code:15100004');
      const actual3: string = await getKvString(KV_KEY);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string:value_test_string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0040 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0041
     * @tc.name      testStartupDataMatrix0041
     * @tc.desc      读取业务键的前缀 "key_test" 返回 15100004，业务键不受影响
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0041 begin');
      const actual1: string = await getKvString('key_test');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('code:15100004');
      const actual2: string = await getKvString('key_test');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('code:15100004');
      const actual3: string = await getKvString(KV_KEY);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string:value_test_string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0041 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0042
     * @tc.name      testStartupDataMatrix0042
     * @tc.desc      读取带尾随空格的业务键 "key_test_string " 会命中业务键（键值库忽略键的尾随空格），返回同一个业务值
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0042 begin');
      const actual1: string = await getKvString('key_test_string ');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('string:value_test_string');
      const actual2: string | number | boolean = await getKvString('key_test_string ');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(await getKvString(KV_KEY));
      const actual3: string = await getKvString(KV_KEY);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string:value_test_string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0042 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0043
     * @tc.name      testStartupDataMatrix0043
     * @tc.desc      在业务键值库里写入测试自己的string键 ohos_test_kv_0，读回 "string:hello"，删除后读取报 15100004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupDataMatrix0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0043 begin');
      const key: string = 'ohos_test_kv_0';
      const actual1: string = await putKv(key, 'hello');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: string = await getKvString(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string:hello');
      const actual3: string = await deleteKv(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('ok');
      const actual4: string = await getKvString(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('code:15100004');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0043 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0044
     * @tc.name      testStartupDataMatrix0044
     * @tc.desc      在业务键值库里写入测试自己的中文字符串键 ohos_test_kv_1，读回 "string:启动框架"，删除后读取报 15100004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupDataMatrix0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0044 begin');
      const key: string = 'ohos_test_kv_1';
      const actual1: string = await putKv(key, '启动框架');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: string = await getKvString(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string:启动框架');
      const actual3: string = await deleteKv(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('ok');
      const actual4: string = await getKvString(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('code:15100004');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0044 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0045
     * @tc.name      testStartupDataMatrix0045
     * @tc.desc      在业务键值库里写入测试自己的带空格的字符串键 ohos_test_kv_2，读回 "string:a b c"，删除后读取报 15100004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupDataMatrix0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0045 begin');
      const key: string = 'ohos_test_kv_2';
      const actual1: string = await putKv(key, 'a b c');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: string = await getKvString(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string:a b c');
      const actual3: string = await deleteKv(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('ok');
      const actual4: string = await getKvString(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('code:15100004');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0045 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0046
     * @tc.name      testStartupDataMatrix0046
     * @tc.desc      在业务键值库里写入测试自己的整数键 ohos_test_kv_3，读回 "number:42"，删除后读取报 15100004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0046 begin');
      const key: string = 'ohos_test_kv_3';
      const actual1: string = await putKv(key, 42);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: string = await getKvString(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number:42');
      const actual3: string = await deleteKv(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('ok');
      const actual4: string = await getKvString(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('code:15100004');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0046 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0047
     * @tc.name      testStartupDataMatrix0047
     * @tc.desc      在业务键值库里写入测试自己的负数键 ohos_test_kv_4，读回 "number:-7"，删除后读取报 15100004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0047 begin');
      const key: string = 'ohos_test_kv_4';
      const actual1: string = await putKv(key, -7);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: string = await getKvString(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number:-7');
      const actual3: string = await deleteKv(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('ok');
      const actual4: string = await getKvString(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('code:15100004');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0047 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0048
     * @tc.name      testStartupDataMatrix0048
     * @tc.desc      在业务键值库里写入测试自己的小数键 ohos_test_kv_5，读回 "number:3.5"，删除后读取报 15100004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0048 begin');
      const key: string = 'ohos_test_kv_5';
      const actual1: string = await putKv(key, 3.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: string = await getKvString(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number:3.5');
      const actual3: string = await deleteKv(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('ok');
      const actual4: string = await getKvString(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('code:15100004');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0048 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0049
     * @tc.name      testStartupDataMatrix0049
     * @tc.desc      在业务键值库里写入测试自己的零键 ohos_test_kv_6，读回 "number:0"，删除后读取报 15100004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0049 begin');
      const key: string = 'ohos_test_kv_6';
      const actual1: string = await putKv(key, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: string = await getKvString(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('number:0');
      const actual3: string = await deleteKv(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('ok');
      const actual4: string = await getKvString(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('code:15100004');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0049 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0050
     * @tc.name      testStartupDataMatrix0050
     * @tc.desc      在业务键值库里写入测试自己的布尔 true键 ohos_test_kv_7，读回 "boolean:true"，删除后读取报 15100004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0050 begin');
      const key: string = 'ohos_test_kv_7';
      const actual1: string = await putKv(key, true);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: string = await getKvString(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('boolean:true');
      const actual3: string = await deleteKv(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('ok');
      const actual4: string = await getKvString(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('code:15100004');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0050 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0051
     * @tc.name      testStartupDataMatrix0051
     * @tc.desc      在业务键值库里写入测试自己的布尔 false键 ohos_test_kv_8，读回 "boolean:false"，删除后读取报 15100004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0051 begin');
      const key: string = 'ohos_test_kv_8';
      const actual1: string = await putKv(key, false);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: string = await getKvString(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('boolean:false');
      const actual3: string = await deleteKv(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('ok');
      const actual4: string = await getKvString(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('code:15100004');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0051 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0052
     * @tc.name      testStartupDataMatrix0052
     * @tc.desc      在业务键值库里写入测试自己的字节数组键 ohos_test_kv_9，读回 "bytes:1,2,3"，删除后读取报 15100004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0052 begin');
      const key: string = 'ohos_test_kv_9';
      const actual1: string = await putKv(key, new Uint8Array([1, 2, 3]));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: string = await getKvString(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('bytes:1,2,3');
      const actual3: string = await deleteKv(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('ok');
      const actual4: string = await getKvString(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('code:15100004');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0052 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0053
     * @tc.name      testStartupDataMatrix0053
     * @tc.desc      在业务键值库里写入测试自己的单字节数组键 ohos_test_kv_10，读回 "bytes:255"，删除后读取报 15100004
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0053 begin');
      const key: string = 'ohos_test_kv_10';
      const actual1: string = await putKv(key, new Uint8Array([255]));
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: string = await getKvString(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('bytes:255');
      const actual3: string = await deleteKv(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('ok');
      const actual4: string = await getKvString(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('code:15100004');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0053 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0054
     * @tc.name      testStartupDataMatrix0054
     * @tc.desc      同一个测试键写两次，后写的值覆盖前一个，业务键不变
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0054 begin');
      const key: string = 'ohos_test_kv_overwrite';
      const actual1: string = await putKv(key, 'first');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: string = await putKv(key, 'second');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('ok');
      const actual3: string = await getKvString(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string:second');
      const actual4: string = await deleteKv(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('ok');
      const actual5: string = await getKvString(KV_KEY);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('string:value_test_string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0054 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0055
     * @tc.name      testStartupDataMatrix0055
     * @tc.desc      同一个测试键先写字符串再写数字，类型随最后一次写入变化
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0055 begin');
      const key: string = 'ohos_test_kv_retype';
      const actual1: string = await putKv(key, 'text');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: string = await putKv(key, 9);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('ok');
      const actual3: string = await getKvString(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('number:9');
      const actual4: string = await deleteKv(key);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0055 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0056
     * @tc.name      testStartupDataMatrix0056
     * @tc.desc      删除一个从未写过的键不报错
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0056 begin');
      const actual1: string = await deleteKv('ohos_test_kv_never');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: string = await getKvString('ohos_test_kv_never');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('code:15100004');
      const actual3: string = await getKvString(KV_KEY);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string:value_test_string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0056 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0057
     * @tc.name      testStartupDataMatrix0057
     * @tc.desc      删掉业务键后重跑 KVStoreTask，业务值被重新写回
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupDataMatrix0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0057 begin');
      await resetBaseline();
      const actual1: string = await deleteKv(KV_KEY);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: string = await getKvString(KV_KEY);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('code:15100004');
      startupManager.removeStartupTaskResult('KVStoreTask');
      const actual3: string = await runResult(['KVStoreTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('ok');
      await sleep(500);
      const actual4: string = await getKvString(KV_KEY);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('string:value_test_string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0057 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0058
     * @tc.name      testStartupDataMatrix0058
     * @tc.desc      把业务键改成别的值后，KVStoreTask 已初始化时再 run 不会重写；移除后重跑才写回
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0058 begin');
      await resetBaseline();
      const actual1: string = await putKv(KV_KEY, 'changed');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: string = await runResult(['KVStoreTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('ok');
      await sleep(300);
      const actual3: string = await getKvString(KV_KEY);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('string:changed');
      startupManager.removeStartupTaskResult('KVStoreTask');
      const actual4: string = await runResult(['KVStoreTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('ok');
      await sleep(500);
      const actual5: string = await getKvString(KV_KEY);
      hilog.info(DOMAIN, TAG, '%{public}s', `a5=${actual5}`);
      expect(actual5).assertEqual('string:value_test_string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0058 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0059
     * @tc.name      testStartupDataMatrix0059
     * @tc.desc      KVStoreTask 与 KvManagerUtilTask 都移除后重跑 KVStoreTask，键值库照常可读
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0059 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('KVStoreTask');
      startupManager.removeStartupTaskResult('KvManagerUtilTask');
      const actual1: string = await runResult(['KVStoreTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      await sleep(500);
      const actual2: string = await getKvString(KV_KEY);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string:value_test_string');
      const actual3: string = resultClass('KvManagerUtilTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('JsKVManager');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0059 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0060
     * @tc.name      testStartupDataMatrix0060
     * @tc.desc      RdbStoreTask 建了 EMPLOYEE 表并插入 Lisa：至少一行，首行 ID 为 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStartupDataMatrix0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0060 begin');
      const rows: EmployeeRow[] = await queryEmployees();
      const actual1: boolean = rows.length >= 1;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: number = rows[0].id;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(1);
      const actual3: string = rows[0].name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('Lisa');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0060 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0061
     * @tc.name      testStartupDataMatrix0061
     * @tc.desc      每一行都是业务插入的 Lisa、18 岁、薪资 100.5、CODES 为 1..5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStartupDataMatrix0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0061 begin');
      const rows: EmployeeRow[] = await queryEmployees();
      const actual1: number = rows.filter((r: EmployeeRow) => r.name === 'Lisa').length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(rows.length);
      const actual2: number = rows.filter((r: EmployeeRow) => r.age === 18).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(rows.length);
      const actual3: number = rows.filter((r: EmployeeRow) => r.salary === 100.5).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(rows.length);
      const actual4: number = rows.filter((r: EmployeeRow) => r.codes === '1,2,3,4,5').length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual(rows.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0061 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0062
     * @tc.name      testStartupDataMatrix0062
     * @tc.desc      ID 自增且连续：第 n 行的 ID 为 n，末行 ID 等于行数
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupDataMatrix0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0062 begin');
      const rows: EmployeeRow[] = await queryEmployees();
      const actual1: number = rows.filter((r: EmployeeRow, i: number) => r.id === i + 1).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(rows.length);
      const actual2: string | number | boolean = rows[rows.length - 1].id;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(rows.length);
      const actual3: number = rows[0].id;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0062 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0063
     * @tc.name      testStartupDataMatrix0063
     * @tc.desc      按 NAME=Lisa 查询与全表查询行数相同，按其他名字查不到
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupDataMatrix0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0063 begin');
      const lisa: EmployeeRow[] = await queryEmployees('Lisa');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 lisa.length=${lisa.length}`);
      expect(lisa.length).assertEqual((await queryEmployees()).length);
      const actual2: number = (await queryEmployees('Bob')).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0);
      const actual3: number = (await queryEmployees('lisa')).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0063 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0064
     * @tc.name      testStartupDataMatrix0064
     * @tc.desc      RdbStoreTask 已初始化时再 run 不会多插一行
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupDataMatrix0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0064 begin');
      await resetBaseline();
      const before: number = (await queryEmployees()).length;
      const actual1: string = await runResult(['RdbStoreTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      await sleep(500);
      const actual2: number = (await queryEmployees()).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(before);
      const actual3: boolean = startupManager.isStartupTaskInitialized('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0064 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0065
     * @tc.name      testStartupDataMatrix0065
     * @tc.desc      移除 RdbStoreTask 结果后重跑，业务再插入一行 Lisa，新行 ID 为原末行 ID 加 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStartupDataMatrix0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0065 begin');
      await resetBaseline();
      const before: EmployeeRow[] = await queryEmployees();
      startupManager.removeStartupTaskResult('RdbStoreTask');
      const actual1: string = await runResult(['RdbStoreTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      await sleep(500);
      const after: EmployeeRow[] = await queryEmployees();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 after.length=${after.length}`);
      expect(after.length).assertEqual(before.length + 1);
      const actual3: string | number | boolean = after[after.length - 1].id;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(before[before.length - 1].id + 1);
      const actual4: string = after[after.length - 1].codes;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('1,2,3,4,5');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0065 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0066
     * @tc.name      testStartupDataMatrix0066
     * @tc.desc      移除后 run 时列表里写两次 RdbStoreTask，也只插入一行
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0066 begin');
      await resetBaseline();
      const before: number = (await queryEmployees()).length;
      startupManager.removeStartupTaskResult('RdbStoreTask');
      const actual1: string = await runResult(['RdbStoreTask', 'RdbStoreTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      await sleep(500);
      const actual2: number = (await queryEmployees()).length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(before + 1);
      const actual3: boolean = startupManager.isStartupTaskInitialized('RdbStoreTask');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0066 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0067
     * @tc.name      testStartupDataMatrix0067
     * @tc.desc      EMPLOYEE 表的列依次为 ID、NAME、AGE、SALARY、CODES，库版本为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0067 begin');
      const store: relationalStore.RdbStore = await openBusinessRdbStore();
      const resultSet: relationalStore.ResultSet = await store.querySql('SELECT * FROM EMPLOYEE LIMIT 1');
      const columns: string = resultSet.columnNames.join(',');
      resultSet.close();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 columns=${columns}`);
      expect(columns).assertEqual('ID,NAME,AGE,SALARY,CODES');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 store.version=${store.version}`);
      expect(store.version).assertEqual(0);
      const actual3: number = columns.split(',').length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0067 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0068
     * @tc.name      testStartupDataMatrix0068
     * @tc.desc      按年龄与薪资过滤：AGE > 18 与 SALARY < 100 都查不到，AGE = 18 查到全部
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0068 begin');
      const store: relationalStore.RdbStore = await openBusinessRdbStore();
      const total: number = (await queryEmployees()).length;
      const actual1: number = await countWhere(store, 'AGE > 18');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      const actual2: number = await countWhere(store, 'SALARY < 100');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0);
      const actual3: string | number | boolean = await countWhere(store, 'AGE = 18');
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(total);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0068 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0069
     * @tc.name      testStartupDataMatrix0069
     * @tc.desc      关系型库文件 RdbTest.db 位于 entry 模块的 database/entry/rdb 目录
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0069 begin');
      const actual1: boolean = fileIo.accessSync(ENTRY_DATABASE_DIR + '/rdb/RdbTest.db');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = fileIo.statSync(ENTRY_DATABASE_DIR + '/rdb/RdbTest.db').size > 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: boolean = fileIo.statSync(ENTRY_DATABASE_DIR + '/rdb').isDirectory();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      const actual4: boolean = fileIo.statSync(ENTRY_DATABASE_DIR + '/rdb/RdbTest.db').isFile();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0069 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0070
     * @tc.name      testStartupDataMatrix0070
     * @tc.desc      ResourceManagerTask 把 startIcon 旋转 45 度后存进 AppStorage 的 image
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStartupDataMatrix0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0070 begin');
      const actual1: boolean = AppStorage.has('image');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const pixelMap: PixelMap = requireImage();
      const info: image.ImageInfo = pixelMap.getImageInfoSync();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 info.size.width=${info.size.width}`);
      expect(info.size.width).assertEqual(204);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 info.size.height=${info.size.height}`);
      expect(info.size.height).assertEqual(204);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0070 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0071
     * @tc.name      testStartupDataMatrix0071
     * @tc.desc      旋转后的位图为 204x204 RGBA，每行 816 字节，共 166464 字节，不可编辑
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupDataMatrix0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0071 begin');
      const pixelMap: PixelMap = requireImage();
      const actual1: number = pixelMap.getBytesNumberPerRow();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(816);
      const actual2: number = pixelMap.getPixelBytesNumber();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(166464);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 pixelMap.isEditable=${pixelMap.isEditable}`);
      expect(pixelMap.isEditable).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0071 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0072
     * @tc.name      testStartupDataMatrix0072
     * @tc.desc      原始 startIcon 解码为 144x144，旋转 45 度后边长变为 ceil(144 * √2) = 204
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testStartupDataMatrix0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0072 begin');
      const manager: resourceManager.ResourceManager = (await ensureEntryStarted()).resourceManager;
      const source: image.ImageSource = image.createImageSource(manager.getMediaByNameSync('startIcon').buffer);
      const raw: image.ImageInfo = source.getImageInfoSync();
      await source.release();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 raw.size.width=${raw.size.width}`);
      expect(raw.size.width).assertEqual(144);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 raw.size.height=${raw.size.height}`);
      expect(raw.size.height).assertEqual(144);
      const actual3: string | number | boolean = Math.ceil(raw.size.width * Math.SQRT2);
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(requireImage().getImageInfoSync().size.width);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0072 end');
    })

    /**
     * @tc.number    SUB_APP_STARTUP_STARTUP_DATA_0073
     * @tc.name      testStartupDataMatrix0073
     * @tc.desc      ResourceManagerTask 移除后重跑，AppStorage 里的 image 仍是 204x204
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testStartupDataMatrix0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0073 begin');
      await resetBaseline();
      startupManager.removeStartupTaskResult('ResourceManagerTask');
      const actual1: string = await runResult(['ResourceManagerTask']);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual('ok');
      const actual2: boolean = AppStorage.has('image');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: number = requireImage().getImageInfoSync().size.width;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(204);
      const actual4: number = requireImage().getPixelBytesNumber();
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual(166464);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStartupDataMatrix0073 end');
    })
  })
}
