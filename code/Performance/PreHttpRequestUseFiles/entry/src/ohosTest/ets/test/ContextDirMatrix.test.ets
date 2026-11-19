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
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { fileIo as fs } from '@kit.CoreFileKit';
import { common } from '@kit.AbilityKit';
import { appContext, ENTRY_MODULE, writeText } from './shared/Probe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

type DirPicker = (ctx: common.Context) => string;

interface DirCase {
  key: string;
  suffix: string;
  writable: boolean;
  pick: DirPicker;
}

const DIR_CASES: DirCase[] = [
  { key: 'filesDir', suffix: '/files', writable: true, pick: (ctx: common.Context): string => ctx.filesDir },
  { key: 'cacheDir', suffix: '/cache', writable: true, pick: (ctx: common.Context): string => ctx.cacheDir },
  { key: 'tempDir', suffix: '/temp', writable: true, pick: (ctx: common.Context): string => ctx.tempDir },
  { key: 'databaseDir', suffix: '/database', writable: true, pick: (ctx: common.Context): string => ctx.databaseDir },
  {
    key: 'preferencesDir', suffix: '/preferences', writable: true,
    pick: (ctx: common.Context): string => ctx.preferencesDir
  },
  { key: 'bundleCodeDir', suffix: '/bundle', writable: false, pick: (ctx: common.Context): string => ctx.bundleCodeDir },
  { key: 'resourceDir', suffix: '', writable: false, pick: (ctx: common.Context): string => ctx.resourceDir },
  {
    key: 'distributedFilesDir', suffix: '/distributedfiles', writable: true,
    pick: (ctx: common.Context): string => ctx.distributedFilesDir
  },
  { key: 'cloudFileDir', suffix: '/cloud', writable: false, pick: (ctx: common.Context): string => ctx.cloudFileDir }
];

