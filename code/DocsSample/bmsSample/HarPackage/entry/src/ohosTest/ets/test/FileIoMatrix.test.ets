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
import { entryContext } from './shared/HarProbe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

export default function fileIoMatrixTest() {
  describe('FileIoMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0001
     * @tc.name      testFileIo0001
     * @tc.desc      File IO write and read cycle 1 preserves 24 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileIo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0001.dat';
      const content: string = 'har-probe-0001-payload-x';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0001', `written=${written} size=${stat.size}`);
        expect(written).assertEqual(24);
        expect(text).assertEqual(content);
        expect(stat.size).assertEqual(24);
        expect(stat.isFile()).assertTrue();
        expect(fs.accessSync(path)).assertTrue();
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0002.dat';
      const content: string = 'har-probe-0002-payload-xx';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0002', `written=${written} size=${stat.size}`);
        expect(written).assertEqual(25);
        expect(text).assertEqual(content);
        expect(stat.size).assertEqual(25);
        expect(stat.isFile()).assertTrue();
        expect(fs.accessSync(path)).assertTrue();
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0003
     * @tc.name      testFileIo0003
     * @tc.desc      File IO write and read cycle 3 preserves 26 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileIo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0003.dat';
      const content: string = 'har-probe-0003-payload-xxx';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0003', `written=${written} size=${stat.size}`);
        expect(written).assertEqual(26);
        expect(text).assertEqual(content);
        expect(stat.size).assertEqual(26);
        expect(stat.isFile()).assertTrue();
        expect(fs.accessSync(path)).assertTrue();
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0004.dat';
      const content: string = 'har-probe-0004-payload-xxxx';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0004', `written=${written} size=${stat.size}`);
        expect(written).assertEqual(27);
        expect(text).assertEqual(content);
        expect(stat.size).assertEqual(27);
        expect(stat.isFile()).assertTrue();
        expect(fs.accessSync(path)).assertTrue();
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0005
     * @tc.name      testFileIo0005
     * @tc.desc      File IO write and read cycle 5 preserves 28 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileIo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0005.dat';
      const content: string = 'har-probe-0005-payload-xxxxx';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0005', `written=${written} size=${stat.size}`);
        expect(written).assertEqual(28);
        expect(text).assertEqual(content);
        expect(stat.size).assertEqual(28);
        expect(stat.isFile()).assertTrue();
        expect(fs.accessSync(path)).assertTrue();
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0006.dat';
      const content: string = 'har-probe-0006-payload-xxxxxx';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0006', `written=${written} size=${stat.size}`);
        expect(written).assertEqual(29);
        expect(text).assertEqual(content);
        expect(stat.size).assertEqual(29);
        expect(stat.isFile()).assertTrue();
        expect(fs.accessSync(path)).assertTrue();
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0007
     * @tc.name      testFileIo0007
     * @tc.desc      File IO write and read cycle 7 preserves 30 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileIo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0007.dat';
      const content: string = 'har-probe-0007-payload-xxxxxxx';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0007', `written=${written} size=${stat.size}`);
        expect(written).assertEqual(30);
        expect(text).assertEqual(content);
        expect(stat.size).assertEqual(30);
        expect(stat.isFile()).assertTrue();
        expect(fs.accessSync(path)).assertTrue();
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0008.dat';
      const content: string = 'har-probe-0008-payload-xxxxxxxx';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0008', `written=${written} size=${stat.size}`);
        expect(written).assertEqual(31);
        expect(text).assertEqual(content);
        expect(stat.size).assertEqual(31);
        expect(stat.isFile()).assertTrue();
        expect(fs.accessSync(path)).assertTrue();
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0009
     * @tc.name      testFileIo0009
     * @tc.desc      File IO write and read cycle 9 preserves 32 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileIo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0009.dat';
      const content: string = 'har-probe-0009-payload-xxxxxxxxx';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0009', `written=${written} size=${stat.size}`);
        expect(written).assertEqual(32);
        expect(text).assertEqual(content);
        expect(stat.size).assertEqual(32);
        expect(stat.isFile()).assertTrue();
        expect(fs.accessSync(path)).assertTrue();
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0010.dat';
      const content: string = 'har-probe-0010-payload-xxxxxxxxxx';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0010', `written=${written} size=${stat.size}`);
        expect(written).assertEqual(33);
        expect(text).assertEqual(content);
        expect(stat.size).assertEqual(33);
        expect(stat.isFile()).assertTrue();
        expect(fs.accessSync(path)).assertTrue();
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0011
     * @tc.name      testFileIo0011
     * @tc.desc      File IO write and read cycle 11 preserves 34 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileIo0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0011.dat';
      const content: string = 'har-probe-0011-payload-xxxxxxxxxxx';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0011', `written=${written} size=${stat.size}`);
        expect(written).assertEqual(34);
        expect(text).assertEqual(content);
        expect(stat.size).assertEqual(34);
        expect(stat.isFile()).assertTrue();
        expect(fs.accessSync(path)).assertTrue();
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0012.dat';
      const content: string = 'har-probe-0012-payload-xxxxxxxxxxxx';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0012', `written=${written} size=${stat.size}`);
        expect(written).assertEqual(35);
        expect(text).assertEqual(content);
        expect(stat.size).assertEqual(35);
        expect(stat.isFile()).assertTrue();
        expect(fs.accessSync(path)).assertTrue();
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0013
     * @tc.name      testFileIo0013
     * @tc.desc      File IO write and read cycle 13 preserves 36 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileIo0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0013.dat';
      const content: string = 'har-probe-0013-payload-xxxxxxxxxxxxx';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0013', `written=${written} size=${stat.size}`);
        expect(written).assertEqual(36);
        expect(text).assertEqual(content);
        expect(stat.size).assertEqual(36);
        expect(stat.isFile()).assertTrue();
        expect(fs.accessSync(path)).assertTrue();
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
