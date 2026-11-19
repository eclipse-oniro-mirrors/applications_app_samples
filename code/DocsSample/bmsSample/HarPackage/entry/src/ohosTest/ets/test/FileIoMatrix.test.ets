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
        fs.mkdirSync(dir, true);
        const nested: string = dir + '/nested.dat';
        const file: fs.File = fs.openSync(nested, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(nested);
        logCase('testFileIo0074', `nested=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.statSync(nested).size).assertEqual(28);
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
     * @tc.number    SUB_HARPACKAGE_FILEIO_0075
     * @tc.name      testFileIo0075
     * @tc.desc      File IO directory flow 75 stores a nested payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileIo0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0075.dat';
      const content: string = 'har-probe-0075-payload-xxxxxx';
      try {
        const dir: string = ctx.filesDir + '/probe_0075_dir';
        fs.mkdirSync(dir, true);
        const nested: string = dir + '/nested.dat';
        const file: fs.File = fs.openSync(nested, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(nested);
        logCase('testFileIo0075', `nested=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.statSync(nested).size).assertEqual(29);
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
      const path: string = ctx.filesDir + '/probe_0076.dat';
      const content: string = 'har-probe-0076-payload-xxxxxxx';
      try {
        const dir: string = ctx.filesDir + '/probe_0076_dir';
        fs.mkdirSync(dir, true);
        const nested: string = dir + '/nested.dat';
        const file: fs.File = fs.openSync(nested, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(nested);
        logCase('testFileIo0076', `nested=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.statSync(nested).size).assertEqual(30);
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
     * @tc.number    SUB_HARPACKAGE_FILEIO_0077
     * @tc.name      testFileIo0077
     * @tc.desc      File IO directory flow 77 stores a nested payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileIo0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0077.dat';
      const content: string = 'har-probe-0077-payload-xxxxxxxx';
      try {
        const dir: string = ctx.filesDir + '/probe_0077_dir';
        fs.mkdirSync(dir, true);
        const nested: string = dir + '/nested.dat';
        const file: fs.File = fs.openSync(nested, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(nested);
        logCase('testFileIo0077', `nested=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.statSync(nested).size).assertEqual(31);
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
      const path: string = ctx.filesDir + '/probe_0078.dat';
      const content: string = 'har-probe-0078-payload-xxxxxxxxx';
      try {
        const dir: string = ctx.filesDir + '/probe_0078_dir';
        fs.mkdirSync(dir, true);
        const nested: string = dir + '/nested.dat';
        const file: fs.File = fs.openSync(nested, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(nested);
        logCase('testFileIo0078', `nested=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.statSync(nested).size).assertEqual(32);
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
     * @tc.number    SUB_HARPACKAGE_FILEIO_0079
     * @tc.name      testFileIo0079
     * @tc.desc      File IO directory flow 79 stores a nested payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileIo0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0079.dat';
      const content: string = 'har-probe-0079-payload-xxxxxxxxxx';
      try {
        const dir: string = ctx.filesDir + '/probe_0079_dir';
        fs.mkdirSync(dir, true);
        const nested: string = dir + '/nested.dat';
        const file: fs.File = fs.openSync(nested, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(nested);
        logCase('testFileIo0079', `nested=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.statSync(nested).size).assertEqual(33);
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
      const path: string = ctx.filesDir + '/probe_0080.dat';
      const content: string = 'har-probe-0080-payload-xxxxxxxxxxx';
      try {
        const dir: string = ctx.filesDir + '/probe_0080_dir';
        fs.mkdirSync(dir, true);
        const nested: string = dir + '/nested.dat';
        const file: fs.File = fs.openSync(nested, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(nested);
        logCase('testFileIo0080', `nested=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.statSync(nested).size).assertEqual(34);
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
     * @tc.number    SUB_HARPACKAGE_FILEIO_0081
     * @tc.name      testFileIo0081
     * @tc.desc      File IO write and read cycle 81 preserves 35 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileIo0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0081.dat';
      const content: string = 'har-probe-0081-payload-xxxxxxxxxxxx';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0081', `written=${written} size=${stat.size}`);
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
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0082.dat';
      const content: string = 'har-probe-0082-payload-xxxxxxxxxxxxx';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0082', `written=${written} size=${stat.size}`);
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
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0083
     * @tc.name      testFileIo0083
     * @tc.desc      File IO write and read cycle 83 preserves 37 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileIo0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0083.dat';
      const content: string = 'har-probe-0083-payload-xxxxxxxxxxxxxx';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0083', `written=${written} size=${stat.size}`);
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
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0084.dat';
      const content: string = 'har-probe-0084-payload-xxxxxxxxxxxxxxx';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0084', `written=${written} size=${stat.size}`);
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
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0085
     * @tc.name      testFileIo0085
     * @tc.desc      File IO write and read cycle 85 preserves 0 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileIo0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0085.dat';
      const content: string = '';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0085', `written=${written} size=${stat.size}`);
        expect(written).assertEqual(0);
        expect(text).assertEqual(content);
        expect(stat.size).assertEqual(0);
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
      const path: string = ctx.filesDir + '/probe_0086.dat';
      const content: string = 'har-probe-0086-payload-xxxxxxxxxxxxxxxxx';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0086', `written=${written} size=${stat.size}`);
        expect(written).assertEqual(40);
        expect(text).assertEqual(content);
        expect(stat.size).assertEqual(40);
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
     * @tc.number    SUB_HARPACKAGE_FILEIO_0087
     * @tc.name      testFileIo0087
     * @tc.desc      File IO write and read cycle 87 preserves 41 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileIo0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0087.dat';
      const content: string = 'har-probe-0087-payload-xxxxxxxxxxxxxxxxxx';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0087', `written=${written} size=${stat.size}`);
        expect(written).assertEqual(41);
        expect(text).assertEqual(content);
        expect(stat.size).assertEqual(41);
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
      const path: string = ctx.filesDir + '/probe_0088.dat';
      const content: string = 'har-probe-0088-payload-xxxxxxxxxxxxxxxxxxx';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0088', `written=${written} size=${stat.size}`);
        expect(written).assertEqual(42);
        expect(text).assertEqual(content);
        expect(stat.size).assertEqual(42);
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
     * @tc.number    SUB_HARPACKAGE_FILEIO_0089
     * @tc.name      testFileIo0089
     * @tc.desc      File IO write and read cycle 89 preserves 43 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileIo0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0089.dat';
      const content: string = 'har-probe-0089-payload-xxxxxxxxxxxxxxxxxxxx';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0089', `written=${written} size=${stat.size}`);
        expect(written).assertEqual(43);
        expect(text).assertEqual(content);
        expect(stat.size).assertEqual(43);
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
      const path: string = ctx.filesDir + '/probe_0090.dat';
      const content: string = 'har-probe-0090-payload-xxxxxxxxxxxxxxxxxxxxx';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0090', `written=${written} size=${stat.size}`);
        expect(written).assertEqual(44);
        expect(text).assertEqual(content);
        expect(stat.size).assertEqual(44);
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
     * @tc.number    SUB_HARPACKAGE_FILEIO_0091
     * @tc.name      testFileIo0091
     * @tc.desc      File IO write and read cycle 91 preserves 45 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileIo0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0091.dat';
      const content: string = 'har-probe-0091-payload-xxxxxxxxxxxxxxxxxxxxxx';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0091', `written=${written} size=${stat.size}`);
        expect(written).assertEqual(45);
        expect(text).assertEqual(content);
        expect(stat.size).assertEqual(45);
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
      const path: string = ctx.filesDir + '/probe_0092.dat';
      const content: string = 'har-probe-0092-payload-';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0092', `written=${written} size=${stat.size}`);
        expect(written).assertEqual(23);
        expect(text).assertEqual(content);
        expect(stat.size).assertEqual(23);
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
     * @tc.number    SUB_HARPACKAGE_FILEIO_0093
     * @tc.name      testFileIo0093
     * @tc.desc      File IO write and read cycle 93 preserves 24 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileIo0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0093.dat';
      const content: string = 'har-probe-0093-payload-x';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0093', `written=${written} size=${stat.size}`);
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
      const path: string = ctx.filesDir + '/probe_0094.dat';
      const content: string = 'har-probe-0094-payload-xx';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0094', `written=${written} size=${stat.size}`);
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
     * @tc.number    SUB_HARPACKAGE_FILEIO_0095
     * @tc.name      testFileIo0095
     * @tc.desc      File IO write and read cycle 95 preserves 26 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileIo0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0095.dat';
      const content: string = 'har-probe-0095-payload-xxx';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0095', `written=${written} size=${stat.size}`);
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
      const path: string = ctx.filesDir + '/probe_0096.dat';
      const content: string = 'har-probe-0096-payload-xxxx';
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        const text: string = fs.readTextSync(path);
        const stat: fs.Stat = fs.statSync(path);
        logCase('testFileIo0096', `written=${written} size=${stat.size}`);
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
     * @tc.number    SUB_HARPACKAGE_FILEIO_0097
     * @tc.name      testFileIo0097
     * @tc.desc      File IO append flow 97 doubles the payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileIo0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0097.dat';
      const content: string = 'har-probe-0097-payload-xxxxx';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0097', `len=${text.length}`);
        expect(text).assertEqual(content + content);
        expect(text.length).assertEqual(56);
        expect(fs.statSync(path).size).assertEqual(56);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0098.dat';
      const content: string = 'har-probe-0098-payload-xxxxxx';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0098', `len=${text.length}`);
        expect(text).assertEqual(content + content);
        expect(text.length).assertEqual(58);
        expect(fs.statSync(path).size).assertEqual(58);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0099
     * @tc.name      testFileIo0099
     * @tc.desc      File IO append flow 99 doubles the payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileIo0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0099.dat';
      const content: string = 'har-probe-0099-payload-xxxxxxx';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0099', `len=${text.length}`);
        expect(text).assertEqual(content + content);
        expect(text.length).assertEqual(60);
        expect(fs.statSync(path).size).assertEqual(60);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0100.dat';
      const content: string = 'har-probe-0100-payload-xxxxxxxx';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0100', `len=${text.length}`);
        expect(text).assertEqual(content + content);
        expect(text.length).assertEqual(62);
        expect(fs.statSync(path).size).assertEqual(62);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0101
     * @tc.name      testFileIo0101
     * @tc.desc      File IO append flow 101 doubles the payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileIo0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0101.dat';
      const content: string = 'har-probe-0101-payload-xxxxxxxxx';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0101', `len=${text.length}`);
        expect(text).assertEqual(content + content);
        expect(text.length).assertEqual(64);
        expect(fs.statSync(path).size).assertEqual(64);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0102.dat';
      const content: string = '';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0102', `len=${text.length}`);
        expect(text).assertEqual(content + content);
        expect(text.length).assertEqual(0);
        expect(fs.statSync(path).size).assertEqual(0);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0103
     * @tc.name      testFileIo0103
     * @tc.desc      File IO append flow 103 doubles the payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileIo0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0103.dat';
      const content: string = 'har-probe-0103-payload-xxxxxxxxxxx';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0103', `len=${text.length}`);
        expect(text).assertEqual(content + content);
        expect(text.length).assertEqual(68);
        expect(fs.statSync(path).size).assertEqual(68);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0104.dat';
      const content: string = 'har-probe-0104-payload-xxxxxxxxxxxx';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0104', `len=${text.length}`);
        expect(text).assertEqual(content + content);
        expect(text.length).assertEqual(70);
        expect(fs.statSync(path).size).assertEqual(70);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0105
     * @tc.name      testFileIo0105
     * @tc.desc      File IO append flow 105 doubles the payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileIo0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0105.dat';
      const content: string = 'har-probe-0105-payload-xxxxxxxxxxxxx';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0105', `len=${text.length}`);
        expect(text).assertEqual(content + content);
        expect(text.length).assertEqual(72);
        expect(fs.statSync(path).size).assertEqual(72);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0106.dat';
      const content: string = 'har-probe-0106-payload-xxxxxxxxxxxxxx';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0106', `len=${text.length}`);
        expect(text).assertEqual(content + content);
        expect(text.length).assertEqual(74);
        expect(fs.statSync(path).size).assertEqual(74);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0107
     * @tc.name      testFileIo0107
     * @tc.desc      File IO append flow 107 doubles the payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileIo0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0107.dat';
      const content: string = 'har-probe-0107-payload-xxxxxxxxxxxxxxx';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0107', `len=${text.length}`);
        expect(text).assertEqual(content + content);
        expect(text.length).assertEqual(76);
        expect(fs.statSync(path).size).assertEqual(76);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0108.dat';
      const content: string = 'har-probe-0108-payload-xxxxxxxxxxxxxxxx';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0108', `len=${text.length}`);
        expect(text).assertEqual(content + content);
        expect(text.length).assertEqual(78);
        expect(fs.statSync(path).size).assertEqual(78);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0109
     * @tc.name      testFileIo0109
     * @tc.desc      File IO append flow 109 doubles the payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileIo0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0109.dat';
      const content: string = 'har-probe-0109-payload-xxxxxxxxxxxxxxxxx';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0109', `len=${text.length}`);
        expect(text).assertEqual(content + content);
        expect(text.length).assertEqual(80);
        expect(fs.statSync(path).size).assertEqual(80);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0110.dat';
      const content: string = 'har-probe-0110-payload-xxxxxxxxxxxxxxxxxx';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0110', `len=${text.length}`);
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
     * @tc.number    SUB_HARPACKAGE_FILEIO_0111
     * @tc.name      testFileIo0111
     * @tc.desc      File IO append flow 111 doubles the payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileIo0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0111.dat';
      const content: string = 'har-probe-0111-payload-xxxxxxxxxxxxxxxxxxx';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0111', `len=${text.length}`);
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
      const path: string = ctx.filesDir + '/probe_0112.dat';
      const content: string = 'har-probe-0112-payload-xxxxxxxxxxxxxxxxxxxx';
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.WRITE_ONLY | fs.OpenMode.APPEND);
        fs.writeSync(second.fd, content);
        fs.closeSync(second);
        const text: string = fs.readTextSync(path);
        logCase('testFileIo0112', `len=${text.length}`);
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
     * @tc.number    SUB_HARPACKAGE_FILEIO_0113
     * @tc.name      testFileIo0113
     * @tc.desc      File IO rename flow 113 keeps payload after relocation
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileIo0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0113.dat';
      const content: string = 'har-probe-0113-payload-xxxxxxxxxxxxxxxxxxxxx';
      try {
        const moved: string = ctx.filesDir + '/probe_0113_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0113', `renamed=${text.length}`);
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
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0114.dat';
      const content: string = 'har-probe-0114-payload-xxxxxxxxxxxxxxxxxxxxxx';
      try {
        const moved: string = ctx.filesDir + '/probe_0114_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0114', `renamed=${text.length}`);
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
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0115
     * @tc.name      testFileIo0115
     * @tc.desc      File IO rename flow 115 keeps payload after relocation
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileIo0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0115.dat';
      const content: string = 'har-probe-0115-payload-';
      try {
        const moved: string = ctx.filesDir + '/probe_0115_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0115', `renamed=${text.length}`);
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
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0116.dat';
      const content: string = 'har-probe-0116-payload-x';
      try {
        const moved: string = ctx.filesDir + '/probe_0116_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0116', `renamed=${text.length}`);
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
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0117
     * @tc.name      testFileIo0117
     * @tc.desc      File IO rename flow 117 keeps payload after relocation
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileIo0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0117.dat';
      const content: string = 'har-probe-0117-payload-xx';
      try {
        const moved: string = ctx.filesDir + '/probe_0117_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0117', `renamed=${text.length}`);
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
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0118.dat';
      const content: string = 'har-probe-0118-payload-xxx';
      try {
        const moved: string = ctx.filesDir + '/probe_0118_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0118', `renamed=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(moved)).assertTrue();
        expect(fs.statSync(moved).size).assertEqual(26);
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
     * @tc.number    SUB_HARPACKAGE_FILEIO_0119
     * @tc.name      testFileIo0119
     * @tc.desc      File IO rename flow 119 keeps payload after relocation
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileIo0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0119.dat';
      const content: string = '';
      try {
        const moved: string = ctx.filesDir + '/probe_0119_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0119', `renamed=${text.length}`);
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
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0120.dat';
      const content: string = 'har-probe-0120-payload-xxxxx';
      try {
        const moved: string = ctx.filesDir + '/probe_0120_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0120', `renamed=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(moved)).assertTrue();
        expect(fs.statSync(moved).size).assertEqual(28);
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
     * @tc.number    SUB_HARPACKAGE_FILEIO_0121
     * @tc.name      testFileIo0121
     * @tc.desc      File IO rename flow 121 keeps payload after relocation
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileIo0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0121.dat';
      const content: string = 'har-probe-0121-payload-xxxxxx';
      try {
        const moved: string = ctx.filesDir + '/probe_0121_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0121', `renamed=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(moved)).assertTrue();
        expect(fs.statSync(moved).size).assertEqual(29);
        fs.unlinkSync(moved);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0122.dat';
      const content: string = 'har-probe-0122-payload-xxxxxxx';
      try {
        const moved: string = ctx.filesDir + '/probe_0122_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0122', `renamed=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(moved)).assertTrue();
        expect(fs.statSync(moved).size).assertEqual(30);
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
     * @tc.number    SUB_HARPACKAGE_FILEIO_0123
     * @tc.name      testFileIo0123
     * @tc.desc      File IO rename flow 123 keeps payload after relocation
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileIo0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0123.dat';
      const content: string = 'har-probe-0123-payload-xxxxxxxx';
      try {
        const moved: string = ctx.filesDir + '/probe_0123_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0123', `renamed=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(moved)).assertTrue();
        expect(fs.statSync(moved).size).assertEqual(31);
        fs.unlinkSync(moved);
      } finally {
        if (fs.accessSync(path)) {
          fs.unlinkSync(path);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0124.dat';
      const content: string = 'har-probe-0124-payload-xxxxxxxxx';
      try {
        const moved: string = ctx.filesDir + '/probe_0124_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0124', `renamed=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(moved)).assertTrue();
        expect(fs.statSync(moved).size).assertEqual(32);
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
     * @tc.number    SUB_HARPACKAGE_FILEIO_0125
     * @tc.name      testFileIo0125
     * @tc.desc      File IO rename flow 125 keeps payload after relocation
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileIo0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0125.dat';
      const content: string = 'har-probe-0125-payload-xxxxxxxxxx';
      try {
        const moved: string = ctx.filesDir + '/probe_0125_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0125', `renamed=${text.length}`);
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
      const path: string = ctx.filesDir + '/probe_0126.dat';
      const content: string = 'har-probe-0126-payload-xxxxxxxxxxx';
      try {
        const moved: string = ctx.filesDir + '/probe_0126_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0126', `renamed=${text.length}`);
        expect(text).assertEqual(content);
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(moved)).assertTrue();
        expect(fs.statSync(moved).size).assertEqual(34);
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
     * @tc.number    SUB_HARPACKAGE_FILEIO_0127
     * @tc.name      testFileIo0127
     * @tc.desc      File IO rename flow 127 keeps payload after relocation
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileIo0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0127.dat';
      const content: string = 'har-probe-0127-payload-xxxxxxxxxxxx';
      try {
        const moved: string = ctx.filesDir + '/probe_0127_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0127', `renamed=${text.length}`);
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
      const path: string = ctx.filesDir + '/probe_0128.dat';
      const content: string = 'har-probe-0128-payload-xxxxxxxxxxxxx';
      try {
        const moved: string = ctx.filesDir + '/probe_0128_moved.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.renameSync(path, moved);
        const text: string = fs.readTextSync(moved);
        logCase('testFileIo0128', `renamed=${text.length}`);
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
     * @tc.number    SUB_HARPACKAGE_FILEIO_0129
     * @tc.name      testFileIo0129
     * @tc.desc      File IO copy flow 129 duplicates 37 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileIo0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0129.dat';
      const content: string = 'har-probe-0129-payload-xxxxxxxxxxxxxx';
      try {
        const copyPath: string = ctx.filesDir + '/probe_0129_copy.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.copyFileSync(path, copyPath);
        const sourceText: string = fs.readTextSync(path);
        const copyText: string = fs.readTextSync(copyPath);
        logCase('testFileIo0129', `copy=${copyText.length}`);
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
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0130.dat';
      const content: string = 'har-probe-0130-payload-xxxxxxxxxxxxxxx';
      try {
        const copyPath: string = ctx.filesDir + '/probe_0130_copy.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.copyFileSync(path, copyPath);
        const sourceText: string = fs.readTextSync(path);
        const copyText: string = fs.readTextSync(copyPath);
        logCase('testFileIo0130', `copy=${copyText.length}`);
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
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0131
     * @tc.name      testFileIo0131
     * @tc.desc      File IO copy flow 131 duplicates 39 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileIo0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0131.dat';
      const content: string = 'har-probe-0131-payload-xxxxxxxxxxxxxxxx';
      try {
        const copyPath: string = ctx.filesDir + '/probe_0131_copy.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.copyFileSync(path, copyPath);
        const sourceText: string = fs.readTextSync(path);
        const copyText: string = fs.readTextSync(copyPath);
        logCase('testFileIo0131', `copy=${copyText.length}`);
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
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0132.dat';
      const content: string = 'har-probe-0132-payload-xxxxxxxxxxxxxxxxx';
      try {
        const copyPath: string = ctx.filesDir + '/probe_0132_copy.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.copyFileSync(path, copyPath);
        const sourceText: string = fs.readTextSync(path);
        const copyText: string = fs.readTextSync(copyPath);
        logCase('testFileIo0132', `copy=${copyText.length}`);
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
      }
    })
    /**
     * @tc.number    SUB_HARPACKAGE_FILEIO_0133
     * @tc.name      testFileIo0133
     * @tc.desc      File IO copy flow 133 duplicates 41 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileIo0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0133.dat';
      const content: string = 'har-probe-0133-payload-xxxxxxxxxxxxxxxxxx';
      try {
        const copyPath: string = ctx.filesDir + '/probe_0133_copy.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.copyFileSync(path, copyPath);
        const sourceText: string = fs.readTextSync(path);
        const copyText: string = fs.readTextSync(copyPath);
        logCase('testFileIo0133', `copy=${copyText.length}`);
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
      {
      const ctx: common.Context = entryContext();
      const path: string = ctx.filesDir + '/probe_0134.dat';
      const content: string = 'har-probe-0134-payload-xxxxxxxxxxxxxxxxxxx';
      try {
        const copyPath: string = ctx.filesDir + '/probe_0134_copy.dat';
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(file.fd, content);
        fs.closeSync(file);
        fs.copyFileSync(path, copyPath);
        const sourceText: string = fs.readTextSync(path);
        const copyText: string = fs.readTextSync(copyPath);
        logCase('testFileIo0134', `copy=${copyText.length}`);
        expect(copyText).assertEqual(sourceText);
        expect(copyText).assertEqual(content);
        expect(fs.statSync(copyPath).size).assertEqual(42);
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
     * @tc.number    SUB_HARPACKAGE_FILEIO_0135
     * @tc.name      testFileIo0135