export default function contextDirMatrixTest() {
  describe('ContextDirMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0001
     * @tc.name      testContextDir0001
     * @tc.desc      Context filesDir keeps /files and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[0].pick(ctx);
      const marker: string = dir + '/marker_filesdir_01.txt';
      logCase('testContextDir0001', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/files')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'filesDir-01-m');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('filesDir-01-m');
        expect(fs.statSync(marker).size).assertEqual(13);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0002
     * @tc.name      testContextDir0002
     * @tc.desc      Context filesDir keeps /files and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[0].pick(ctx);
      const marker: string = dir + '/marker_filesdir_02.txt';
      logCase('testContextDir0002', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/files')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'filesDir-02-mm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('filesDir-02-mm');
        expect(fs.statSync(marker).size).assertEqual(14);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0003
     * @tc.name      testContextDir0003
     * @tc.desc      Context filesDir keeps /files and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[0].pick(ctx);
      const marker: string = dir + '/marker_filesdir_03.txt';
      logCase('testContextDir0003', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/files')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'filesDir-03-mmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('filesDir-03-mmm');
        expect(fs.statSync(marker).size).assertEqual(15);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0004
     * @tc.name      testContextDir0004
     * @tc.desc      Context filesDir keeps /files and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[0].pick(ctx);
      const marker: string = dir + '/marker_filesdir_04.txt';
      logCase('testContextDir0004', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/files')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'filesDir-04-mmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('filesDir-04-mmmm');
        expect(fs.statSync(marker).size).assertEqual(16);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0005
     * @tc.name      testContextDir0005
     * @tc.desc      Context filesDir keeps /files and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[0].pick(ctx);
      const marker: string = dir + '/marker_filesdir_05.txt';
      logCase('testContextDir0005', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/files')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'filesDir-05-mmmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('filesDir-05-mmmmm');
        expect(fs.statSync(marker).size).assertEqual(17);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0006
     * @tc.name      testContextDir0006
     * @tc.desc      Context filesDir keeps /files and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[0].pick(ctx);
      const marker: string = dir + '/marker_filesdir_06.txt';
      logCase('testContextDir0006', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/files')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'filesDir-06-');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('filesDir-06-');
        expect(fs.statSync(marker).size).assertEqual(12);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0007
     * @tc.name      testContextDir0007
     * @tc.desc      Context filesDir keeps /files and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[0].pick(ctx);
      const marker: string = dir + '/marker_filesdir_07.txt';
      logCase('testContextDir0007', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/files')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'filesDir-07-m');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('filesDir-07-m');
        expect(fs.statSync(marker).size).assertEqual(13);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0008
     * @tc.name      testContextDir0008
     * @tc.desc      Context filesDir keeps /files and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[0].pick(ctx);
      const marker: string = dir + '/marker_filesdir_08.txt';
      logCase('testContextDir0008', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/files')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'filesDir-08-mm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('filesDir-08-mm');
        expect(fs.statSync(marker).size).assertEqual(14);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0009
     * @tc.name      testContextDir0009
     * @tc.desc      Context filesDir keeps /files and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[0].pick(ctx);
      const marker: string = dir + '/marker_filesdir_09.txt';
      logCase('testContextDir0009', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/files')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'filesDir-09-mmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('filesDir-09-mmm');
        expect(fs.statSync(marker).size).assertEqual(15);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0010
     * @tc.name      testContextDir0010
     * @tc.desc      Context filesDir keeps /files and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[0].pick(ctx);
      const marker: string = dir + '/marker_filesdir_10.txt';
      logCase('testContextDir0010', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/files')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'filesDir-10-mmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('filesDir-10-mmmm');
        expect(fs.statSync(marker).size).assertEqual(16);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0011
     * @tc.name      testContextDir0011
     * @tc.desc      Context filesDir keeps /files and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[0].pick(ctx);
      const marker: string = dir + '/marker_filesdir_11.txt';
      logCase('testContextDir0011', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/files')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'filesDir-11-mmmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('filesDir-11-mmmmm');
        expect(fs.statSync(marker).size).assertEqual(17);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0012
     * @tc.name      testContextDir0012
     * @tc.desc      Context filesDir keeps /files and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[0].pick(ctx);
      const marker: string = dir + '/marker_filesdir_12.txt';
      logCase('testContextDir0012', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/files')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'filesDir-12-');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('filesDir-12-');
        expect(fs.statSync(marker).size).assertEqual(12);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0013
     * @tc.name      testContextDir0013
     * @tc.desc      Context filesDir keeps /files and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[0].pick(ctx);
      const marker: string = dir + '/marker_filesdir_13.txt';
      logCase('testContextDir0013', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/files')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'filesDir-13-m');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('filesDir-13-m');
        expect(fs.statSync(marker).size).assertEqual(13);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0014
     * @tc.name      testContextDir0014
     * @tc.desc      Context filesDir keeps /files and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[0].pick(ctx);
      const marker: string = dir + '/marker_filesdir_14.txt';
      logCase('testContextDir0014', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/files')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'filesDir-14-mm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('filesDir-14-mm');
        expect(fs.statSync(marker).size).assertEqual(14);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0015
     * @tc.name      testContextDir0015
     * @tc.desc      Context filesDir keeps /files and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[0].pick(ctx);
      const marker: string = dir + '/marker_filesdir_15.txt';
      logCase('testContextDir0015', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/files')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'filesDir-15-mmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('filesDir-15-mmm');
        expect(fs.statSync(marker).size).assertEqual(15);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0016
     * @tc.name      testContextDir0016
     * @tc.desc      Context filesDir keeps /files and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[0].pick(ctx);
      const marker: string = dir + '/marker_filesdir_16.txt';
      logCase('testContextDir0016', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/files')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'filesDir-16-mmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('filesDir-16-mmmm');
        expect(fs.statSync(marker).size).assertEqual(16);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0017
     * @tc.name      testContextDir0017
     * @tc.desc      Context filesDir keeps /files and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[0].pick(ctx);
      const marker: string = dir + '/marker_filesdir_17.txt';
      logCase('testContextDir0017', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/files')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'filesDir-17-mmmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('filesDir-17-mmmmm');
        expect(fs.statSync(marker).size).assertEqual(17);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0018
     * @tc.name      testContextDir0018
     * @tc.desc      Context filesDir keeps /files and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[0].pick(ctx);
      const marker: string = dir + '/marker_filesdir_18.txt';
      logCase('testContextDir0018', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/files')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'filesDir-18-');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('filesDir-18-');
        expect(fs.statSync(marker).size).assertEqual(12);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0019
     * @tc.name      testContextDir0019
     * @tc.desc      Context filesDir keeps /files and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[0].pick(ctx);
      const marker: string = dir + '/marker_filesdir_19.txt';
      logCase('testContextDir0019', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/files')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'filesDir-19-m');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('filesDir-19-m');
        expect(fs.statSync(marker).size).assertEqual(13);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0020
     * @tc.name      testContextDir0020
     * @tc.desc      Context filesDir keeps /files and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[0].pick(ctx);
      const marker: string = dir + '/marker_filesdir_20.txt';
      logCase('testContextDir0020', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/files')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'filesDir-20-mm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('filesDir-20-mm');
        expect(fs.statSync(marker).size).assertEqual(14);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0021
     * @tc.name      testContextDir0021
     * @tc.desc      Context filesDir keeps /files and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[0].pick(ctx);
      const marker: string = dir + '/marker_filesdir_21.txt';
      logCase('testContextDir0021', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/files')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'filesDir-21-mmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('filesDir-21-mmm');
        expect(fs.statSync(marker).size).assertEqual(15);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0022
     * @tc.name      testContextDir0022
     * @tc.desc      Context filesDir keeps /files and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[0].pick(ctx);
      const marker: string = dir + '/marker_filesdir_22.txt';
      logCase('testContextDir0022', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/files')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'filesDir-22-mmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('filesDir-22-mmmm');
        expect(fs.statSync(marker).size).assertEqual(16);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0023
     * @tc.name      testContextDir0023
     * @tc.desc      Context filesDir keeps /files and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[0].pick(ctx);
      const marker: string = dir + '/marker_filesdir_23.txt';
      logCase('testContextDir0023', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/files')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'filesDir-23-mmmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('filesDir-23-mmmmm');
        expect(fs.statSync(marker).size).assertEqual(17);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0024
     * @tc.name      testContextDir0024
     * @tc.desc      Context filesDir keeps /files and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[0].pick(ctx);
      const marker: string = dir + '/marker_filesdir_24.txt';
      logCase('testContextDir0024', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/files')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'filesDir-24-');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('filesDir-24-');
        expect(fs.statSync(marker).size).assertEqual(12);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0025
     * @tc.name      testContextDir0025
     * @tc.desc      Context filesDir keeps /files and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[0].pick(ctx);
      const marker: string = dir + '/marker_filesdir_25.txt';
      logCase('testContextDir0025', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/files')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'filesDir-25-m');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('filesDir-25-m');
        expect(fs.statSync(marker).size).assertEqual(13);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0026
     * @tc.name      testContextDir0026
     * @tc.desc      Context filesDir keeps /files and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[0].pick(ctx);
      const marker: string = dir + '/marker_filesdir_26.txt';
      logCase('testContextDir0026', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/files')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'filesDir-26-mm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('filesDir-26-mm');
        expect(fs.statSync(marker).size).assertEqual(14);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0027
     * @tc.name      testContextDir0027
     * @tc.desc      Context filesDir keeps /files and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[0].pick(ctx);
      const marker: string = dir + '/marker_filesdir_27.txt';
      logCase('testContextDir0027', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/files')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'filesDir-27-mmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('filesDir-27-mmm');
        expect(fs.statSync(marker).size).assertEqual(15);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0028
     * @tc.name      testContextDir0028
     * @tc.desc      Context filesDir keeps /files and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[0].pick(ctx);
      const marker: string = dir + '/marker_filesdir_28.txt';
      logCase('testContextDir0028', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/files')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'filesDir-28-mmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('filesDir-28-mmmm');
        expect(fs.statSync(marker).size).assertEqual(16);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0029
     * @tc.name      testContextDir0029
     * @tc.desc      Context filesDir keeps /files and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[0].pick(ctx);
      const marker: string = dir + '/marker_filesdir_29.txt';
      logCase('testContextDir0029', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/files')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'filesDir-29-mmmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('filesDir-29-mmmmm');
        expect(fs.statSync(marker).size).assertEqual(17);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0030
     * @tc.name      testContextDir0030
     * @tc.desc      Context filesDir keeps /files and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[0].pick(ctx);
      const marker: string = dir + '/marker_filesdir_30.txt';
      logCase('testContextDir0030', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/files')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'filesDir-30-');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('filesDir-30-');
        expect(fs.statSync(marker).size).assertEqual(12);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0031
     * @tc.name      testContextDir0031
     * @tc.desc      Context cacheDir keeps /cache and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[1].pick(ctx);
      const marker: string = dir + '/marker_cachedir_01.txt';
      logCase('testContextDir0031', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cache')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'cacheDir-01-m');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('cacheDir-01-m');
        expect(fs.statSync(marker).size).assertEqual(13);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0032
     * @tc.name      testContextDir0032
     * @tc.desc      Context cacheDir keeps /cache and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[1].pick(ctx);
      const marker: string = dir + '/marker_cachedir_02.txt';
      logCase('testContextDir0032', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cache')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'cacheDir-02-mm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('cacheDir-02-mm');
        expect(fs.statSync(marker).size).assertEqual(14);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0033
     * @tc.name      testContextDir0033
     * @tc.desc      Context cacheDir keeps /cache and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[1].pick(ctx);
      const marker: string = dir + '/marker_cachedir_03.txt';
      logCase('testContextDir0033', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cache')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'cacheDir-03-mmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('cacheDir-03-mmm');
        expect(fs.statSync(marker).size).assertEqual(15);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0034
     * @tc.name      testContextDir0034
     * @tc.desc      Context cacheDir keeps /cache and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[1].pick(ctx);
      const marker: string = dir + '/marker_cachedir_04.txt';
      logCase('testContextDir0034', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cache')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'cacheDir-04-mmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('cacheDir-04-mmmm');
        expect(fs.statSync(marker).size).assertEqual(16);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0035
     * @tc.name      testContextDir0035
     * @tc.desc      Context cacheDir keeps /cache and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[1].pick(ctx);
      const marker: string = dir + '/marker_cachedir_05.txt';
      logCase('testContextDir0035', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cache')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'cacheDir-05-mmmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('cacheDir-05-mmmmm');
        expect(fs.statSync(marker).size).assertEqual(17);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0036
     * @tc.name      testContextDir0036
     * @tc.desc      Context cacheDir keeps /cache and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[1].pick(ctx);
      const marker: string = dir + '/marker_cachedir_06.txt';
      logCase('testContextDir0036', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cache')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'cacheDir-06-');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('cacheDir-06-');
        expect(fs.statSync(marker).size).assertEqual(12);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0037
     * @tc.name      testContextDir0037
     * @tc.desc      Context cacheDir keeps /cache and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[1].pick(ctx);
      const marker: string = dir + '/marker_cachedir_07.txt';
      logCase('testContextDir0037', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cache')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'cacheDir-07-m');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('cacheDir-07-m');
        expect(fs.statSync(marker).size).assertEqual(13);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0038
     * @tc.name      testContextDir0038
     * @tc.desc      Context cacheDir keeps /cache and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[1].pick(ctx);
      const marker: string = dir + '/marker_cachedir_08.txt';
      logCase('testContextDir0038', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cache')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'cacheDir-08-mm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('cacheDir-08-mm');
        expect(fs.statSync(marker).size).assertEqual(14);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0039
     * @tc.name      testContextDir0039
     * @tc.desc      Context cacheDir keeps /cache and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[1].pick(ctx);
      const marker: string = dir + '/marker_cachedir_09.txt';
      logCase('testContextDir0039', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cache')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'cacheDir-09-mmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('cacheDir-09-mmm');
        expect(fs.statSync(marker).size).assertEqual(15);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0040
     * @tc.name      testContextDir0040
     * @tc.desc      Context cacheDir keeps /cache and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[1].pick(ctx);
      const marker: string = dir + '/marker_cachedir_10.txt';
      logCase('testContextDir0040', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cache')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'cacheDir-10-mmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('cacheDir-10-mmmm');
        expect(fs.statSync(marker).size).assertEqual(16);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0041
     * @tc.name      testContextDir0041
     * @tc.desc      Context cacheDir keeps /cache and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[1].pick(ctx);
      const marker: string = dir + '/marker_cachedir_11.txt';
      logCase('testContextDir0041', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cache')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'cacheDir-11-mmmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('cacheDir-11-mmmmm');
        expect(fs.statSync(marker).size).assertEqual(17);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0042
     * @tc.name      testContextDir0042
     * @tc.desc      Context cacheDir keeps /cache and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[1].pick(ctx);
      const marker: string = dir + '/marker_cachedir_12.txt';
      logCase('testContextDir0042', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cache')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'cacheDir-12-');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('cacheDir-12-');
        expect(fs.statSync(marker).size).assertEqual(12);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0043
     * @tc.name      testContextDir0043
     * @tc.desc      Context cacheDir keeps /cache and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[1].pick(ctx);
      const marker: string = dir + '/marker_cachedir_13.txt';
      logCase('testContextDir0043', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cache')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'cacheDir-13-m');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('cacheDir-13-m');
        expect(fs.statSync(marker).size).assertEqual(13);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0044
     * @tc.name      testContextDir0044
     * @tc.desc      Context cacheDir keeps /cache and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[1].pick(ctx);
      const marker: string = dir + '/marker_cachedir_14.txt';
      logCase('testContextDir0044', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cache')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'cacheDir-14-mm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('cacheDir-14-mm');
        expect(fs.statSync(marker).size).assertEqual(14);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0045
     * @tc.name      testContextDir0045
     * @tc.desc      Context cacheDir keeps /cache and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[1].pick(ctx);
      const marker: string = dir + '/marker_cachedir_15.txt';
      logCase('testContextDir0045', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cache')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'cacheDir-15-mmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('cacheDir-15-mmm');
        expect(fs.statSync(marker).size).assertEqual(15);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0046
     * @tc.name      testContextDir0046
     * @tc.desc      Context cacheDir keeps /cache and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[1].pick(ctx);
      const marker: string = dir + '/marker_cachedir_16.txt';
      logCase('testContextDir0046', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cache')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'cacheDir-16-mmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('cacheDir-16-mmmm');
        expect(fs.statSync(marker).size).assertEqual(16);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0047
     * @tc.name      testContextDir0047
     * @tc.desc      Context cacheDir keeps /cache and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[1].pick(ctx);
      const marker: string = dir + '/marker_cachedir_17.txt';
      logCase('testContextDir0047', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cache')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'cacheDir-17-mmmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('cacheDir-17-mmmmm');
        expect(fs.statSync(marker).size).assertEqual(17);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0048
     * @tc.name      testContextDir0048
     * @tc.desc      Context cacheDir keeps /cache and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[1].pick(ctx);
      const marker: string = dir + '/marker_cachedir_18.txt';
      logCase('testContextDir0048', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cache')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'cacheDir-18-');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('cacheDir-18-');
        expect(fs.statSync(marker).size).assertEqual(12);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0049
     * @tc.name      testContextDir0049
     * @tc.desc      Context cacheDir keeps /cache and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[1].pick(ctx);
      const marker: string = dir + '/marker_cachedir_19.txt';
      logCase('testContextDir0049', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cache')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'cacheDir-19-m');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('cacheDir-19-m');
        expect(fs.statSync(marker).size).assertEqual(13);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0050
     * @tc.name      testContextDir0050
     * @tc.desc      Context cacheDir keeps /cache and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[1].pick(ctx);
      const marker: string = dir + '/marker_cachedir_20.txt';
      logCase('testContextDir0050', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cache')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'cacheDir-20-mm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('cacheDir-20-mm');
        expect(fs.statSync(marker).size).assertEqual(14);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0051
     * @tc.name      testContextDir0051
     * @tc.desc      Context cacheDir keeps /cache and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[1].pick(ctx);
      const marker: string = dir + '/marker_cachedir_21.txt';
      logCase('testContextDir0051', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cache')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'cacheDir-21-mmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('cacheDir-21-mmm');
        expect(fs.statSync(marker).size).assertEqual(15);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0052
     * @tc.name      testContextDir0052
     * @tc.desc      Context cacheDir keeps /cache and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[1].pick(ctx);
      const marker: string = dir + '/marker_cachedir_22.txt';
      logCase('testContextDir0052', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cache')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'cacheDir-22-mmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('cacheDir-22-mmmm');
        expect(fs.statSync(marker).size).assertEqual(16);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0053
     * @tc.name      testContextDir0053
     * @tc.desc      Context cacheDir keeps /cache and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[1].pick(ctx);
      const marker: string = dir + '/marker_cachedir_23.txt';
      logCase('testContextDir0053', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cache')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'cacheDir-23-mmmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('cacheDir-23-mmmmm');
        expect(fs.statSync(marker).size).assertEqual(17);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0054
     * @tc.name      testContextDir0054
     * @tc.desc      Context cacheDir keeps /cache and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[1].pick(ctx);
      const marker: string = dir + '/marker_cachedir_24.txt';
      logCase('testContextDir0054', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cache')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'cacheDir-24-');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('cacheDir-24-');
        expect(fs.statSync(marker).size).assertEqual(12);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0055
     * @tc.name      testContextDir0055
     * @tc.desc      Context cacheDir keeps /cache and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[1].pick(ctx);
      const marker: string = dir + '/marker_cachedir_25.txt';
      logCase('testContextDir0055', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cache')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'cacheDir-25-m');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('cacheDir-25-m');
        expect(fs.statSync(marker).size).assertEqual(13);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0056
     * @tc.name      testContextDir0056
     * @tc.desc      Context cacheDir keeps /cache and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[1].pick(ctx);
      const marker: string = dir + '/marker_cachedir_26.txt';
      logCase('testContextDir0056', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cache')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'cacheDir-26-mm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('cacheDir-26-mm');
        expect(fs.statSync(marker).size).assertEqual(14);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0057
     * @tc.name      testContextDir0057
     * @tc.desc      Context cacheDir keeps /cache and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[1].pick(ctx);
      const marker: string = dir + '/marker_cachedir_27.txt';
      logCase('testContextDir0057', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cache')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'cacheDir-27-mmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('cacheDir-27-mmm');
        expect(fs.statSync(marker).size).assertEqual(15);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0058
     * @tc.name      testContextDir0058
     * @tc.desc      Context cacheDir keeps /cache and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[1].pick(ctx);
      const marker: string = dir + '/marker_cachedir_28.txt';
      logCase('testContextDir0058', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cache')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'cacheDir-28-mmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('cacheDir-28-mmmm');
        expect(fs.statSync(marker).size).assertEqual(16);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0059
     * @tc.name      testContextDir0059
     * @tc.desc      Context cacheDir keeps /cache and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[1].pick(ctx);
      const marker: string = dir + '/marker_cachedir_29.txt';
      logCase('testContextDir0059', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cache')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'cacheDir-29-mmmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('cacheDir-29-mmmmm');
        expect(fs.statSync(marker).size).assertEqual(17);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0060
     * @tc.name      testContextDir0060
     * @tc.desc      Context cacheDir keeps /cache and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[1].pick(ctx);
      const marker: string = dir + '/marker_cachedir_30.txt';
      logCase('testContextDir0060', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cache')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'cacheDir-30-');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('cacheDir-30-');
        expect(fs.statSync(marker).size).assertEqual(12);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0061
     * @tc.name      testContextDir0061
     * @tc.desc      Context tempDir keeps /temp and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[2].pick(ctx);
      const marker: string = dir + '/marker_tempdir_01.txt';
      logCase('testContextDir0061', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/temp')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'tempDir-01-m');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('tempDir-01-m');
        expect(fs.statSync(marker).size).assertEqual(12);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0062
     * @tc.name      testContextDir0062
     * @tc.desc      Context tempDir keeps /temp and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[2].pick(ctx);
      const marker: string = dir + '/marker_tempdir_02.txt';
      logCase('testContextDir0062', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/temp')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'tempDir-02-mm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('tempDir-02-mm');
        expect(fs.statSync(marker).size).assertEqual(13);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0063
     * @tc.name      testContextDir0063
     * @tc.desc      Context tempDir keeps /temp and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[2].pick(ctx);
      const marker: string = dir + '/marker_tempdir_03.txt';
      logCase('testContextDir0063', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/temp')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'tempDir-03-mmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('tempDir-03-mmm');
        expect(fs.statSync(marker).size).assertEqual(14);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0064
     * @tc.name      testContextDir0064
     * @tc.desc      Context tempDir keeps /temp and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[2].pick(ctx);
      const marker: string = dir + '/marker_tempdir_04.txt';
      logCase('testContextDir0064', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/temp')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'tempDir-04-mmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('tempDir-04-mmmm');
        expect(fs.statSync(marker).size).assertEqual(15);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0065
     * @tc.name      testContextDir0065
     * @tc.desc      Context tempDir keeps /temp and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[2].pick(ctx);
      const marker: string = dir + '/marker_tempdir_05.txt';
      logCase('testContextDir0065', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/temp')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'tempDir-05-mmmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('tempDir-05-mmmmm');
        expect(fs.statSync(marker).size).assertEqual(16);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0066
     * @tc.name      testContextDir0066
     * @tc.desc      Context tempDir keeps /temp and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[2].pick(ctx);
      const marker: string = dir + '/marker_tempdir_06.txt';
      logCase('testContextDir0066', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/temp')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'tempDir-06-');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('tempDir-06-');
        expect(fs.statSync(marker).size).assertEqual(11);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0067
     * @tc.name      testContextDir0067
     * @tc.desc      Context tempDir keeps /temp and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[2].pick(ctx);
      const marker: string = dir + '/marker_tempdir_07.txt';
      logCase('testContextDir0067', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/temp')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'tempDir-07-m');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('tempDir-07-m');
        expect(fs.statSync(marker).size).assertEqual(12);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0068
     * @tc.name      testContextDir0068
     * @tc.desc      Context tempDir keeps /temp and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[2].pick(ctx);
      const marker: string = dir + '/marker_tempdir_08.txt';
      logCase('testContextDir0068', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/temp')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'tempDir-08-mm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('tempDir-08-mm');
        expect(fs.statSync(marker).size).assertEqual(13);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0069
     * @tc.name      testContextDir0069
     * @tc.desc      Context tempDir keeps /temp and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[2].pick(ctx);
      const marker: string = dir + '/marker_tempdir_09.txt';
      logCase('testContextDir0069', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/temp')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'tempDir-09-mmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('tempDir-09-mmm');
        expect(fs.statSync(marker).size).assertEqual(14);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0070
     * @tc.name      testContextDir0070
     * @tc.desc      Context tempDir keeps /temp and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[2].pick(ctx);
      const marker: string = dir + '/marker_tempdir_10.txt';
      logCase('testContextDir0070', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/temp')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'tempDir-10-mmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('tempDir-10-mmmm');
        expect(fs.statSync(marker).size).assertEqual(15);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0071
     * @tc.name      testContextDir0071
     * @tc.desc      Context tempDir keeps /temp and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[2].pick(ctx);
      const marker: string = dir + '/marker_tempdir_11.txt';
      logCase('testContextDir0071', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/temp')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'tempDir-11-mmmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('tempDir-11-mmmmm');
        expect(fs.statSync(marker).size).assertEqual(16);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0072
     * @tc.name      testContextDir0072
     * @tc.desc      Context tempDir keeps /temp and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[2].pick(ctx);
      const marker: string = dir + '/marker_tempdir_12.txt';
      logCase('testContextDir0072', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/temp')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'tempDir-12-');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('tempDir-12-');
        expect(fs.statSync(marker).size).assertEqual(11);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0073
     * @tc.name      testContextDir0073
     * @tc.desc      Context tempDir keeps /temp and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[2].pick(ctx);
      const marker: string = dir + '/marker_tempdir_13.txt';
      logCase('testContextDir0073', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/temp')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'tempDir-13-m');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('tempDir-13-m');
        expect(fs.statSync(marker).size).assertEqual(12);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0074
     * @tc.name      testContextDir0074
     * @tc.desc      Context tempDir keeps /temp and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[2].pick(ctx);
      const marker: string = dir + '/marker_tempdir_14.txt';
      logCase('testContextDir0074', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/temp')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'tempDir-14-mm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('tempDir-14-mm');
        expect(fs.statSync(marker).size).assertEqual(13);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0075
     * @tc.name      testContextDir0075
     * @tc.desc      Context tempDir keeps /temp and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[2].pick(ctx);
      const marker: string = dir + '/marker_tempdir_15.txt';
      logCase('testContextDir0075', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/temp')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'tempDir-15-mmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('tempDir-15-mmm');
        expect(fs.statSync(marker).size).assertEqual(14);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0076
     * @tc.name      testContextDir0076
     * @tc.desc      Context tempDir keeps /temp and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[2].pick(ctx);
      const marker: string = dir + '/marker_tempdir_16.txt';
      logCase('testContextDir0076', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/temp')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'tempDir-16-mmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('tempDir-16-mmmm');
        expect(fs.statSync(marker).size).assertEqual(15);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0077
     * @tc.name      testContextDir0077
     * @tc.desc      Context tempDir keeps /temp and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[2].pick(ctx);
      const marker: string = dir + '/marker_tempdir_17.txt';
      logCase('testContextDir0077', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/temp')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'tempDir-17-mmmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('tempDir-17-mmmmm');
        expect(fs.statSync(marker).size).assertEqual(16);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0078
     * @tc.name      testContextDir0078
     * @tc.desc      Context tempDir keeps /temp and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[2].pick(ctx);
      const marker: string = dir + '/marker_tempdir_18.txt';
      logCase('testContextDir0078', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/temp')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'tempDir-18-');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('tempDir-18-');
        expect(fs.statSync(marker).size).assertEqual(11);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0079
     * @tc.name      testContextDir0079
     * @tc.desc      Context tempDir keeps /temp and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[2].pick(ctx);
      const marker: string = dir + '/marker_tempdir_19.txt';
      logCase('testContextDir0079', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/temp')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'tempDir-19-m');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('tempDir-19-m');
        expect(fs.statSync(marker).size).assertEqual(12);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0080
     * @tc.name      testContextDir0080
     * @tc.desc      Context tempDir keeps /temp and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[2].pick(ctx);
      const marker: string = dir + '/marker_tempdir_20.txt';
      logCase('testContextDir0080', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/temp')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'tempDir-20-mm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('tempDir-20-mm');
        expect(fs.statSync(marker).size).assertEqual(13);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0081
     * @tc.name      testContextDir0081
     * @tc.desc      Context tempDir keeps /temp and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[2].pick(ctx);
      const marker: string = dir + '/marker_tempdir_21.txt';
      logCase('testContextDir0081', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/temp')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'tempDir-21-mmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('tempDir-21-mmm');
        expect(fs.statSync(marker).size).assertEqual(14);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0082
     * @tc.name      testContextDir0082
     * @tc.desc      Context tempDir keeps /temp and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[2].pick(ctx);
      const marker: string = dir + '/marker_tempdir_22.txt';
      logCase('testContextDir0082', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/temp')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'tempDir-22-mmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('tempDir-22-mmmm');
        expect(fs.statSync(marker).size).assertEqual(15);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0083
     * @tc.name      testContextDir0083
     * @tc.desc      Context tempDir keeps /temp and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[2].pick(ctx);
      const marker: string = dir + '/marker_tempdir_23.txt';
      logCase('testContextDir0083', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/temp')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'tempDir-23-mmmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('tempDir-23-mmmmm');
        expect(fs.statSync(marker).size).assertEqual(16);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0084
     * @tc.name      testContextDir0084
     * @tc.desc      Context tempDir keeps /temp and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[2].pick(ctx);
      const marker: string = dir + '/marker_tempdir_24.txt';
      logCase('testContextDir0084', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/temp')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'tempDir-24-');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('tempDir-24-');
        expect(fs.statSync(marker).size).assertEqual(11);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0085
     * @tc.name      testContextDir0085
     * @tc.desc      Context tempDir keeps /temp and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[2].pick(ctx);
      const marker: string = dir + '/marker_tempdir_25.txt';
      logCase('testContextDir0085', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/temp')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'tempDir-25-m');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('tempDir-25-m');
        expect(fs.statSync(marker).size).assertEqual(12);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0086
     * @tc.name      testContextDir0086
     * @tc.desc      Context tempDir keeps /temp and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[2].pick(ctx);
      const marker: string = dir + '/marker_tempdir_26.txt';
      logCase('testContextDir0086', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/temp')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'tempDir-26-mm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('tempDir-26-mm');
        expect(fs.statSync(marker).size).assertEqual(13);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0087
     * @tc.name      testContextDir0087
     * @tc.desc      Context tempDir keeps /temp and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[2].pick(ctx);
      const marker: string = dir + '/marker_tempdir_27.txt';
      logCase('testContextDir0087', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/temp')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'tempDir-27-mmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('tempDir-27-mmm');
        expect(fs.statSync(marker).size).assertEqual(14);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0088
     * @tc.name      testContextDir0088
     * @tc.desc      Context tempDir keeps /temp and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[2].pick(ctx);
      const marker: string = dir + '/marker_tempdir_28.txt';
      logCase('testContextDir0088', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/temp')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'tempDir-28-mmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('tempDir-28-mmmm');
        expect(fs.statSync(marker).size).assertEqual(15);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0089
     * @tc.name      testContextDir0089
     * @tc.desc      Context tempDir keeps /temp and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[2].pick(ctx);
      const marker: string = dir + '/marker_tempdir_29.txt';
      logCase('testContextDir0089', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/temp')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'tempDir-29-mmmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('tempDir-29-mmmmm');
        expect(fs.statSync(marker).size).assertEqual(16);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0090
     * @tc.name      testContextDir0090
     * @tc.desc      Context tempDir keeps /temp and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testContextDir0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[2].pick(ctx);
      const marker: string = dir + '/marker_tempdir_30.txt';
      logCase('testContextDir0090', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/temp')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'tempDir-30-');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('tempDir-30-');
        expect(fs.statSync(marker).size).assertEqual(11);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0091
     * @tc.name      testContextDir0091
     * @tc.desc      Context databaseDir keeps /database and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[3].pick(ctx);
      const marker: string = dir + '/marker_databasedir_01.txt';
      logCase('testContextDir0091', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/database')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'databaseDir-01-m');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('databaseDir-01-m');
        expect(fs.statSync(marker).size).assertEqual(16);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0092
     * @tc.name      testContextDir0092
     * @tc.desc      Context databaseDir keeps /database and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[3].pick(ctx);
      const marker: string = dir + '/marker_databasedir_02.txt';
      logCase('testContextDir0092', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/database')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'databaseDir-02-mm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('databaseDir-02-mm');
        expect(fs.statSync(marker).size).assertEqual(17);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0093
     * @tc.name      testContextDir0093
     * @tc.desc      Context databaseDir keeps /database and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[3].pick(ctx);
      const marker: string = dir + '/marker_databasedir_03.txt';
      logCase('testContextDir0093', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/database')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'databaseDir-03-mmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('databaseDir-03-mmm');
        expect(fs.statSync(marker).size).assertEqual(18);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0094
     * @tc.name      testContextDir0094
     * @tc.desc      Context databaseDir keeps /database and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[3].pick(ctx);
      const marker: string = dir + '/marker_databasedir_04.txt';
      logCase('testContextDir0094', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/database')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'databaseDir-04-mmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('databaseDir-04-mmmm');
        expect(fs.statSync(marker).size).assertEqual(19);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0095
     * @tc.name      testContextDir0095
     * @tc.desc      Context databaseDir keeps /database and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[3].pick(ctx);
      const marker: string = dir + '/marker_databasedir_05.txt';
      logCase('testContextDir0095', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/database')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'databaseDir-05-mmmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('databaseDir-05-mmmmm');
        expect(fs.statSync(marker).size).assertEqual(20);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0096
     * @tc.name      testContextDir0096
     * @tc.desc      Context databaseDir keeps /database and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[3].pick(ctx);
      const marker: string = dir + '/marker_databasedir_06.txt';
      logCase('testContextDir0096', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/database')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'databaseDir-06-');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('databaseDir-06-');
        expect(fs.statSync(marker).size).assertEqual(15);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0097
     * @tc.name      testContextDir0097
     * @tc.desc      Context databaseDir keeps /database and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[3].pick(ctx);
      const marker: string = dir + '/marker_databasedir_07.txt';
      logCase('testContextDir0097', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/database')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'databaseDir-07-m');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('databaseDir-07-m');
        expect(fs.statSync(marker).size).assertEqual(16);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0098
     * @tc.name      testContextDir0098
     * @tc.desc      Context databaseDir keeps /database and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[3].pick(ctx);
      const marker: string = dir + '/marker_databasedir_08.txt';
      logCase('testContextDir0098', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/database')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'databaseDir-08-mm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('databaseDir-08-mm');
        expect(fs.statSync(marker).size).assertEqual(17);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0099
     * @tc.name      testContextDir0099
     * @tc.desc      Context databaseDir keeps /database and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[3].pick(ctx);
      const marker: string = dir + '/marker_databasedir_09.txt';
      logCase('testContextDir0099', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/database')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'databaseDir-09-mmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('databaseDir-09-mmm');
        expect(fs.statSync(marker).size).assertEqual(18);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0100
     * @tc.name      testContextDir0100
     * @tc.desc      Context databaseDir keeps /database and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[3].pick(ctx);
      const marker: string = dir + '/marker_databasedir_10.txt';
      logCase('testContextDir0100', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/database')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'databaseDir-10-mmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('databaseDir-10-mmmm');
        expect(fs.statSync(marker).size).assertEqual(19);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0101
     * @tc.name      testContextDir0101
     * @tc.desc      Context databaseDir keeps /database and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[3].pick(ctx);
      const marker: string = dir + '/marker_databasedir_11.txt';
      logCase('testContextDir0101', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/database')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'databaseDir-11-mmmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('databaseDir-11-mmmmm');
        expect(fs.statSync(marker).size).assertEqual(20);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0102
     * @tc.name      testContextDir0102
     * @tc.desc      Context databaseDir keeps /database and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[3].pick(ctx);
      const marker: string = dir + '/marker_databasedir_12.txt';
      logCase('testContextDir0102', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/database')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'databaseDir-12-');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('databaseDir-12-');
        expect(fs.statSync(marker).size).assertEqual(15);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0103
     * @tc.name      testContextDir0103
     * @tc.desc      Context databaseDir keeps /database and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[3].pick(ctx);
      const marker: string = dir + '/marker_databasedir_13.txt';
      logCase('testContextDir0103', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/database')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'databaseDir-13-m');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('databaseDir-13-m');
        expect(fs.statSync(marker).size).assertEqual(16);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0104
     * @tc.name      testContextDir0104
     * @tc.desc      Context databaseDir keeps /database and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[3].pick(ctx);
      const marker: string = dir + '/marker_databasedir_14.txt';
      logCase('testContextDir0104', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/database')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'databaseDir-14-mm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('databaseDir-14-mm');
        expect(fs.statSync(marker).size).assertEqual(17);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0105
     * @tc.name      testContextDir0105
     * @tc.desc      Context databaseDir keeps /database and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[3].pick(ctx);
      const marker: string = dir + '/marker_databasedir_15.txt';
      logCase('testContextDir0105', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/database')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'databaseDir-15-mmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('databaseDir-15-mmm');
        expect(fs.statSync(marker).size).assertEqual(18);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0106
     * @tc.name      testContextDir0106
     * @tc.desc      Context databaseDir keeps /database and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[3].pick(ctx);
      const marker: string = dir + '/marker_databasedir_16.txt';
      logCase('testContextDir0106', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/database')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'databaseDir-16-mmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('databaseDir-16-mmmm');
        expect(fs.statSync(marker).size).assertEqual(19);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0107
     * @tc.name      testContextDir0107
     * @tc.desc      Context databaseDir keeps /database and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[3].pick(ctx);
      const marker: string = dir + '/marker_databasedir_17.txt';
      logCase('testContextDir0107', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/database')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'databaseDir-17-mmmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('databaseDir-17-mmmmm');
        expect(fs.statSync(marker).size).assertEqual(20);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0108
     * @tc.name      testContextDir0108
     * @tc.desc      Context databaseDir keeps /database and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[3].pick(ctx);
      const marker: string = dir + '/marker_databasedir_18.txt';
      logCase('testContextDir0108', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/database')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'databaseDir-18-');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('databaseDir-18-');
        expect(fs.statSync(marker).size).assertEqual(15);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0109
     * @tc.name      testContextDir0109
     * @tc.desc      Context databaseDir keeps /database and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[3].pick(ctx);
      const marker: string = dir + '/marker_databasedir_19.txt';
      logCase('testContextDir0109', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/database')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'databaseDir-19-m');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('databaseDir-19-m');
        expect(fs.statSync(marker).size).assertEqual(16);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0110
     * @tc.name      testContextDir0110
     * @tc.desc      Context databaseDir keeps /database and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[3].pick(ctx);
      const marker: string = dir + '/marker_databasedir_20.txt';
      logCase('testContextDir0110', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/database')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'databaseDir-20-mm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('databaseDir-20-mm');
        expect(fs.statSync(marker).size).assertEqual(17);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0111
     * @tc.name      testContextDir0111
     * @tc.desc      Context databaseDir keeps /database and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[3].pick(ctx);
      const marker: string = dir + '/marker_databasedir_21.txt';
      logCase('testContextDir0111', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/database')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'databaseDir-21-mmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('databaseDir-21-mmm');
        expect(fs.statSync(marker).size).assertEqual(18);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0112
     * @tc.name      testContextDir0112
     * @tc.desc      Context databaseDir keeps /database and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[3].pick(ctx);
      const marker: string = dir + '/marker_databasedir_22.txt';
      logCase('testContextDir0112', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
