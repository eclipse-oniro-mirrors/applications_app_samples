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
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0014.dat';
      const content: string = 'har-probe-0014-payload-xxxxxxxxxxxxxx';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0014', `written=${written} size=${stat.size}`);
        expect(written).assertEqual(37);
        expect(text).assertEqual(content);
        expect(stat.size).assertEqual(37);
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
     * @tc.number    SUB_HARPACKAGE_FILEIO_0015
     * @tc.name      testFileIo0015
     * @tc.desc      File IO write and read cycle 15 preserves 38 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileIo0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0015.dat';
      const content: string = 'har-probe-0015-payload-xxxxxxxxxxxxxxx';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0015', `written=${written} size=${stat.size}`);
        expect(written).assertEqual(38);
        expect(text).assertEqual(content);
        expect(stat.size).assertEqual(38);
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
      const path: string = ctx.filesDir + '/probe_0016.dat';
      const content: string = 'har-probe-0016-payload-xxxxxxxxxxxxxxxx';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0016', `written=${written} size=${stat.size}`);
        expect(written).assertEqual(39);
        expect(text).assertEqual(content);
        expect(stat.size).assertEqual(39);
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
     * @tc.number    SUB_HARPACKAGE_FILEIO_0017
     * @tc.name      testFileIo0017
     * @tc.desc      File IO append flow 17 doubles the payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileIo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0017.dat';
      const content: string = '';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0017', `len=${text.length}`);
        expect(text).assertEqual(content + content);
        expect(text.length).assertEqual(0);
        expect(fs.statSync(path).size).assertEqual(0);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0018.dat';
      const content: string = 'har-probe-0018-payload-xxxxxxxxxxxxxxxxxx';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0018', `len=${text.length}`);
        expect(text).assertEqual(content + content);
        expect(text.length).assertEqual(82);
        expect(fs.statSync(path).size).assertEqual(82);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0019
     * @tc.name      testFileIo0019
     * @tc.desc      File IO append flow 19 doubles the payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileIo0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0019.dat';
      const content: string = 'har-probe-0019-payload-xxxxxxxxxxxxxxxxxxx';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0019', `len=${text.length}`);
        expect(text).assertEqual(content + content);
        expect(text.length).assertEqual(84);
        expect(fs.statSync(path).size).assertEqual(84);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0020.dat';
      const content: string = 'har-probe-0020-payload-xxxxxxxxxxxxxxxxxxxx';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0020', `len=${text.length}`);
        expect(text).assertEqual(content + content);
        expect(text.length).assertEqual(86);
        expect(fs.statSync(path).size).assertEqual(86);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0021
     * @tc.name      testFileIo0021
     * @tc.desc      File IO append flow 21 doubles the payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileIo0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0021.dat';
      const content: string = 'har-probe-0021-payload-xxxxxxxxxxxxxxxxxxxxx';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0021', `len=${text.length}`);
        expect(text).assertEqual(content + content);
        expect(text.length).assertEqual(88);
        expect(fs.statSync(path).size).assertEqual(88);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0022.dat';
      const content: string = 'har-probe-0022-payload-xxxxxxxxxxxxxxxxxxxxxx';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0022', `len=${text.length}`);
        expect(text).assertEqual(content + content);
        expect(text.length).assertEqual(90);
        expect(fs.statSync(path).size).assertEqual(90);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0023
     * @tc.name      testFileIo0023
     * @tc.desc      File IO append flow 23 doubles the payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileIo0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0023.dat';
      const content: string = 'har-probe-0023-payload-';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0023', `len=${text.length}`);
        expect(text).assertEqual(content + content);
        expect(text.length).assertEqual(46);
        expect(fs.statSync(path).size).assertEqual(46);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0024.dat';
      const content: string = 'har-probe-0024-payload-x';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0024', `len=${text.length}`);
        expect(text).assertEqual(content + content);
        expect(text.length).assertEqual(48);
        expect(fs.statSync(path).size).assertEqual(48);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0025
     * @tc.name      testFileIo0025
     * @tc.desc      File IO append flow 25 doubles the payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileIo0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0025.dat';
      const content: string = 'har-probe-0025-payload-xx';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0025', `len=${text.length}`);
        expect(text).assertEqual(content + content);
        expect(text.length).assertEqual(50);
        expect(fs.statSync(path).size).assertEqual(50);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0026.dat';
      const content: string = 'har-probe-0026-payload-xxx';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0026', `len=${text.length}`);
        expect(text).assertEqual(content + content);
        expect(text.length).assertEqual(52);
        expect(fs.statSync(path).size).assertEqual(52);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0027
     * @tc.name      testFileIo0027
     * @tc.desc      File IO append flow 27 doubles the payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileIo0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0027.dat';
      const content: string = 'har-probe-0027-payload-xxxx';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0027', `len=${text.length}`);
        expect(text).assertEqual(content + content);
        expect(text.length).assertEqual(54);
        expect(fs.statSync(path).size).assertEqual(54);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0028.dat';
      const content: string = 'har-probe-0028-payload-xxxxx';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0028', `len=${text.length}`);
        expect(text).assertEqual(content + content);
        expect(text.length).assertEqual(56);
        expect(fs.statSync(path).size).assertEqual(56);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0029
     * @tc.name      testFileIo0029
     * @tc.desc      File IO append flow 29 doubles the payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileIo0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0029.dat';
      const content: string = 'har-probe-0029-payload-xxxxxx';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0029', `len=${text.length}`);
        expect(text).assertEqual(content + content);
        expect(text.length).assertEqual(58);
        expect(fs.statSync(path).size).assertEqual(58);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0030.dat';
      const content: string = 'har-probe-0030-payload-xxxxxxx';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0030', `len=${text.length}`);
        expect(text).assertEqual(content + content);
        expect(text.length).assertEqual(60);
        expect(fs.statSync(path).size).assertEqual(60);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0031
     * @tc.name      testFileIo0031
     * @tc.desc      File IO append flow 31 doubles the payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileIo0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0031.dat';
      const content: string = 'har-probe-0031-payload-xxxxxxxx';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0031', `len=${text.length}`);
        expect(text).assertEqual(content + content);
        expect(text.length).assertEqual(62);
        expect(fs.statSync(path).size).assertEqual(62);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0032.dat';
      const content: string = 'har-probe-0032-payload-xxxxxxxxx';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0032', `len=${text.length}`);
        expect(text).assertEqual(content + content);
        expect(text.length).assertEqual(64);
        expect(fs.statSync(path).size).assertEqual(64);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0033
     * @tc.name      testFileIo0033
     * @tc.desc      File IO rename flow 33 keeps payload after relocation
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileIo0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0033.dat';
      const content: string = 'har-probe-0033-payload-xxxxxxxxxx';
      try {
        const moved: string = ctx.filesDir + '/probe_0033_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0033', `renamed=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(moved)).assertTrue();
        expect(fs.statSync(moved).size).assertEqual(33);
        fs.unlinkSync(moved);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0034.dat';
      const content: string = '';
      try {
        const moved: string = ctx.filesDir + '/probe_0034_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0034', `renamed=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(moved)).assertTrue();
        expect(fs.statSync(moved).size).assertEqual(0);
        fs.unlinkSync(moved);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0035
     * @tc.name      testFileIo0035
     * @tc.desc      File IO rename flow 35 keeps payload after relocation
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileIo0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0035.dat';
      const content: string = 'har-probe-0035-payload-xxxxxxxxxxxx';
      try {
        const moved: string = ctx.filesDir + '/probe_0035_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0035', `renamed=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(moved)).assertTrue();
        expect(fs.statSync(moved).size).assertEqual(35);
        fs.unlinkSync(moved);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0036.dat';
      const content: string = 'har-probe-0036-payload-xxxxxxxxxxxxx';
      try {
        const moved: string = ctx.filesDir + '/probe_0036_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0036', `renamed=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(moved)).assertTrue();
        expect(fs.statSync(moved).size).assertEqual(36);
        fs.unlinkSync(moved);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0037
     * @tc.name      testFileIo0037
     * @tc.desc      File IO rename flow 37 keeps payload after relocation
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileIo0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0037.dat';
      const content: string = 'har-probe-0037-payload-xxxxxxxxxxxxxx';
      try {
        const moved: string = ctx.filesDir + '/probe_0037_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0037', `renamed=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(moved)).assertTrue();
        expect(fs.statSync(moved).size).assertEqual(37);
        fs.unlinkSync(moved);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0038.dat';
      const content: string = 'har-probe-0038-payload-xxxxxxxxxxxxxxx';
      try {
        const moved: string = ctx.filesDir + '/probe_0038_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0038', `renamed=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(moved)).assertTrue();
        expect(fs.statSync(moved).size).assertEqual(38);
        fs.unlinkSync(moved);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0039
     * @tc.name      testFileIo0039
     * @tc.desc      File IO rename flow 39 keeps payload after relocation
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileIo0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0039.dat';
      const content: string = 'har-probe-0039-payload-xxxxxxxxxxxxxxxx';
      try {
        const moved: string = ctx.filesDir + '/probe_0039_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0039', `renamed=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(moved)).assertTrue();
        expect(fs.statSync(moved).size).assertEqual(39);
        fs.unlinkSync(moved);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0040.dat';
      const content: string = 'har-probe-0040-payload-xxxxxxxxxxxxxxxxx';
      try {
        const moved: string = ctx.filesDir + '/probe_0040_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0040', `renamed=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(moved)).assertTrue();
        expect(fs.statSync(moved).size).assertEqual(40);
        fs.unlinkSync(moved);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0041
     * @tc.name      testFileIo0041
     * @tc.desc      File IO rename flow 41 keeps payload after relocation
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileIo0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0041.dat';
      const content: string = 'har-probe-0041-payload-xxxxxxxxxxxxxxxxxx';
      try {
        const moved: string = ctx.filesDir + '/probe_0041_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0041', `renamed=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(moved)).assertTrue();
        expect(fs.statSync(moved).size).assertEqual(41);
        fs.unlinkSync(moved);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0042.dat';
      const content: string = 'har-probe-0042-payload-xxxxxxxxxxxxxxxxxxx';
      try {
        const moved: string = ctx.filesDir + '/probe_0042_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0042', `renamed=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(moved)).assertTrue();
        expect(fs.statSync(moved).size).assertEqual(42);
        fs.unlinkSync(moved);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0043
     * @tc.name      testFileIo0043
     * @tc.desc      File IO rename flow 43 keeps payload after relocation
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileIo0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0043.dat';
      const content: string = 'har-probe-0043-payload-xxxxxxxxxxxxxxxxxxxx';
      try {
        const moved: string = ctx.filesDir + '/probe_0043_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0043', `renamed=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(moved)).assertTrue();
        expect(fs.statSync(moved).size).assertEqual(43);
        fs.unlinkSync(moved);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0044.dat';
      const content: string = 'har-probe-0044-payload-xxxxxxxxxxxxxxxxxxxxx';
      try {
        const moved: string = ctx.filesDir + '/probe_0044_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0044', `renamed=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(moved)).assertTrue();
        expect(fs.statSync(moved).size).assertEqual(44);
        fs.unlinkSync(moved);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0045
     * @tc.name      testFileIo0045
     * @tc.desc      File IO rename flow 45 keeps payload after relocation
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileIo0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0045.dat';
      const content: string = 'har-probe-0045-payload-xxxxxxxxxxxxxxxxxxxxxx';
      try {
        const moved: string = ctx.filesDir + '/probe_0045_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0045', `renamed=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(moved)).assertTrue();
        expect(fs.statSync(moved).size).assertEqual(45);
        fs.unlinkSync(moved);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0046.dat';
      const content: string = 'har-probe-0046-payload-';
      try {
        const moved: string = ctx.filesDir + '/probe_0046_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0046', `renamed=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(moved)).assertTrue();
        expect(fs.statSync(moved).size).assertEqual(23);
        fs.unlinkSync(moved);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0047
     * @tc.name      testFileIo0047
     * @tc.desc      File IO rename flow 47 keeps payload after relocation
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileIo0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0047.dat';
      const content: string = 'har-probe-0047-payload-x';
      try {
        const moved: string = ctx.filesDir + '/probe_0047_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0047', `renamed=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(moved)).assertTrue();
        expect(fs.statSync(moved).size).assertEqual(24);
        fs.unlinkSync(moved);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0048.dat';
      const content: string = 'har-probe-0048-payload-xx';
      try {
        const moved: string = ctx.filesDir + '/probe_0048_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0048', `renamed=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(moved)).assertTrue();
        expect(fs.statSync(moved).size).assertEqual(25);
        fs.unlinkSync(moved);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0049
     * @tc.name      testFileIo0049
     * @tc.desc      File IO copy flow 49 duplicates 26 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileIo0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0049.dat';
      const content: string = 'har-probe-0049-payload-xxx';
      try {
        const copyPath: string = ctx.filesDir + '/probe_0049_copy.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.copyFileSync(path, copyPath);
        const sourceText: string = fs.readTextSync(path);
        const copyText: string = fs.readTextSync(copyPath);
        logCase('testFileIo0049', `copy=${copyText.length}`);
        expect(copyText).assertEqual(sourceText);
        expect(copyText).assertEqual(content);
        expect(fs.statSync(copyPath).size).assertEqual(26);
        fs.unlinkSync(copyPath);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0050.dat';
      const content: string = 'har-probe-0050-payload-xxxx';
      try {
        const copyPath: string = ctx.filesDir + '/probe_0050_copy.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.copyFileSync(path, copyPath);
        const sourceText: string = fs.readTextSync(path);
        const copyText: string = fs.readTextSync(copyPath);
        logCase('testFileIo0050', `copy=${copyText.length}`);
        expect(copyText).assertEqual(sourceText);
        expect(copyText).assertEqual(content);
        expect(fs.statSync(copyPath).size).assertEqual(27);
        fs.unlinkSync(copyPath);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0051
     * @tc.name      testFileIo0051
     * @tc.desc      File IO copy flow 51 duplicates 0 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileIo0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0051.dat';
      const content: string = '';
      try {
        const copyPath: string = ctx.filesDir + '/probe_0051_copy.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.copyFileSync(path, copyPath);
        const sourceText: string = fs.readTextSync(path);
        const copyText: string = fs.readTextSync(copyPath);
        logCase('testFileIo0051', `copy=${copyText.length}`);
        expect(copyText).assertEqual(sourceText);
        expect(copyText).assertEqual(content);
        expect(fs.statSync(copyPath).size).assertEqual(0);
        fs.unlinkSync(copyPath);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0052.dat';
      const content: string = 'har-probe-0052-payload-xxxxxx';
      try {
        const copyPath: string = ctx.filesDir + '/probe_0052_copy.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.copyFileSync(path, copyPath);
        const sourceText: string = fs.readTextSync(path);
        const copyText: string = fs.readTextSync(copyPath);
        logCase('testFileIo0052', `copy=${copyText.length}`);
        expect(copyText).assertEqual(sourceText);
        expect(copyText).assertEqual(content);
        expect(fs.statSync(copyPath).size).assertEqual(29);
        fs.unlinkSync(copyPath);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0053
     * @tc.name      testFileIo0053
     * @tc.desc      File IO copy flow 53 duplicates 30 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileIo0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0053.dat';
      const content: string = 'har-probe-0053-payload-xxxxxxx';
      try {
        const copyPath: string = ctx.filesDir + '/probe_0053_copy.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.copyFileSync(path, copyPath);
        const sourceText: string = fs.readTextSync(path);
        const copyText: string = fs.readTextSync(copyPath);
        logCase('testFileIo0053', `copy=${copyText.length}`);
        expect(copyText).assertEqual(sourceText);
        expect(copyText).assertEqual(content);
        expect(fs.statSync(copyPath).size).assertEqual(30);
        fs.unlinkSync(copyPath);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0054.dat';
      const content: string = 'har-probe-0054-payload-xxxxxxxx';
      try {
        const copyPath: string = ctx.filesDir + '/probe_0054_copy.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.copyFileSync(path, copyPath);
        const sourceText: string = fs.readTextSync(path);
        const copyText: string = fs.readTextSync(copyPath);
        logCase('testFileIo0054', `copy=${copyText.length}`);
        expect(copyText).assertEqual(sourceText);
        expect(copyText).assertEqual(content);
        expect(fs.statSync(copyPath).size).assertEqual(31);
        fs.unlinkSync(copyPath);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0055
     * @tc.name      testFileIo0055
     * @tc.desc      File IO copy flow 55 duplicates 32 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileIo0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0055.dat';
      const content: string = 'har-probe-0055-payload-xxxxxxxxx';
      try {
        const copyPath: string = ctx.filesDir + '/probe_0055_copy.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.copyFileSync(path, copyPath);
        const sourceText: string = fs.readTextSync(path);
        const copyText: string = fs.readTextSync(copyPath);
        logCase('testFileIo0055', `copy=${copyText.length}`);
        expect(copyText).assertEqual(sourceText);
        expect(copyText).assertEqual(content);
        expect(fs.statSync(copyPath).size).assertEqual(32);
        fs.unlinkSync(copyPath);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0056.dat';
      const content: string = 'har-probe-0056-payload-xxxxxxxxxx';
      try {
        const copyPath: string = ctx.filesDir + '/probe_0056_copy.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.copyFileSync(path, copyPath);
        const sourceText: string = fs.readTextSync(path);
        const copyText: string = fs.readTextSync(copyPath);
        logCase('testFileIo0056', `copy=${copyText.length}`);
        expect(copyText).assertEqual(sourceText);
        expect(copyText).assertEqual(content);
        expect(fs.statSync(copyPath).size).assertEqual(33);
        fs.unlinkSync(copyPath);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0057
     * @tc.name      testFileIo0057
     * @tc.desc      File IO copy flow 57 duplicates 34 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileIo0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0057.dat';
      const content: string = 'har-probe-0057-payload-xxxxxxxxxxx';
      try {
        const copyPath: string = ctx.filesDir + '/probe_0057_copy.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.copyFileSync(path, copyPath);
        const sourceText: string = fs.readTextSync(path);
        const copyText: string = fs.readTextSync(copyPath);
        logCase('testFileIo0057', `copy=${copyText.length}`);
        expect(copyText).assertEqual(sourceText);
        expect(copyText).assertEqual(content);
        expect(fs.statSync(copyPath).size).assertEqual(34);
        fs.unlinkSync(copyPath);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0058.dat';
      const content: string = 'har-probe-0058-payload-xxxxxxxxxxxx';
      try {
        const copyPath: string = ctx.filesDir + '/probe_0058_copy.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.copyFileSync(path, copyPath);
        const sourceText: string = fs.readTextSync(path);
        const copyText: string = fs.readTextSync(copyPath);
        logCase('testFileIo0058', `copy=${copyText.length}`);
        expect(copyText).assertEqual(sourceText);
        expect(copyText).assertEqual(content);
        expect(fs.statSync(copyPath).size).assertEqual(35);
        fs.unlinkSync(copyPath);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0059
     * @tc.name      testFileIo0059
     * @tc.desc      File IO copy flow 59 duplicates 36 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileIo0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0059.dat';
      const content: string = 'har-probe-0059-payload-xxxxxxxxxxxxx';
      try {
        const copyPath: string = ctx.filesDir + '/probe_0059_copy.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.copyFileSync(path, copyPath);
        const sourceText: string = fs.readTextSync(path);
        const copyText: string = fs.readTextSync(copyPath);
        logCase('testFileIo0059', `copy=${copyText.length}`);
        expect(copyText).assertEqual(sourceText);
        expect(copyText).assertEqual(content);
        expect(fs.statSync(copyPath).size).assertEqual(36);
        fs.unlinkSync(copyPath);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0060.dat';
      const content: string = 'har-probe-0060-payload-xxxxxxxxxxxxxx';
      try {
        const copyPath: string = ctx.filesDir + '/probe_0060_copy.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.copyFileSync(path, copyPath);
        const sourceText: string = fs.readTextSync(path);
        const copyText: string = fs.readTextSync(copyPath);
        logCase('testFileIo0060', `copy=${copyText.length}`);
        expect(copyText).assertEqual(sourceText);
        expect(copyText).assertEqual(content);
        expect(fs.statSync(copyPath).size).assertEqual(37);
        fs.unlinkSync(copyPath);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0061
     * @tc.name      testFileIo0061
     * @tc.desc      File IO copy flow 61 duplicates 38 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileIo0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0061.dat';
      const content: string = 'har-probe-0061-payload-xxxxxxxxxxxxxxx';
      try {
        const copyPath: string = ctx.filesDir + '/probe_0061_copy.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.copyFileSync(path, copyPath);
        const sourceText: string = fs.readTextSync(path);
        const copyText: string = fs.readTextSync(copyPath);
        logCase('testFileIo0061', `copy=${copyText.length}`);
        expect(copyText).assertEqual(sourceText);
        expect(copyText).assertEqual(content);
        expect(fs.statSync(copyPath).size).assertEqual(38);
        fs.unlinkSync(copyPath);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0062.dat';
      const content: string = 'har-probe-0062-payload-xxxxxxxxxxxxxxxx';
      try {
        const copyPath: string = ctx.filesDir + '/probe_0062_copy.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.copyFileSync(path, copyPath);
        const sourceText: string = fs.readTextSync(path);
        const copyText: string = fs.readTextSync(copyPath);
        logCase('testFileIo0062', `copy=${copyText.length}`);
        expect(copyText).assertEqual(sourceText);
        expect(copyText).assertEqual(content);
        expect(fs.statSync(copyPath).size).assertEqual(39);
        fs.unlinkSync(copyPath);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0063
     * @tc.name      testFileIo0063
     * @tc.desc      File IO copy flow 63 duplicates 40 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileIo0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0063.dat';
      const content: string = 'har-probe-0063-payload-xxxxxxxxxxxxxxxxx';
      try {
        const copyPath: string = ctx.filesDir + '/probe_0063_copy.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.copyFileSync(path, copyPath);
        const sourceText: string = fs.readTextSync(path);
        const copyText: string = fs.readTextSync(copyPath);
        logCase('testFileIo0063', `copy=${copyText.length}`);
        expect(copyText).assertEqual(sourceText);
        expect(copyText).assertEqual(content);
        expect(fs.statSync(copyPath).size).assertEqual(40);
        fs.unlinkSync(copyPath);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0064.dat';
      const content: string = 'har-probe-0064-payload-xxxxxxxxxxxxxxxxxx';
      try {
        const copyPath: string = ctx.filesDir + '/probe_0064_copy.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.copyFileSync(path, copyPath);
        const sourceText: string = fs.readTextSync(path);
        const copyText: string = fs.readTextSync(copyPath);
        logCase('testFileIo0064', `copy=${copyText.length}`);
        expect(copyText).assertEqual(sourceText);
        expect(copyText).assertEqual(content);
        expect(fs.statSync(copyPath).size).assertEqual(41);
        fs.unlinkSync(copyPath);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0065
     * @tc.name      testFileIo0065
     * @tc.desc      File IO directory flow 65 stores a nested payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileIo0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0065.dat';
      const content: string = 'har-probe-0065-payload-xxxxxxxxxxxxxxxxxxx';
      try {
        const dir: string = ctx.filesDir + '/probe_0065_dir';
        fs.mkdirSync(dir, true);
        const nested: string = dir + '/nested.dat';
        const file: fs.File = fs.openSync(nested, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(nested);
        logCase('testFileIo0065', `nested=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.statSync(nested).size).assertEqual(42);
        fs.unlinkSync(nested);
        fs.rmdirSync(dir);
        expect(fs.accessSync(dir)).assertFalse();
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0066.dat';
      const content: string = 'har-probe-0066-payload-xxxxxxxxxxxxxxxxxxxx';
      try {
        const dir: string = ctx.filesDir + '/probe_0066_dir';
        fs.mkdirSync(dir, true);
        const nested: string = dir + '/nested.dat';
        const file: fs.File = fs.openSync(nested, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(nested);
        logCase('testFileIo0066', `nested=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.statSync(nested).size).assertEqual(43);
        fs.unlinkSync(nested);
        fs.rmdirSync(dir);
        expect(fs.accessSync(dir)).assertFalse();
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0067
     * @tc.name      testFileIo0067
     * @tc.desc      File IO directory flow 67 stores a nested payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileIo0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0067.dat';
      const content: string = 'har-probe-0067-payload-xxxxxxxxxxxxxxxxxxxxx';
      try {
        const dir: string = ctx.filesDir + '/probe_0067_dir';
        fs.mkdirSync(dir, true);
        const nested: string = dir + '/nested.dat';
        const file: fs.File = fs.openSync(nested, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(nested);
        logCase('testFileIo0067', `nested=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.statSync(nested).size).assertEqual(44);
        fs.unlinkSync(nested);
        fs.rmdirSync(dir);
        expect(fs.accessSync(dir)).assertFalse();
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0068.dat';
      const content: string = '';
      try {
        const dir: string = ctx.filesDir + '/probe_0068_dir';
        fs.mkdirSync(dir, true);
        const nested: string = dir + '/nested.dat';
        const file: fs.File = fs.openSync(nested, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(nested);
        logCase('testFileIo0068', `nested=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.statSync(nested).size).assertEqual(0);
        fs.unlinkSync(nested);
        fs.rmdirSync(dir);
        expect(fs.accessSync(dir)).assertFalse();
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0069
     * @tc.name      testFileIo0069
     * @tc.desc      File IO directory flow 69 stores a nested payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileIo0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0069.dat';
      const content: string = 'har-probe-0069-payload-';
      try {
        const dir: string = ctx.filesDir + '/probe_0069_dir';
        fs.mkdirSync(dir, true);
        const nested: string = dir + '/nested.dat';
        const file: fs.File = fs.openSync(nested, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(nested);
        logCase('testFileIo0069', `nested=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.statSync(nested).size).assertEqual(23);
        fs.unlinkSync(nested);
        fs.rmdirSync(dir);
        expect(fs.accessSync(dir)).assertFalse();
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0070.dat';
      const content: string = 'har-probe-0070-payload-x';
      try {
        const dir: string = ctx.filesDir + '/probe_0070_dir';
        fs.mkdirSync(dir, true);
        const nested: string = dir + '/nested.dat';
        const file: fs.File = fs.openSync(nested, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(nested);
        logCase('testFileIo0070', `nested=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.statSync(nested).size).assertEqual(24);
        fs.unlinkSync(nested);
        fs.rmdirSync(dir);
        expect(fs.accessSync(dir)).assertFalse();
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0071
     * @tc.name      testFileIo0071
     * @tc.desc      File IO directory flow 71 stores a nested payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileIo0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0071.dat';
      const content: string = 'har-probe-0071-payload-xx';
      try {
        const dir: string = ctx.filesDir + '/probe_0071_dir';
        fs.mkdirSync(dir, true);
        const nested: string = dir + '/nested.dat';
        const file: fs.File = fs.openSync(nested, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(nested);
        logCase('testFileIo0071', `nested=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.statSync(nested).size).assertEqual(25);
        fs.unlinkSync(nested);
        fs.rmdirSync(dir);
        expect(fs.accessSync(dir)).assertFalse();
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0072.dat';
      const content: string = 'har-probe-0072-payload-xxx';
      try {
        const dir: string = ctx.filesDir + '/probe_0072_dir';
        fs.mkdirSync(dir, true);
        const nested: string = dir + '/nested.dat';
        const file: fs.File = fs.openSync(nested, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(nested);
        logCase('testFileIo0072', `nested=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.statSync(nested).size).assertEqual(26);
        fs.unlinkSync(nested);
        fs.rmdirSync(dir);
        expect(fs.accessSync(dir)).assertFalse();
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0073
     * @tc.name      testFileIo0073
     * @tc.desc      File IO directory flow 73 stores a nested payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileIo0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0073.dat';
      const content: string = 'har-probe-0073-payload-xxxx';
      try {
        const dir: string = ctx.filesDir + '/probe_0073_dir';
        fs.mkdirSync(dir, true);
        const nested: string = dir + '/nested.dat';
        const file: fs.File = fs.openSync(nested, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(nested);
        logCase('testFileIo0073', `nested=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.statSync(nested).size).assertEqual(27);
        fs.unlinkSync(nested);
        fs.rmdirSync(dir);
        expect(fs.accessSync(dir)).assertFalse();
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0074.dat';
      const content: string = 'har-probe-0074-payload-xxxxx';
      try {
        const dir: string = ctx.filesDir + '/probe_0074_dir';
