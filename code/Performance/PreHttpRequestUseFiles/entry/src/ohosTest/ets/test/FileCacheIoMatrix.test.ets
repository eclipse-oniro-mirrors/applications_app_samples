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
import { appContext, dirPath, testPath, writeText } from './shared/Probe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

export default function fileCacheIoMatrixTest() {
  describe('FileCacheIoMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0001
     * @tc.name      testFileCache0001
     * @tc.desc      Write then read 14 bytes of cacheitem_0001 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0001.png');
      const content: string = 'payload-0001-q';
      logCase('testFileCache0001', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(14);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(14);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0001.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0001_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0001_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0002
     * @tc.name      testFileCache0002
     * @tc.desc      Write then read 15 bytes of cacheitem_0002 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0002.png');
      const content: string = 'payload-0002-qq';
      logCase('testFileCache0002', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(15);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(15);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0002.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0002_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0002_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0003
     * @tc.name      testFileCache0003
     * @tc.desc      Write then read 16 bytes of cacheitem_0003 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0003.png');
      const content: string = 'payload-0003-qqq';
      logCase('testFileCache0003', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(16);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0003.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0003_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0003_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0004
     * @tc.name      testFileCache0004
     * @tc.desc      Write then read 18 bytes of cacheitem_0004 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0004.png');
      const content: string = 'payload-0004-qqqqr';
      logCase('testFileCache0004', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(18);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0004.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0004_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0004_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0005
     * @tc.name      testFileCache0005
     * @tc.desc      Write then read 19 bytes of cacheitem_0005 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0005.png');
      const content: string = 'payload-0005-qqqqqr';
      logCase('testFileCache0005', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(19);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0005.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0005_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0005_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0006
     * @tc.name      testFileCache0006
     * @tc.desc      Write then read 20 bytes of cacheitem_0006 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0006.png');
      const content: string = 'payload-0006-qqqqqqr';
      logCase('testFileCache0006', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(20);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(20);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0006.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0006_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0006_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0007
     * @tc.name      testFileCache0007
     * @tc.desc      Write then read 14 bytes of cacheitem_0007 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0007.png');
      const content: string = 'payload-0007-r';
      logCase('testFileCache0007', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(14);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(14);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0007.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0007_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0007_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0008
     * @tc.name      testFileCache0008
     * @tc.desc      Write then read 16 bytes of cacheitem_0008 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0008.png');
      const content: string = 'payload-0008-qrr';
      logCase('testFileCache0008', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(16);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0008.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0008_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0008_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0009
     * @tc.name      testFileCache0009
     * @tc.desc      Write then read 17 bytes of cacheitem_0009 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0009.png');
      const content: string = 'payload-0009-qqrr';
      logCase('testFileCache0009', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(17);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(17);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0009.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0009_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0009_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0010
     * @tc.name      testFileCache0010
     * @tc.desc      Write then read 18 bytes of cacheitem_0010 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0010.png');
      const content: string = 'payload-0010-qqqrr';
      logCase('testFileCache0010', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(18);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0010.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0010_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0010_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0011
     * @tc.name      testFileCache0011
     * @tc.desc      Write then read 19 bytes of cacheitem_0011 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0011.png');
      const content: string = 'payload-0011-qqqqrr';
      logCase('testFileCache0011', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(19);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0011.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0011_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0011_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0012
     * @tc.name      testFileCache0012
     * @tc.desc      Write then read 21 bytes of cacheitem_0012 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0012.png');
      const content: string = 'payload-0012-qqqqqrrr';
      logCase('testFileCache0012', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(21);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(21);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0012.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0012_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0012_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0013
     * @tc.name      testFileCache0013
     * @tc.desc      Write then read 22 bytes of cacheitem_0013 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0013.png');
      const content: string = 'payload-0013-qqqqqqrrr';
      logCase('testFileCache0013', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(22);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(22);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0013.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0013_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0013_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0014
     * @tc.name      testFileCache0014
     * @tc.desc      Write then read 16 bytes of cacheitem_0014 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0014.png');
      const content: string = 'payload-0014-rrr';
      logCase('testFileCache0014', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(16);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0014.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0014_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0014_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0015
     * @tc.name      testFileCache0015
     * @tc.desc      Write then read 17 bytes of cacheitem_0015 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0015.png');
      const content: string = 'payload-0015-qrrr';
      logCase('testFileCache0015', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(17);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(17);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0015.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0015_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0015_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0016
     * @tc.name      testFileCache0016
     * @tc.desc      Write then read 15 bytes of cacheitem_0016 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0016.png');
      const content: string = 'payload-0016-qq';
      logCase('testFileCache0016', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(15);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(15);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0016.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0016_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0016_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0017
     * @tc.name      testFileCache0017
     * @tc.desc      Write then read 16 bytes of cacheitem_0017 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0017.png');
      const content: string = 'payload-0017-qqq';
      logCase('testFileCache0017', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(16);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0017.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0017_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0017_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0018
     * @tc.name      testFileCache0018
     * @tc.desc      Write then read 17 bytes of cacheitem_0018 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0018.png');
      const content: string = 'payload-0018-qqqq';
      logCase('testFileCache0018', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(17);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(17);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0018.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0018_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0018_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0019
     * @tc.name      testFileCache0019
     * @tc.desc      Write then read 18 bytes of cacheitem_0019 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0019.png');
      const content: string = 'payload-0019-qqqqq';
      logCase('testFileCache0019', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(18);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0019.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0019_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0019_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0020
     * @tc.name      testFileCache0020
     * @tc.desc      Write then read 20 bytes of cacheitem_0020 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0020.png');
      const content: string = 'payload-0020-qqqqqqr';
      logCase('testFileCache0020', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(20);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(20);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0020.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0020_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0020_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0021
     * @tc.name      testFileCache0021
     * @tc.desc      Write then read 14 bytes of cacheitem_0021 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0021.png');
      const content: string = 'payload-0021-r';
      logCase('testFileCache0021', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(14);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(14);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0021.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0021_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0021_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0022
     * @tc.name      testFileCache0022
     * @tc.desc      Write then read 15 bytes of cacheitem_0022 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0022.png');
      const content: string = 'payload-0022-qr';
      logCase('testFileCache0022', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(15);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(15);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0022.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0022_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0022_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0023
     * @tc.name      testFileCache0023
     * @tc.desc      Write then read 16 bytes of cacheitem_0023 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0023.png');
      const content: string = 'payload-0023-qqr';
      logCase('testFileCache0023', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(16);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0023.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0023_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0023_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0024
     * @tc.name      testFileCache0024
     * @tc.desc      Write then read 18 bytes of cacheitem_0024 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0024.png');
      const content: string = 'payload-0024-qqqrr';
      logCase('testFileCache0024', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(18);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0024.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0024_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0024_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0025
     * @tc.name      testFileCache0025
     * @tc.desc      Write then read 19 bytes of cacheitem_0025 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0025.png');
      const content: string = 'payload-0025-qqqqrr';
      logCase('testFileCache0025', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(19);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0025.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0025_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0025_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0026
     * @tc.name      testFileCache0026
     * @tc.desc      Write then read 20 bytes of cacheitem_0026 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0026.png');
      const content: string = 'payload-0026-qqqqqrr';
      logCase('testFileCache0026', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(20);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(20);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0026.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0026_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0026_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0027
     * @tc.name      testFileCache0027
     * @tc.desc      Write then read 21 bytes of cacheitem_0027 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0027.png');
      const content: string = 'payload-0027-qqqqqqrr';
      logCase('testFileCache0027', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(21);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(21);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0027.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0027_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0027_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0028
     * @tc.name      testFileCache0028
     * @tc.desc      Write then read 16 bytes of cacheitem_0028 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0028.png');
      const content: string = 'payload-0028-rrr';
      logCase('testFileCache0028', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(16);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0028.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0028_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0028_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0029
     * @tc.name      testFileCache0029
     * @tc.desc      Write then read 17 bytes of cacheitem_0029 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0029.png');
      const content: string = 'payload-0029-qrrr';
      logCase('testFileCache0029', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(17);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(17);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0029.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0029_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0029_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0030
     * @tc.name      testFileCache0030
     * @tc.desc      Write then read 18 bytes of cacheitem_0030 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0030.png');
      const content: string = 'payload-0030-qqrrr';
      logCase('testFileCache0030', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(18);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0030.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0030_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0030_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0031
     * @tc.name      testFileCache0031
     * @tc.desc      Write then read 19 bytes of cacheitem_0031 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0031.png');
      const content: string = 'payload-0031-qqqrrr';
      logCase('testFileCache0031', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(19);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0031.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0031_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0031_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0032
     * @tc.name      testFileCache0032
     * @tc.desc      Write then read 17 bytes of cacheitem_0032 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0032.png');
      const content: string = 'payload-0032-qqqq';
      logCase('testFileCache0032', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(17);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(17);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0032.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0032_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0032_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0033
     * @tc.name      testFileCache0033
     * @tc.desc      Write then read 18 bytes of cacheitem_0033 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0033.png');
      const content: string = 'payload-0033-qqqqq';
      logCase('testFileCache0033', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(18);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0033.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0033_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0033_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0034
     * @tc.name      testFileCache0034
     * @tc.desc      Write then read 19 bytes of cacheitem_0034 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0034.png');
      const content: string = 'payload-0034-qqqqqq';
      logCase('testFileCache0034', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(19);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0034.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0034_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0034_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0035
     * @tc.name      testFileCache0035
     * @tc.desc      Write then read 13 bytes of cacheitem_0035 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0035.png');
      const content: string = 'payload-0035-';
      logCase('testFileCache0035', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(13);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(13);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0035.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0035_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0035_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0036
     * @tc.name      testFileCache0036
     * @tc.desc      Write then read 15 bytes of cacheitem_0036 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0036.png');
      const content: string = 'payload-0036-qr';
      logCase('testFileCache0036', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(15);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(15);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0036.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0036_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0036_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0037
     * @tc.name      testFileCache0037
     * @tc.desc      Write then read 16 bytes of cacheitem_0037 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0037.png');
      const content: string = 'payload-0037-qqr';
      logCase('testFileCache0037', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(16);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0037.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0037_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0037_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0038
     * @tc.name      testFileCache0038
     * @tc.desc      Write then read 17 bytes of cacheitem_0038 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0038.png');
      const content: string = 'payload-0038-qqqr';
      logCase('testFileCache0038', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(17);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(17);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0038.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0038_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0038_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0039
     * @tc.name      testFileCache0039
     * @tc.desc      Write then read 18 bytes of cacheitem_0039 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0039.png');
      const content: string = 'payload-0039-qqqqr';
      logCase('testFileCache0039', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(18);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0039.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0039_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0039_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0040
     * @tc.name      testFileCache0040
     * @tc.desc      Write then read 20 bytes of cacheitem_0040 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0040.png');
      const content: string = 'payload-0040-qqqqqrr';
      logCase('testFileCache0040', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(20);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(20);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0040.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0040_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0040_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0041
     * @tc.name      testFileCache0041
     * @tc.desc      Write then read 21 bytes of cacheitem_0041 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0041.png');
      const content: string = 'payload-0041-qqqqqqrr';
      logCase('testFileCache0041', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(21);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(21);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0041.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0041_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0041_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0042
     * @tc.name      testFileCache0042
     * @tc.desc      Write then read 15 bytes of cacheitem_0042 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0042.png');
      const content: string = 'payload-0042-rr';
      logCase('testFileCache0042', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(15);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(15);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0042.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0042_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0042_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0043
