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
      expect(dir.endsWith('/database')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'databaseDir-22-mmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('databaseDir-22-mmmm');
        expect(fs.statSync(marker).size).assertEqual(19);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0113
     * @tc.name      testContextDir0113
     * @tc.desc      Context databaseDir keeps /database and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[3].pick(ctx);
      const marker: string = dir + '/marker_databasedir_23.txt';
      logCase('testContextDir0113', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/database')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'databaseDir-23-mmmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('databaseDir-23-mmmmm');
        expect(fs.statSync(marker).size).assertEqual(20);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0114
     * @tc.name      testContextDir0114
     * @tc.desc      Context databaseDir keeps /database and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[3].pick(ctx);
      const marker: string = dir + '/marker_databasedir_24.txt';
      logCase('testContextDir0114', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/database')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'databaseDir-24-');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('databaseDir-24-');
        expect(fs.statSync(marker).size).assertEqual(15);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0115
     * @tc.name      testContextDir0115
     * @tc.desc      Context databaseDir keeps /database and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[3].pick(ctx);
      const marker: string = dir + '/marker_databasedir_25.txt';
      logCase('testContextDir0115', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/database')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'databaseDir-25-m');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('databaseDir-25-m');
        expect(fs.statSync(marker).size).assertEqual(16);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0116
     * @tc.name      testContextDir0116
     * @tc.desc      Context databaseDir keeps /database and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[3].pick(ctx);
      const marker: string = dir + '/marker_databasedir_26.txt';
      logCase('testContextDir0116', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/database')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'databaseDir-26-mm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('databaseDir-26-mm');
        expect(fs.statSync(marker).size).assertEqual(17);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0117
     * @tc.name      testContextDir0117
     * @tc.desc      Context databaseDir keeps /database and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[3].pick(ctx);
      const marker: string = dir + '/marker_databasedir_27.txt';
      logCase('testContextDir0117', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/database')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'databaseDir-27-mmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('databaseDir-27-mmm');
        expect(fs.statSync(marker).size).assertEqual(18);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0118
     * @tc.name      testContextDir0118
     * @tc.desc      Context databaseDir keeps /database and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[3].pick(ctx);
      const marker: string = dir + '/marker_databasedir_28.txt';
      logCase('testContextDir0118', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/database')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'databaseDir-28-mmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('databaseDir-28-mmmm');
        expect(fs.statSync(marker).size).assertEqual(19);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0119
     * @tc.name      testContextDir0119
     * @tc.desc      Context databaseDir keeps /database and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[3].pick(ctx);
      const marker: string = dir + '/marker_databasedir_29.txt';
      logCase('testContextDir0119', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/database')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'databaseDir-29-mmmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('databaseDir-29-mmmmm');
        expect(fs.statSync(marker).size).assertEqual(20);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0120
     * @tc.name      testContextDir0120
     * @tc.desc      Context databaseDir keeps /database and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[3].pick(ctx);
      const marker: string = dir + '/marker_databasedir_30.txt';
      logCase('testContextDir0120', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/database')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'databaseDir-30-');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('databaseDir-30-');
        expect(fs.statSync(marker).size).assertEqual(15);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0121
     * @tc.name      testContextDir0121
     * @tc.desc      Context preferencesDir keeps /preferences and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[4].pick(ctx);
      const marker: string = dir + '/marker_preferencesdir_01.txt';
      logCase('testContextDir0121', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/preferences')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'preferencesDir-01-m');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('preferencesDir-01-m');
        expect(fs.statSync(marker).size).assertEqual(19);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0122
     * @tc.name      testContextDir0122
     * @tc.desc      Context preferencesDir keeps /preferences and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[4].pick(ctx);
      const marker: string = dir + '/marker_preferencesdir_02.txt';
      logCase('testContextDir0122', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/preferences')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'preferencesDir-02-mm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('preferencesDir-02-mm');
        expect(fs.statSync(marker).size).assertEqual(20);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0123
     * @tc.name      testContextDir0123
     * @tc.desc      Context preferencesDir keeps /preferences and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[4].pick(ctx);
      const marker: string = dir + '/marker_preferencesdir_03.txt';
      logCase('testContextDir0123', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/preferences')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'preferencesDir-03-mmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('preferencesDir-03-mmm');
        expect(fs.statSync(marker).size).assertEqual(21);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0124
     * @tc.name      testContextDir0124
     * @tc.desc      Context preferencesDir keeps /preferences and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[4].pick(ctx);
      const marker: string = dir + '/marker_preferencesdir_04.txt';
      logCase('testContextDir0124', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/preferences')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'preferencesDir-04-mmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('preferencesDir-04-mmmm');
        expect(fs.statSync(marker).size).assertEqual(22);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0125
     * @tc.name      testContextDir0125
     * @tc.desc      Context preferencesDir keeps /preferences and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[4].pick(ctx);
      const marker: string = dir + '/marker_preferencesdir_05.txt';
      logCase('testContextDir0125', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/preferences')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'preferencesDir-05-mmmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('preferencesDir-05-mmmmm');
        expect(fs.statSync(marker).size).assertEqual(23);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0126
     * @tc.name      testContextDir0126
     * @tc.desc      Context preferencesDir keeps /preferences and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[4].pick(ctx);
      const marker: string = dir + '/marker_preferencesdir_06.txt';
      logCase('testContextDir0126', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/preferences')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'preferencesDir-06-');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('preferencesDir-06-');
        expect(fs.statSync(marker).size).assertEqual(18);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0127
     * @tc.name      testContextDir0127
     * @tc.desc      Context preferencesDir keeps /preferences and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[4].pick(ctx);
      const marker: string = dir + '/marker_preferencesdir_07.txt';
      logCase('testContextDir0127', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/preferences')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'preferencesDir-07-m');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('preferencesDir-07-m');
        expect(fs.statSync(marker).size).assertEqual(19);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0128
     * @tc.name      testContextDir0128
     * @tc.desc      Context preferencesDir keeps /preferences and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[4].pick(ctx);
      const marker: string = dir + '/marker_preferencesdir_08.txt';
      logCase('testContextDir0128', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/preferences')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'preferencesDir-08-mm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('preferencesDir-08-mm');
        expect(fs.statSync(marker).size).assertEqual(20);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0129
     * @tc.name      testContextDir0129
     * @tc.desc      Context preferencesDir keeps /preferences and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[4].pick(ctx);
      const marker: string = dir + '/marker_preferencesdir_09.txt';
      logCase('testContextDir0129', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/preferences')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'preferencesDir-09-mmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('preferencesDir-09-mmm');
        expect(fs.statSync(marker).size).assertEqual(21);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0130
     * @tc.name      testContextDir0130
     * @tc.desc      Context preferencesDir keeps /preferences and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[4].pick(ctx);
      const marker: string = dir + '/marker_preferencesdir_10.txt';
      logCase('testContextDir0130', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/preferences')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'preferencesDir-10-mmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('preferencesDir-10-mmmm');
        expect(fs.statSync(marker).size).assertEqual(22);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0131
     * @tc.name      testContextDir0131
     * @tc.desc      Context preferencesDir keeps /preferences and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[4].pick(ctx);
      const marker: string = dir + '/marker_preferencesdir_11.txt';
      logCase('testContextDir0131', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/preferences')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'preferencesDir-11-mmmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('preferencesDir-11-mmmmm');
        expect(fs.statSync(marker).size).assertEqual(23);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0132
     * @tc.name      testContextDir0132
     * @tc.desc      Context preferencesDir keeps /preferences and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[4].pick(ctx);
      const marker: string = dir + '/marker_preferencesdir_12.txt';
      logCase('testContextDir0132', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/preferences')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'preferencesDir-12-');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('preferencesDir-12-');
        expect(fs.statSync(marker).size).assertEqual(18);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0133
     * @tc.name      testContextDir0133
     * @tc.desc      Context preferencesDir keeps /preferences and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[4].pick(ctx);
      const marker: string = dir + '/marker_preferencesdir_13.txt';
      logCase('testContextDir0133', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/preferences')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'preferencesDir-13-m');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('preferencesDir-13-m');
        expect(fs.statSync(marker).size).assertEqual(19);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0134
     * @tc.name      testContextDir0134
     * @tc.desc      Context preferencesDir keeps /preferences and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[4].pick(ctx);
      const marker: string = dir + '/marker_preferencesdir_14.txt';
      logCase('testContextDir0134', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/preferences')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'preferencesDir-14-mm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('preferencesDir-14-mm');
        expect(fs.statSync(marker).size).assertEqual(20);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0135
     * @tc.name      testContextDir0135
     * @tc.desc      Context preferencesDir keeps /preferences and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[4].pick(ctx);
      const marker: string = dir + '/marker_preferencesdir_15.txt';
      logCase('testContextDir0135', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/preferences')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'preferencesDir-15-mmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('preferencesDir-15-mmm');
        expect(fs.statSync(marker).size).assertEqual(21);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0136
     * @tc.name      testContextDir0136
     * @tc.desc      Context preferencesDir keeps /preferences and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[4].pick(ctx);
      const marker: string = dir + '/marker_preferencesdir_16.txt';
      logCase('testContextDir0136', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/preferences')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'preferencesDir-16-mmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('preferencesDir-16-mmmm');
        expect(fs.statSync(marker).size).assertEqual(22);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0137
     * @tc.name      testContextDir0137
     * @tc.desc      Context preferencesDir keeps /preferences and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[4].pick(ctx);
      const marker: string = dir + '/marker_preferencesdir_17.txt';
      logCase('testContextDir0137', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/preferences')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'preferencesDir-17-mmmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('preferencesDir-17-mmmmm');
        expect(fs.statSync(marker).size).assertEqual(23);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0138
     * @tc.name      testContextDir0138
     * @tc.desc      Context preferencesDir keeps /preferences and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[4].pick(ctx);
      const marker: string = dir + '/marker_preferencesdir_18.txt';
      logCase('testContextDir0138', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/preferences')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'preferencesDir-18-');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('preferencesDir-18-');
        expect(fs.statSync(marker).size).assertEqual(18);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0139
     * @tc.name      testContextDir0139
     * @tc.desc      Context preferencesDir keeps /preferences and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[4].pick(ctx);
      const marker: string = dir + '/marker_preferencesdir_19.txt';
      logCase('testContextDir0139', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/preferences')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'preferencesDir-19-m');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('preferencesDir-19-m');
        expect(fs.statSync(marker).size).assertEqual(19);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0140
     * @tc.name      testContextDir0140
     * @tc.desc      Context preferencesDir keeps /preferences and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[4].pick(ctx);
      const marker: string = dir + '/marker_preferencesdir_20.txt';
      logCase('testContextDir0140', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/preferences')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'preferencesDir-20-mm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('preferencesDir-20-mm');
        expect(fs.statSync(marker).size).assertEqual(20);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0141
     * @tc.name      testContextDir0141
     * @tc.desc      Context preferencesDir keeps /preferences and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[4].pick(ctx);
      const marker: string = dir + '/marker_preferencesdir_21.txt';
      logCase('testContextDir0141', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/preferences')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'preferencesDir-21-mmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('preferencesDir-21-mmm');
        expect(fs.statSync(marker).size).assertEqual(21);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0142
     * @tc.name      testContextDir0142
     * @tc.desc      Context preferencesDir keeps /preferences and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[4].pick(ctx);
      const marker: string = dir + '/marker_preferencesdir_22.txt';
      logCase('testContextDir0142', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/preferences')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'preferencesDir-22-mmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('preferencesDir-22-mmmm');
        expect(fs.statSync(marker).size).assertEqual(22);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0143
     * @tc.name      testContextDir0143
     * @tc.desc      Context preferencesDir keeps /preferences and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[4].pick(ctx);
      const marker: string = dir + '/marker_preferencesdir_23.txt';
      logCase('testContextDir0143', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/preferences')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'preferencesDir-23-mmmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('preferencesDir-23-mmmmm');
        expect(fs.statSync(marker).size).assertEqual(23);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0144
     * @tc.name      testContextDir0144
     * @tc.desc      Context preferencesDir keeps /preferences and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[4].pick(ctx);
      const marker: string = dir + '/marker_preferencesdir_24.txt';
      logCase('testContextDir0144', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/preferences')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'preferencesDir-24-');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('preferencesDir-24-');
        expect(fs.statSync(marker).size).assertEqual(18);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0145
     * @tc.name      testContextDir0145
     * @tc.desc      Context preferencesDir keeps /preferences and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[4].pick(ctx);
      const marker: string = dir + '/marker_preferencesdir_25.txt';
      logCase('testContextDir0145', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/preferences')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'preferencesDir-25-m');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('preferencesDir-25-m');
        expect(fs.statSync(marker).size).assertEqual(19);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0146
     * @tc.name      testContextDir0146
     * @tc.desc      Context preferencesDir keeps /preferences and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[4].pick(ctx);
      const marker: string = dir + '/marker_preferencesdir_26.txt';
      logCase('testContextDir0146', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/preferences')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'preferencesDir-26-mm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('preferencesDir-26-mm');
        expect(fs.statSync(marker).size).assertEqual(20);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0147
     * @tc.name      testContextDir0147
     * @tc.desc      Context preferencesDir keeps /preferences and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[4].pick(ctx);
      const marker: string = dir + '/marker_preferencesdir_27.txt';
      logCase('testContextDir0147', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/preferences')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'preferencesDir-27-mmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('preferencesDir-27-mmm');
        expect(fs.statSync(marker).size).assertEqual(21);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0148
     * @tc.name      testContextDir0148
     * @tc.desc      Context preferencesDir keeps /preferences and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[4].pick(ctx);
      const marker: string = dir + '/marker_preferencesdir_28.txt';
      logCase('testContextDir0148', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/preferences')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'preferencesDir-28-mmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('preferencesDir-28-mmmm');
        expect(fs.statSync(marker).size).assertEqual(22);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0149
     * @tc.name      testContextDir0149
     * @tc.desc      Context preferencesDir keeps /preferences and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[4].pick(ctx);
      const marker: string = dir + '/marker_preferencesdir_29.txt';
      logCase('testContextDir0149', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/preferences')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'preferencesDir-29-mmmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('preferencesDir-29-mmmmm');
        expect(fs.statSync(marker).size).assertEqual(23);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0150
     * @tc.name      testContextDir0150
     * @tc.desc      Context preferencesDir keeps /preferences and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[4].pick(ctx);
      const marker: string = dir + '/marker_preferencesdir_30.txt';
      logCase('testContextDir0150', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/preferences')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'preferencesDir-30-');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('preferencesDir-30-');
        expect(fs.statSync(marker).size).assertEqual(18);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0151
     * @tc.name      testContextDir0151
     * @tc.desc      Context bundleCodeDir keeps /bundle and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[5].pick(ctx);
      const marker: string = dir + '/marker_bundlecodedir_01.txt';
      logCase('testContextDir0151', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/bundle')).assertTrue();
      expect(fs.accessSync(dir)).assertTrue();
      expect(dir.indexOf('bundle') >= 0).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0152
     * @tc.name      testContextDir0152
     * @tc.desc      Context bundleCodeDir keeps /bundle and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[5].pick(ctx);
      const marker: string = dir + '/marker_bundlecodedir_02.txt';
      logCase('testContextDir0152', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/bundle')).assertTrue();
      expect(dir.split('/').length >= 4).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0153
     * @tc.name      testContextDir0153
     * @tc.desc      Context bundleCodeDir keeps /bundle and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[5].pick(ctx);
      const marker: string = dir + '/marker_bundlecodedir_03.txt';
      logCase('testContextDir0153', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/bundle')).assertTrue();
      expect(dir.lastIndexOf('/') > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0154
     * @tc.name      testContextDir0154
     * @tc.desc      Context bundleCodeDir keeps /bundle and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[5].pick(ctx);
      const marker: string = dir + '/marker_bundlecodedir_04.txt';
      logCase('testContextDir0154', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/bundle')).assertTrue();
      expect(fs.accessSync(dir)).assertTrue();
      expect(dir.indexOf('bundle') >= 0).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0155
     * @tc.name      testContextDir0155
     * @tc.desc      Context bundleCodeDir keeps /bundle and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[5].pick(ctx);
      const marker: string = dir + '/marker_bundlecodedir_05.txt';
      logCase('testContextDir0155', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/bundle')).assertTrue();
      expect(dir.split('/').length >= 4).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0156
     * @tc.name      testContextDir0156
     * @tc.desc      Context bundleCodeDir keeps /bundle and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[5].pick(ctx);
      const marker: string = dir + '/marker_bundlecodedir_06.txt';
      logCase('testContextDir0156', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/bundle')).assertTrue();
      expect(dir.lastIndexOf('/') > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0157
     * @tc.name      testContextDir0157
     * @tc.desc      Context bundleCodeDir keeps /bundle and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[5].pick(ctx);
      const marker: string = dir + '/marker_bundlecodedir_07.txt';
      logCase('testContextDir0157', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/bundle')).assertTrue();
      expect(fs.accessSync(dir)).assertTrue();
      expect(dir.indexOf('bundle') >= 0).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0158
     * @tc.name      testContextDir0158
     * @tc.desc      Context bundleCodeDir keeps /bundle and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[5].pick(ctx);
      const marker: string = dir + '/marker_bundlecodedir_08.txt';
      logCase('testContextDir0158', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/bundle')).assertTrue();
      expect(dir.split('/').length >= 4).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0159
     * @tc.name      testContextDir0159
     * @tc.desc      Context bundleCodeDir keeps /bundle and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[5].pick(ctx);
      const marker: string = dir + '/marker_bundlecodedir_09.txt';
      logCase('testContextDir0159', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/bundle')).assertTrue();
      expect(dir.lastIndexOf('/') > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0160
     * @tc.name      testContextDir0160
     * @tc.desc      Context bundleCodeDir keeps /bundle and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[5].pick(ctx);
      const marker: string = dir + '/marker_bundlecodedir_10.txt';
      logCase('testContextDir0160', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/bundle')).assertTrue();
      expect(fs.accessSync(dir)).assertTrue();
      expect(dir.indexOf('bundle') >= 0).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0161
     * @tc.name      testContextDir0161
     * @tc.desc      Context bundleCodeDir keeps /bundle and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[5].pick(ctx);
      const marker: string = dir + '/marker_bundlecodedir_11.txt';
      logCase('testContextDir0161', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/bundle')).assertTrue();
      expect(dir.split('/').length >= 4).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0162
     * @tc.name      testContextDir0162
     * @tc.desc      Context bundleCodeDir keeps /bundle and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[5].pick(ctx);
      const marker: string = dir + '/marker_bundlecodedir_12.txt';
      logCase('testContextDir0162', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/bundle')).assertTrue();
      expect(dir.lastIndexOf('/') > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0163
     * @tc.name      testContextDir0163
     * @tc.desc      Context bundleCodeDir keeps /bundle and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[5].pick(ctx);
      const marker: string = dir + '/marker_bundlecodedir_13.txt';
      logCase('testContextDir0163', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/bundle')).assertTrue();
      expect(fs.accessSync(dir)).assertTrue();
      expect(dir.indexOf('bundle') >= 0).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0164
     * @tc.name      testContextDir0164
     * @tc.desc      Context bundleCodeDir keeps /bundle and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[5].pick(ctx);
      const marker: string = dir + '/marker_bundlecodedir_14.txt';
      logCase('testContextDir0164', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/bundle')).assertTrue();
      expect(dir.split('/').length >= 4).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0165
     * @tc.name      testContextDir0165
     * @tc.desc      Context bundleCodeDir keeps /bundle and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[5].pick(ctx);
      const marker: string = dir + '/marker_bundlecodedir_15.txt';
      logCase('testContextDir0165', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/bundle')).assertTrue();
      expect(dir.lastIndexOf('/') > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0166
     * @tc.name      testContextDir0166
     * @tc.desc      Context bundleCodeDir keeps /bundle and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[5].pick(ctx);
      const marker: string = dir + '/marker_bundlecodedir_16.txt';
      logCase('testContextDir0166', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/bundle')).assertTrue();
      expect(fs.accessSync(dir)).assertTrue();
      expect(dir.indexOf('bundle') >= 0).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0167
     * @tc.name      testContextDir0167
     * @tc.desc      Context bundleCodeDir keeps /bundle and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[5].pick(ctx);
      const marker: string = dir + '/marker_bundlecodedir_17.txt';
      logCase('testContextDir0167', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/bundle')).assertTrue();
      expect(dir.split('/').length >= 4).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0168
     * @tc.name      testContextDir0168
     * @tc.desc      Context bundleCodeDir keeps /bundle and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[5].pick(ctx);
      const marker: string = dir + '/marker_bundlecodedir_18.txt';
      logCase('testContextDir0168', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/bundle')).assertTrue();
      expect(dir.lastIndexOf('/') > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0169
     * @tc.name      testContextDir0169
     * @tc.desc      Context bundleCodeDir keeps /bundle and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[5].pick(ctx);
      const marker: string = dir + '/marker_bundlecodedir_19.txt';
      logCase('testContextDir0169', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/bundle')).assertTrue();
      expect(fs.accessSync(dir)).assertTrue();
      expect(dir.indexOf('bundle') >= 0).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0170
     * @tc.name      testContextDir0170
     * @tc.desc      Context bundleCodeDir keeps /bundle and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[5].pick(ctx);
      const marker: string = dir + '/marker_bundlecodedir_20.txt';
      logCase('testContextDir0170', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/bundle')).assertTrue();
      expect(dir.split('/').length >= 4).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0171
     * @tc.name      testContextDir0171
     * @tc.desc      Context bundleCodeDir keeps /bundle and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[5].pick(ctx);
      const marker: string = dir + '/marker_bundlecodedir_21.txt';
      logCase('testContextDir0171', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/bundle')).assertTrue();
      expect(dir.lastIndexOf('/') > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0172
     * @tc.name      testContextDir0172
     * @tc.desc      Context bundleCodeDir keeps /bundle and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[5].pick(ctx);
      const marker: string = dir + '/marker_bundlecodedir_22.txt';
      logCase('testContextDir0172', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/bundle')).assertTrue();
      expect(fs.accessSync(dir)).assertTrue();
      expect(dir.indexOf('bundle') >= 0).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0173
     * @tc.name      testContextDir0173
     * @tc.desc      Context bundleCodeDir keeps /bundle and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[5].pick(ctx);
      const marker: string = dir + '/marker_bundlecodedir_23.txt';
      logCase('testContextDir0173', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/bundle')).assertTrue();
      expect(dir.split('/').length >= 4).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0174
     * @tc.name      testContextDir0174
     * @tc.desc      Context bundleCodeDir keeps /bundle and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[5].pick(ctx);
      const marker: string = dir + '/marker_bundlecodedir_24.txt';
      logCase('testContextDir0174', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/bundle')).assertTrue();
      expect(dir.lastIndexOf('/') > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0175
     * @tc.name      testContextDir0175
     * @tc.desc      Context bundleCodeDir keeps /bundle and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[5].pick(ctx);
      const marker: string = dir + '/marker_bundlecodedir_25.txt';
      logCase('testContextDir0175', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/bundle')).assertTrue();
      expect(fs.accessSync(dir)).assertTrue();
      expect(dir.indexOf('bundle') >= 0).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0176
     * @tc.name      testContextDir0176
     * @tc.desc      Context bundleCodeDir keeps /bundle and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[5].pick(ctx);
      const marker: string = dir + '/marker_bundlecodedir_26.txt';
      logCase('testContextDir0176', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/bundle')).assertTrue();
      expect(dir.split('/').length >= 4).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0177
     * @tc.name      testContextDir0177
     * @tc.desc      Context bundleCodeDir keeps /bundle and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[5].pick(ctx);
      const marker: string = dir + '/marker_bundlecodedir_27.txt';
      logCase('testContextDir0177', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/bundle')).assertTrue();
      expect(dir.lastIndexOf('/') > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0178
     * @tc.name      testContextDir0178
     * @tc.desc      Context bundleCodeDir keeps /bundle and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[5].pick(ctx);
      const marker: string = dir + '/marker_bundlecodedir_28.txt';
      logCase('testContextDir0178', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/bundle')).assertTrue();
      expect(fs.accessSync(dir)).assertTrue();
      expect(dir.indexOf('bundle') >= 0).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0179
     * @tc.name      testContextDir0179
     * @tc.desc      Context bundleCodeDir keeps /bundle and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[5].pick(ctx);
      const marker: string = dir + '/marker_bundlecodedir_29.txt';
      logCase('testContextDir0179', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/bundle')).assertTrue();
      expect(dir.split('/').length >= 4).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0180
     * @tc.name      testContextDir0180
     * @tc.desc      Context bundleCodeDir keeps /bundle and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[5].pick(ctx);
      const marker: string = dir + '/marker_bundlecodedir_30.txt';
      logCase('testContextDir0180', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/bundle')).assertTrue();
      expect(dir.lastIndexOf('/') > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0181
     * @tc.name      testContextDir0181
     * @tc.desc      Context resourceDir is empty when the module packages no resfile directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[6].pick(ctx);
      const marker: string = dir + '/marker_resourcedir_01.txt';
      logCase('testContextDir0181', `dir=${dir} marker=${marker}`);
      expect(dir).assertEqual('');
      expect(ctx.createModuleContext(ENTRY_MODULE).resourceDir).assertEqual(dir);
      expect(ctx.filesDir === dir).assertFalse();
      expect(ctx.bundleCodeDir === dir).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0182
     * @tc.name      testContextDir0182
     * @tc.desc      Context resourceDir is empty when the module packages no resfile directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[6].pick(ctx);
      const marker: string = dir + '/marker_resourcedir_02.txt';
      logCase('testContextDir0182', `dir=${dir} marker=${marker}`);
      expect(dir).assertEqual('');
      expect(ctx.createModuleContext(ENTRY_MODULE).resourceDir).assertEqual(dir);
      expect(ctx.filesDir === dir).assertFalse();
      expect(ctx.bundleCodeDir === dir).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0183
     * @tc.name      testContextDir0183
     * @tc.desc      Context resourceDir is empty when the module packages no resfile directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[6].pick(ctx);
      const marker: string = dir + '/marker_resourcedir_03.txt';
      logCase('testContextDir0183', `dir=${dir} marker=${marker}`);
      expect(dir).assertEqual('');
      expect(ctx.createModuleContext(ENTRY_MODULE).resourceDir).assertEqual(dir);
      expect(ctx.filesDir === dir).assertFalse();
      expect(ctx.bundleCodeDir === dir).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0184
     * @tc.name      testContextDir0184
     * @tc.desc      Context resourceDir is empty when the module packages no resfile directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[6].pick(ctx);
      const marker: string = dir + '/marker_resourcedir_04.txt';
      logCase('testContextDir0184', `dir=${dir} marker=${marker}`);
      expect(dir).assertEqual('');
      expect(ctx.createModuleContext(ENTRY_MODULE).resourceDir).assertEqual(dir);
      expect(ctx.filesDir === dir).assertFalse();
      expect(ctx.bundleCodeDir === dir).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0185
     * @tc.name      testContextDir0185
     * @tc.desc      Context resourceDir is empty when the module packages no resfile directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[6].pick(ctx);
      const marker: string = dir + '/marker_resourcedir_05.txt';
      logCase('testContextDir0185', `dir=${dir} marker=${marker}`);
      expect(dir).assertEqual('');
      expect(ctx.createModuleContext(ENTRY_MODULE).resourceDir).assertEqual(dir);
      expect(ctx.filesDir === dir).assertFalse();
      expect(ctx.bundleCodeDir === dir).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0186
     * @tc.name      testContextDir0186
     * @tc.desc      Context resourceDir is empty when the module packages no resfile directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[6].pick(ctx);
      const marker: string = dir + '/marker_resourcedir_06.txt';
      logCase('testContextDir0186', `dir=${dir} marker=${marker}`);
      expect(dir).assertEqual('');
      expect(ctx.createModuleContext(ENTRY_MODULE).resourceDir).assertEqual(dir);
      expect(ctx.filesDir === dir).assertFalse();
      expect(ctx.bundleCodeDir === dir).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0187
     * @tc.name      testContextDir0187
     * @tc.desc      Context resourceDir is empty when the module packages no resfile directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[6].pick(ctx);
      const marker: string = dir + '/marker_resourcedir_07.txt';
      logCase('testContextDir0187', `dir=${dir} marker=${marker}`);
      expect(dir).assertEqual('');
      expect(ctx.createModuleContext(ENTRY_MODULE).resourceDir).assertEqual(dir);
      expect(ctx.filesDir === dir).assertFalse();
      expect(ctx.bundleCodeDir === dir).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0188
     * @tc.name      testContextDir0188
     * @tc.desc      Context resourceDir is empty when the module packages no resfile directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[6].pick(ctx);
      const marker: string = dir + '/marker_resourcedir_08.txt';
      logCase('testContextDir0188', `dir=${dir} marker=${marker}`);
      expect(dir).assertEqual('');
      expect(ctx.createModuleContext(ENTRY_MODULE).resourceDir).assertEqual(dir);
      expect(ctx.filesDir === dir).assertFalse();
      expect(ctx.bundleCodeDir === dir).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0189
     * @tc.name      testContextDir0189
     * @tc.desc      Context resourceDir is empty when the module packages no resfile directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[6].pick(ctx);
      const marker: string = dir + '/marker_resourcedir_09.txt';
      logCase('testContextDir0189', `dir=${dir} marker=${marker}`);
      expect(dir).assertEqual('');
      expect(ctx.createModuleContext(ENTRY_MODULE).resourceDir).assertEqual(dir);
      expect(ctx.filesDir === dir).assertFalse();
      expect(ctx.bundleCodeDir === dir).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0190
     * @tc.name      testContextDir0190
     * @tc.desc      Context resourceDir is empty when the module packages no resfile directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[6].pick(ctx);
      const marker: string = dir + '/marker_resourcedir_10.txt';
      logCase('testContextDir0190', `dir=${dir} marker=${marker}`);
      expect(dir).assertEqual('');
      expect(ctx.createModuleContext(ENTRY_MODULE).resourceDir).assertEqual(dir);
      expect(ctx.filesDir === dir).assertFalse();
      expect(ctx.bundleCodeDir === dir).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0191
     * @tc.name      testContextDir0191
     * @tc.desc      Context resourceDir is empty when the module packages no resfile directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[6].pick(ctx);
      const marker: string = dir + '/marker_resourcedir_11.txt';
      logCase('testContextDir0191', `dir=${dir} marker=${marker}`);
      expect(dir).assertEqual('');
      expect(ctx.createModuleContext(ENTRY_MODULE).resourceDir).assertEqual(dir);
      expect(ctx.filesDir === dir).assertFalse();
      expect(ctx.bundleCodeDir === dir).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0192
     * @tc.name      testContextDir0192
     * @tc.desc      Context resourceDir is empty when the module packages no resfile directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[6].pick(ctx);
      const marker: string = dir + '/marker_resourcedir_12.txt';
      logCase('testContextDir0192', `dir=${dir} marker=${marker}`);
      expect(dir).assertEqual('');
      expect(ctx.createModuleContext(ENTRY_MODULE).resourceDir).assertEqual(dir);
      expect(ctx.filesDir === dir).assertFalse();
      expect(ctx.bundleCodeDir === dir).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0193
     * @tc.name      testContextDir0193
     * @tc.desc      Context resourceDir is empty when the module packages no resfile directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[6].pick(ctx);
      const marker: string = dir + '/marker_resourcedir_13.txt';
      logCase('testContextDir0193', `dir=${dir} marker=${marker}`);
      expect(dir).assertEqual('');
      expect(ctx.createModuleContext(ENTRY_MODULE).resourceDir).assertEqual(dir);
      expect(ctx.filesDir === dir).assertFalse();
      expect(ctx.bundleCodeDir === dir).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0194
     * @tc.name      testContextDir0194
     * @tc.desc      Context resourceDir is empty when the module packages no resfile directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[6].pick(ctx);
      const marker: string = dir + '/marker_resourcedir_14.txt';
      logCase('testContextDir0194', `dir=${dir} marker=${marker}`);
      expect(dir).assertEqual('');
      expect(ctx.createModuleContext(ENTRY_MODULE).resourceDir).assertEqual(dir);
      expect(ctx.filesDir === dir).assertFalse();
      expect(ctx.bundleCodeDir === dir).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0195
     * @tc.name      testContextDir0195
     * @tc.desc      Context resourceDir is empty when the module packages no resfile directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[6].pick(ctx);
      const marker: string = dir + '/marker_resourcedir_15.txt';
      logCase('testContextDir0195', `dir=${dir} marker=${marker}`);
      expect(dir).assertEqual('');
      expect(ctx.createModuleContext(ENTRY_MODULE).resourceDir).assertEqual(dir);
      expect(ctx.filesDir === dir).assertFalse();
      expect(ctx.bundleCodeDir === dir).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0196
     * @tc.name      testContextDir0196
     * @tc.desc      Context resourceDir is empty when the module packages no resfile directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[6].pick(ctx);
      const marker: string = dir + '/marker_resourcedir_16.txt';
      logCase('testContextDir0196', `dir=${dir} marker=${marker}`);
      expect(dir).assertEqual('');
      expect(ctx.createModuleContext(ENTRY_MODULE).resourceDir).assertEqual(dir);
      expect(ctx.filesDir === dir).assertFalse();
      expect(ctx.bundleCodeDir === dir).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0197
     * @tc.name      testContextDir0197
     * @tc.desc      Context resourceDir is empty when the module packages no resfile directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[6].pick(ctx);
      const marker: string = dir + '/marker_resourcedir_17.txt';
      logCase('testContextDir0197', `dir=${dir} marker=${marker}`);
      expect(dir).assertEqual('');
      expect(ctx.createModuleContext(ENTRY_MODULE).resourceDir).assertEqual(dir);
      expect(ctx.filesDir === dir).assertFalse();
      expect(ctx.bundleCodeDir === dir).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0198
     * @tc.name      testContextDir0198
     * @tc.desc      Context resourceDir is empty when the module packages no resfile directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[6].pick(ctx);
      const marker: string = dir + '/marker_resourcedir_18.txt';
      logCase('testContextDir0198', `dir=${dir} marker=${marker}`);
      expect(dir).assertEqual('');
      expect(ctx.createModuleContext(ENTRY_MODULE).resourceDir).assertEqual(dir);
      expect(ctx.filesDir === dir).assertFalse();
      expect(ctx.bundleCodeDir === dir).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0199
     * @tc.name      testContextDir0199
     * @tc.desc      Context resourceDir is empty when the module packages no resfile directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[6].pick(ctx);
      const marker: string = dir + '/marker_resourcedir_19.txt';
      logCase('testContextDir0199', `dir=${dir} marker=${marker}`);
      expect(dir).assertEqual('');
      expect(ctx.createModuleContext(ENTRY_MODULE).resourceDir).assertEqual(dir);
      expect(ctx.filesDir === dir).assertFalse();
      expect(ctx.bundleCodeDir === dir).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0200
     * @tc.name      testContextDir0200
     * @tc.desc      Context resourceDir is empty when the module packages no resfile directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[6].pick(ctx);
      const marker: string = dir + '/marker_resourcedir_20.txt';
      logCase('testContextDir0200', `dir=${dir} marker=${marker}`);
      expect(dir).assertEqual('');
      expect(ctx.createModuleContext(ENTRY_MODULE).resourceDir).assertEqual(dir);
      expect(ctx.filesDir === dir).assertFalse();
      expect(ctx.bundleCodeDir === dir).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0201
     * @tc.name      testContextDir0201
     * @tc.desc      Context resourceDir is empty when the module packages no resfile directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[6].pick(ctx);
      const marker: string = dir + '/marker_resourcedir_21.txt';
      logCase('testContextDir0201', `dir=${dir} marker=${marker}`);
      expect(dir).assertEqual('');
      expect(ctx.createModuleContext(ENTRY_MODULE).resourceDir).assertEqual(dir);
      expect(ctx.filesDir === dir).assertFalse();
      expect(ctx.bundleCodeDir === dir).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0202
     * @tc.name      testContextDir0202
     * @tc.desc      Context resourceDir is empty when the module packages no resfile directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[6].pick(ctx);
      const marker: string = dir + '/marker_resourcedir_22.txt';
      logCase('testContextDir0202', `dir=${dir} marker=${marker}`);
      expect(dir).assertEqual('');
      expect(ctx.createModuleContext(ENTRY_MODULE).resourceDir).assertEqual(dir);
      expect(ctx.filesDir === dir).assertFalse();
      expect(ctx.bundleCodeDir === dir).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0203
     * @tc.name      testContextDir0203
     * @tc.desc      Context resourceDir is empty when the module packages no resfile directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[6].pick(ctx);
      const marker: string = dir + '/marker_resourcedir_23.txt';
      logCase('testContextDir0203', `dir=${dir} marker=${marker}`);
      expect(dir).assertEqual('');
      expect(ctx.createModuleContext(ENTRY_MODULE).resourceDir).assertEqual(dir);
      expect(ctx.filesDir === dir).assertFalse();
      expect(ctx.bundleCodeDir === dir).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0204
     * @tc.name      testContextDir0204
     * @tc.desc      Context resourceDir is empty when the module packages no resfile directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[6].pick(ctx);
      const marker: string = dir + '/marker_resourcedir_24.txt';
      logCase('testContextDir0204', `dir=${dir} marker=${marker}`);
      expect(dir).assertEqual('');
      expect(ctx.createModuleContext(ENTRY_MODULE).resourceDir).assertEqual(dir);
      expect(ctx.filesDir === dir).assertFalse();
      expect(ctx.bundleCodeDir === dir).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0205
     * @tc.name      testContextDir0205
     * @tc.desc      Context resourceDir is empty when the module packages no resfile directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[6].pick(ctx);
      const marker: string = dir + '/marker_resourcedir_25.txt';
      logCase('testContextDir0205', `dir=${dir} marker=${marker}`);
      expect(dir).assertEqual('');
      expect(ctx.createModuleContext(ENTRY_MODULE).resourceDir).assertEqual(dir);
      expect(ctx.filesDir === dir).assertFalse();
      expect(ctx.bundleCodeDir === dir).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0206
     * @tc.name      testContextDir0206
     * @tc.desc      Context resourceDir is empty when the module packages no resfile directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[6].pick(ctx);
      const marker: string = dir + '/marker_resourcedir_26.txt';
      logCase('testContextDir0206', `dir=${dir} marker=${marker}`);
      expect(dir).assertEqual('');
      expect(ctx.createModuleContext(ENTRY_MODULE).resourceDir).assertEqual(dir);
      expect(ctx.filesDir === dir).assertFalse();
      expect(ctx.bundleCodeDir === dir).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0207
     * @tc.name      testContextDir0207
     * @tc.desc      Context resourceDir is empty when the module packages no resfile directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[6].pick(ctx);
      const marker: string = dir + '/marker_resourcedir_27.txt';
      logCase('testContextDir0207', `dir=${dir} marker=${marker}`);
      expect(dir).assertEqual('');
      expect(ctx.createModuleContext(ENTRY_MODULE).resourceDir).assertEqual(dir);
      expect(ctx.filesDir === dir).assertFalse();
      expect(ctx.bundleCodeDir === dir).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0208
     * @tc.name      testContextDir0208
     * @tc.desc      Context resourceDir is empty when the module packages no resfile directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[6].pick(ctx);
      const marker: string = dir + '/marker_resourcedir_28.txt';
      logCase('testContextDir0208', `dir=${dir} marker=${marker}`);
      expect(dir).assertEqual('');
      expect(ctx.createModuleContext(ENTRY_MODULE).resourceDir).assertEqual(dir);
      expect(ctx.filesDir === dir).assertFalse();
      expect(ctx.bundleCodeDir === dir).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0209
     * @tc.name      testContextDir0209
     * @tc.desc      Context resourceDir is empty when the module packages no resfile directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[6].pick(ctx);
      const marker: string = dir + '/marker_resourcedir_29.txt';
      logCase('testContextDir0209', `dir=${dir} marker=${marker}`);
      expect(dir).assertEqual('');
      expect(ctx.createModuleContext(ENTRY_MODULE).resourceDir).assertEqual(dir);
      expect(ctx.filesDir === dir).assertFalse();
      expect(ctx.bundleCodeDir === dir).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0210
     * @tc.name      testContextDir0210
     * @tc.desc      Context resourceDir is empty when the module packages no resfile directory
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testContextDir0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[6].pick(ctx);
      const marker: string = dir + '/marker_resourcedir_30.txt';
      logCase('testContextDir0210', `dir=${dir} marker=${marker}`);
      expect(dir).assertEqual('');
      expect(ctx.createModuleContext(ENTRY_MODULE).resourceDir).assertEqual(dir);
      expect(ctx.filesDir === dir).assertFalse();
      expect(ctx.bundleCodeDir === dir).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0211
     * @tc.name      testContextDir0211
     * @tc.desc      Context distributedFilesDir keeps /distributedfiles and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[7].pick(ctx);
      const marker: string = dir + '/marker_distributedfilesdir_01.txt';
      logCase('testContextDir0211', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/distributedfiles')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'distributedFilesDir-01-m');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('distributedFilesDir-01-m');
        expect(fs.statSync(marker).size).assertEqual(24);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0212
     * @tc.name      testContextDir0212
     * @tc.desc      Context distributedFilesDir keeps /distributedfiles and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[7].pick(ctx);
      const marker: string = dir + '/marker_distributedfilesdir_02.txt';
      logCase('testContextDir0212', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/distributedfiles')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'distributedFilesDir-02-mm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('distributedFilesDir-02-mm');
        expect(fs.statSync(marker).size).assertEqual(25);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0213
     * @tc.name      testContextDir0213
     * @tc.desc      Context distributedFilesDir keeps /distributedfiles and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[7].pick(ctx);
      const marker: string = dir + '/marker_distributedfilesdir_03.txt';
      logCase('testContextDir0213', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/distributedfiles')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'distributedFilesDir-03-mmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('distributedFilesDir-03-mmm');
        expect(fs.statSync(marker).size).assertEqual(26);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0214
     * @tc.name      testContextDir0214
     * @tc.desc      Context distributedFilesDir keeps /distributedfiles and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[7].pick(ctx);
      const marker: string = dir + '/marker_distributedfilesdir_04.txt';
      logCase('testContextDir0214', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/distributedfiles')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'distributedFilesDir-04-mmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('distributedFilesDir-04-mmmm');
        expect(fs.statSync(marker).size).assertEqual(27);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0215
     * @tc.name      testContextDir0215
     * @tc.desc      Context distributedFilesDir keeps /distributedfiles and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[7].pick(ctx);
      const marker: string = dir + '/marker_distributedfilesdir_05.txt';
      logCase('testContextDir0215', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/distributedfiles')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'distributedFilesDir-05-mmmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('distributedFilesDir-05-mmmmm');
        expect(fs.statSync(marker).size).assertEqual(28);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0216
     * @tc.name      testContextDir0216
     * @tc.desc      Context distributedFilesDir keeps /distributedfiles and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[7].pick(ctx);
      const marker: string = dir + '/marker_distributedfilesdir_06.txt';
      logCase('testContextDir0216', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/distributedfiles')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'distributedFilesDir-06-');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('distributedFilesDir-06-');
        expect(fs.statSync(marker).size).assertEqual(23);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0217
     * @tc.name      testContextDir0217
     * @tc.desc      Context distributedFilesDir keeps /distributedfiles and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[7].pick(ctx);
      const marker: string = dir + '/marker_distributedfilesdir_07.txt';
      logCase('testContextDir0217', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/distributedfiles')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'distributedFilesDir-07-m');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('distributedFilesDir-07-m');
        expect(fs.statSync(marker).size).assertEqual(24);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0218
     * @tc.name      testContextDir0218
     * @tc.desc      Context distributedFilesDir keeps /distributedfiles and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[7].pick(ctx);
      const marker: string = dir + '/marker_distributedfilesdir_08.txt';
      logCase('testContextDir0218', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/distributedfiles')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'distributedFilesDir-08-mm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('distributedFilesDir-08-mm');
        expect(fs.statSync(marker).size).assertEqual(25);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0219
     * @tc.name      testContextDir0219
     * @tc.desc      Context distributedFilesDir keeps /distributedfiles and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[7].pick(ctx);
      const marker: string = dir + '/marker_distributedfilesdir_09.txt';
      logCase('testContextDir0219', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/distributedfiles')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'distributedFilesDir-09-mmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('distributedFilesDir-09-mmm');
        expect(fs.statSync(marker).size).assertEqual(26);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0220
     * @tc.name      testContextDir0220
     * @tc.desc      Context distributedFilesDir keeps /distributedfiles and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[7].pick(ctx);
      const marker: string = dir + '/marker_distributedfilesdir_10.txt';
      logCase('testContextDir0220', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/distributedfiles')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'distributedFilesDir-10-mmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('distributedFilesDir-10-mmmm');
        expect(fs.statSync(marker).size).assertEqual(27);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0221
     * @tc.name      testContextDir0221
     * @tc.desc      Context distributedFilesDir keeps /distributedfiles and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[7].pick(ctx);
      const marker: string = dir + '/marker_distributedfilesdir_11.txt';
      logCase('testContextDir0221', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/distributedfiles')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'distributedFilesDir-11-mmmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('distributedFilesDir-11-mmmmm');
        expect(fs.statSync(marker).size).assertEqual(28);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0222
     * @tc.name      testContextDir0222
     * @tc.desc      Context distributedFilesDir keeps /distributedfiles and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[7].pick(ctx);
      const marker: string = dir + '/marker_distributedfilesdir_12.txt';
      logCase('testContextDir0222', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/distributedfiles')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'distributedFilesDir-12-');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('distributedFilesDir-12-');
        expect(fs.statSync(marker).size).assertEqual(23);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0223
     * @tc.name      testContextDir0223
     * @tc.desc      Context distributedFilesDir keeps /distributedfiles and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[7].pick(ctx);
      const marker: string = dir + '/marker_distributedfilesdir_13.txt';
      logCase('testContextDir0223', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/distributedfiles')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'distributedFilesDir-13-m');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('distributedFilesDir-13-m');
        expect(fs.statSync(marker).size).assertEqual(24);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0224
     * @tc.name      testContextDir0224
     * @tc.desc      Context distributedFilesDir keeps /distributedfiles and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[7].pick(ctx);
      const marker: string = dir + '/marker_distributedfilesdir_14.txt';
      logCase('testContextDir0224', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/distributedfiles')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'distributedFilesDir-14-mm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('distributedFilesDir-14-mm');
        expect(fs.statSync(marker).size).assertEqual(25);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0225
     * @tc.name      testContextDir0225
     * @tc.desc      Context distributedFilesDir keeps /distributedfiles and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[7].pick(ctx);
      const marker: string = dir + '/marker_distributedfilesdir_15.txt';
      logCase('testContextDir0225', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/distributedfiles')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'distributedFilesDir-15-mmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('distributedFilesDir-15-mmm');
        expect(fs.statSync(marker).size).assertEqual(26);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0226
     * @tc.name      testContextDir0226
     * @tc.desc      Context distributedFilesDir keeps /distributedfiles and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[7].pick(ctx);
      const marker: string = dir + '/marker_distributedfilesdir_16.txt';
      logCase('testContextDir0226', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/distributedfiles')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'distributedFilesDir-16-mmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('distributedFilesDir-16-mmmm');
        expect(fs.statSync(marker).size).assertEqual(27);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0227
     * @tc.name      testContextDir0227
     * @tc.desc      Context distributedFilesDir keeps /distributedfiles and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[7].pick(ctx);
      const marker: string = dir + '/marker_distributedfilesdir_17.txt';
      logCase('testContextDir0227', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/distributedfiles')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'distributedFilesDir-17-mmmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('distributedFilesDir-17-mmmmm');
        expect(fs.statSync(marker).size).assertEqual(28);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0228
     * @tc.name      testContextDir0228
     * @tc.desc      Context distributedFilesDir keeps /distributedfiles and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[7].pick(ctx);
      const marker: string = dir + '/marker_distributedfilesdir_18.txt';
      logCase('testContextDir0228', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/distributedfiles')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'distributedFilesDir-18-');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('distributedFilesDir-18-');
        expect(fs.statSync(marker).size).assertEqual(23);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0229
     * @tc.name      testContextDir0229
     * @tc.desc      Context distributedFilesDir keeps /distributedfiles and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[7].pick(ctx);
      const marker: string = dir + '/marker_distributedfilesdir_19.txt';
      logCase('testContextDir0229', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/distributedfiles')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'distributedFilesDir-19-m');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('distributedFilesDir-19-m');
        expect(fs.statSync(marker).size).assertEqual(24);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0230
     * @tc.name      testContextDir0230
     * @tc.desc      Context distributedFilesDir keeps /distributedfiles and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[7].pick(ctx);
      const marker: string = dir + '/marker_distributedfilesdir_20.txt';
      logCase('testContextDir0230', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/distributedfiles')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'distributedFilesDir-20-mm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('distributedFilesDir-20-mm');
        expect(fs.statSync(marker).size).assertEqual(25);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0231
     * @tc.name      testContextDir0231
     * @tc.desc      Context distributedFilesDir keeps /distributedfiles and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[7].pick(ctx);
      const marker: string = dir + '/marker_distributedfilesdir_21.txt';
      logCase('testContextDir0231', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/distributedfiles')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'distributedFilesDir-21-mmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('distributedFilesDir-21-mmm');
        expect(fs.statSync(marker).size).assertEqual(26);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0232
     * @tc.name      testContextDir0232
     * @tc.desc      Context distributedFilesDir keeps /distributedfiles and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[7].pick(ctx);
      const marker: string = dir + '/marker_distributedfilesdir_22.txt';
      logCase('testContextDir0232', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/distributedfiles')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'distributedFilesDir-22-mmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('distributedFilesDir-22-mmmm');
        expect(fs.statSync(marker).size).assertEqual(27);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0233
     * @tc.name      testContextDir0233
     * @tc.desc      Context distributedFilesDir keeps /distributedfiles and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[7].pick(ctx);
      const marker: string = dir + '/marker_distributedfilesdir_23.txt';
      logCase('testContextDir0233', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/distributedfiles')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'distributedFilesDir-23-mmmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('distributedFilesDir-23-mmmmm');
        expect(fs.statSync(marker).size).assertEqual(28);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0234
     * @tc.name      testContextDir0234
     * @tc.desc      Context distributedFilesDir keeps /distributedfiles and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[7].pick(ctx);
      const marker: string = dir + '/marker_distributedfilesdir_24.txt';
      logCase('testContextDir0234', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/distributedfiles')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'distributedFilesDir-24-');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('distributedFilesDir-24-');
        expect(fs.statSync(marker).size).assertEqual(23);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0235
     * @tc.name      testContextDir0235
     * @tc.desc      Context distributedFilesDir keeps /distributedfiles and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[7].pick(ctx);
      const marker: string = dir + '/marker_distributedfilesdir_25.txt';
      logCase('testContextDir0235', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/distributedfiles')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'distributedFilesDir-25-m');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('distributedFilesDir-25-m');
        expect(fs.statSync(marker).size).assertEqual(24);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0236
     * @tc.name      testContextDir0236
     * @tc.desc      Context distributedFilesDir keeps /distributedfiles and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[7].pick(ctx);
      const marker: string = dir + '/marker_distributedfilesdir_26.txt';
      logCase('testContextDir0236', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/distributedfiles')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'distributedFilesDir-26-mm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('distributedFilesDir-26-mm');
        expect(fs.statSync(marker).size).assertEqual(25);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0237
     * @tc.name      testContextDir0237
     * @tc.desc      Context distributedFilesDir keeps /distributedfiles and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[7].pick(ctx);
      const marker: string = dir + '/marker_distributedfilesdir_27.txt';
      logCase('testContextDir0237', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/distributedfiles')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'distributedFilesDir-27-mmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('distributedFilesDir-27-mmm');
        expect(fs.statSync(marker).size).assertEqual(26);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0238
     * @tc.name      testContextDir0238
     * @tc.desc      Context distributedFilesDir keeps /distributedfiles and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[7].pick(ctx);
      const marker: string = dir + '/marker_distributedfilesdir_28.txt';
      logCase('testContextDir0238', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/distributedfiles')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'distributedFilesDir-28-mmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('distributedFilesDir-28-mmmm');
        expect(fs.statSync(marker).size).assertEqual(27);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0239
     * @tc.name      testContextDir0239
     * @tc.desc      Context distributedFilesDir keeps /distributedfiles and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[7].pick(ctx);
      const marker: string = dir + '/marker_distributedfilesdir_29.txt';
      logCase('testContextDir0239', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/distributedfiles')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'distributedFilesDir-29-mmmmm');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('distributedFilesDir-29-mmmmm');
        expect(fs.statSync(marker).size).assertEqual(28);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0240
     * @tc.name      testContextDir0240
     * @tc.desc      Context distributedFilesDir keeps /distributedfiles and accepts marker file work
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[7].pick(ctx);
      const marker: string = dir + '/marker_distributedfilesdir_30.txt';
      logCase('testContextDir0240', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/distributedfiles')).assertTrue();
      if (!fs.accessSync(dir)) {
        fs.mkdirSync(dir);
      }
      try {
        writeText(marker, 'distributedFilesDir-30-');
        expect(fs.accessSync(marker)).assertTrue();
        expect(fs.readTextSync(marker)).assertEqual('distributedFilesDir-30-');
        expect(fs.statSync(marker).size).assertEqual(23);
      } finally {
        if (fs.accessSync(marker)) {
          fs.unlinkSync(marker);
        }
      }
      expect(fs.accessSync(marker)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0241
     * @tc.name      testContextDir0241
     * @tc.desc      Context cloudFileDir keeps /cloud and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[8].pick(ctx);
      const marker: string = dir + '/marker_cloudfiledir_01.txt';
      logCase('testContextDir0241', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cloud')).assertTrue();
      expect(typeof fs.accessSync(dir)).assertEqual('boolean');
      expect(dir.indexOf('/cloud') >= 0).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0242
     * @tc.name      testContextDir0242
     * @tc.desc      Context cloudFileDir keeps /cloud and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[8].pick(ctx);
      const marker: string = dir + '/marker_cloudfiledir_02.txt';
      logCase('testContextDir0242', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cloud')).assertTrue();
      expect(typeof fs.accessSync(dir)).assertEqual('boolean');
      expect(dir.split('/').length >= 4).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0243
     * @tc.name      testContextDir0243
     * @tc.desc      Context cloudFileDir keeps /cloud and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[8].pick(ctx);
      const marker: string = dir + '/marker_cloudfiledir_03.txt';
      logCase('testContextDir0243', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cloud')).assertTrue();
      expect(typeof fs.accessSync(dir)).assertEqual('boolean');
      expect(dir.lastIndexOf('/') > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0244
     * @tc.name      testContextDir0244
     * @tc.desc      Context cloudFileDir keeps /cloud and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[8].pick(ctx);
      const marker: string = dir + '/marker_cloudfiledir_04.txt';
      logCase('testContextDir0244', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cloud')).assertTrue();
      expect(typeof fs.accessSync(dir)).assertEqual('boolean');
      expect(dir.indexOf('/cloud') >= 0).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0245
     * @tc.name      testContextDir0245
     * @tc.desc      Context cloudFileDir keeps /cloud and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[8].pick(ctx);
      const marker: string = dir + '/marker_cloudfiledir_05.txt';
      logCase('testContextDir0245', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cloud')).assertTrue();
      expect(typeof fs.accessSync(dir)).assertEqual('boolean');
      expect(dir.split('/').length >= 4).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0246
     * @tc.name      testContextDir0246
     * @tc.desc      Context cloudFileDir keeps /cloud and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[8].pick(ctx);
      const marker: string = dir + '/marker_cloudfiledir_06.txt';
      logCase('testContextDir0246', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cloud')).assertTrue();
      expect(typeof fs.accessSync(dir)).assertEqual('boolean');
      expect(dir.lastIndexOf('/') > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0247
     * @tc.name      testContextDir0247
     * @tc.desc      Context cloudFileDir keeps /cloud and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[8].pick(ctx);
      const marker: string = dir + '/marker_cloudfiledir_07.txt';
      logCase('testContextDir0247', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cloud')).assertTrue();
      expect(typeof fs.accessSync(dir)).assertEqual('boolean');
      expect(dir.indexOf('/cloud') >= 0).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0248
     * @tc.name      testContextDir0248
     * @tc.desc      Context cloudFileDir keeps /cloud and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[8].pick(ctx);
      const marker: string = dir + '/marker_cloudfiledir_08.txt';
      logCase('testContextDir0248', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cloud')).assertTrue();
      expect(typeof fs.accessSync(dir)).assertEqual('boolean');
      expect(dir.split('/').length >= 4).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0249
     * @tc.name      testContextDir0249
     * @tc.desc      Context cloudFileDir keeps /cloud and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[8].pick(ctx);
      const marker: string = dir + '/marker_cloudfiledir_09.txt';
      logCase('testContextDir0249', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cloud')).assertTrue();
      expect(typeof fs.accessSync(dir)).assertEqual('boolean');
      expect(dir.lastIndexOf('/') > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0250
     * @tc.name      testContextDir0250
     * @tc.desc      Context cloudFileDir keeps /cloud and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[8].pick(ctx);
      const marker: string = dir + '/marker_cloudfiledir_10.txt';
      logCase('testContextDir0250', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cloud')).assertTrue();
      expect(typeof fs.accessSync(dir)).assertEqual('boolean');
      expect(dir.indexOf('/cloud') >= 0).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0251
     * @tc.name      testContextDir0251
     * @tc.desc      Context cloudFileDir keeps /cloud and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[8].pick(ctx);
      const marker: string = dir + '/marker_cloudfiledir_11.txt';
      logCase('testContextDir0251', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cloud')).assertTrue();
      expect(typeof fs.accessSync(dir)).assertEqual('boolean');
      expect(dir.split('/').length >= 4).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0252
     * @tc.name      testContextDir0252
     * @tc.desc      Context cloudFileDir keeps /cloud and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testContextDir0252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const dir: string = DIR_CASES[8].pick(ctx);
      const marker: string = dir + '/marker_cloudfiledir_12.txt';
      logCase('testContextDir0252', `dir=${dir} marker=${marker}`);
      expect(dir.length > 0).assertTrue();
      expect(dir.startsWith('/data/storage')).assertTrue();
      expect(dir.endsWith('/cloud')).assertTrue();
      expect(typeof fs.accessSync(dir)).assertEqual('boolean');
      expect(dir.lastIndexOf('/') > 0).assertTrue();
    });
    /**
     * @tc.number    SUB_PREHTTP_CTXDIR_0253
     * @tc.name      testContextDir0253
     * @tc.desc      Context cloudFileDir keeps /cloud and stays read only
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
