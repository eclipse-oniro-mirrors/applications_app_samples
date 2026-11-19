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
