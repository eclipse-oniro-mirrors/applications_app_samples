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
     * @tc.name      testFileCache0043
     * @tc.desc      Write then read 16 bytes of cacheitem_0043 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0043.png');
      const content: string = 'payload-0043-qrr';
      logCase('testFileCache0043', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(16);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0043.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0043_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0043_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0044
     * @tc.name      testFileCache0044
     * @tc.desc      Write then read 18 bytes of cacheitem_0044 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0044.png');
      const content: string = 'payload-0044-qqrrr';
      logCase('testFileCache0044', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(18);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0044.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0044_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0044_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0045
     * @tc.name      testFileCache0045
     * @tc.desc      Write then read 19 bytes of cacheitem_0045 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0045.png');
      const content: string = 'payload-0045-qqqrrr';
      logCase('testFileCache0045', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(19);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0045.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0045_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0045_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0046
     * @tc.name      testFileCache0046
     * @tc.desc      Write then read 20 bytes of cacheitem_0046 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0046.png');
      const content: string = 'payload-0046-qqqqrrr';
      logCase('testFileCache0046', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(20);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(20);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0046.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0046_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0046_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0047
     * @tc.name      testFileCache0047
     * @tc.desc      Write then read 21 bytes of cacheitem_0047 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0047.png');
      const content: string = 'payload-0047-qqqqqrrr';
      logCase('testFileCache0047', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(21);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(21);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0047.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0047_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0047_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0048
     * @tc.name      testFileCache0048
     * @tc.desc      Write then read 19 bytes of cacheitem_0048 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0048.png');
      const content: string = 'payload-0048-qqqqqq';
      logCase('testFileCache0048', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(19);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0048.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0048_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0048_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0049
     * @tc.name      testFileCache0049
     * @tc.desc      Write then read 13 bytes of cacheitem_0049 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0049.png');
      const content: string = 'payload-0049-';
      logCase('testFileCache0049', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(13);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(13);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0049.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0049_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0049_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0050
     * @tc.name      testFileCache0050
     * @tc.desc      Write then read 14 bytes of cacheitem_0050 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0050.png');
      const content: string = 'payload-0050-q';
      logCase('testFileCache0050', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(14);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(14);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0050.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0050_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0050_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0051
     * @tc.name      testFileCache0051
     * @tc.desc      Write then read 15 bytes of cacheitem_0051 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0051.png');
      const content: string = 'payload-0051-qq';
      logCase('testFileCache0051', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(15);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(15);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0051.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0051_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0051_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0052
     * @tc.name      testFileCache0052
     * @tc.desc      Write then read 17 bytes of cacheitem_0052 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0052.png');
      const content: string = 'payload-0052-qqqr';
      logCase('testFileCache0052', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(17);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(17);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0052.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0052_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0052_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0053
     * @tc.name      testFileCache0053
     * @tc.desc      Write then read 18 bytes of cacheitem_0053 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0053.png');
      const content: string = 'payload-0053-qqqqr';
      logCase('testFileCache0053', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(18);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0053.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0053_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0053_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0054
     * @tc.name      testFileCache0054
     * @tc.desc      Write then read 19 bytes of cacheitem_0054 in the sandbox
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0054.png');
      const content: string = 'payload-0054-qqqqqr';
      logCase('testFileCache0054', `path=${path} bytes=${content.length}`);
      try {
        const file: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(19);
        expect(fs.statSync(path).isFile()).assertTrue();
        expect(path.endsWith('cacheitem_0054.png')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0054_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0054_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0055
     * @tc.name      testFileCache0055
     * @tc.desc      Append 11 extra bytes after 20 bytes of cacheitem_0055
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0055.jpg');
      const content: string = 'payload-0055-qqqqqqr';
      logCase('testFileCache0055', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0055-');
        fs.closeSync(second);
        expect(added).assertEqual(11);
        expect(fs.statSync(path).size).assertEqual(31);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0055-');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0055_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0055_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0056
     * @tc.name      testFileCache0056
     * @tc.desc      Append 12 extra bytes after 15 bytes of cacheitem_0056
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0056.jpg');
      const content: string = 'payload-0056-rr';
      logCase('testFileCache0056', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0056-s');
        fs.closeSync(second);
        expect(added).assertEqual(12);
        expect(fs.statSync(path).size).assertEqual(27);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0056-s');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0056_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0056_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0057
     * @tc.name      testFileCache0057
     * @tc.desc      Append 13 extra bytes after 16 bytes of cacheitem_0057
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0057.jpg');
      const content: string = 'payload-0057-qrr';
      logCase('testFileCache0057', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0057-ss');
        fs.closeSync(second);
        expect(added).assertEqual(13);
        expect(fs.statSync(path).size).assertEqual(29);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0057-ss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0057_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0057_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0058
     * @tc.name      testFileCache0058
     * @tc.desc      Append 14 extra bytes after 17 bytes of cacheitem_0058
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0058.jpg');
      const content: string = 'payload-0058-qqrr';
      logCase('testFileCache0058', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0058-sss');
        fs.closeSync(second);
        expect(added).assertEqual(14);
        expect(fs.statSync(path).size).assertEqual(31);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0058-sss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0058_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0058_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0059
     * @tc.name      testFileCache0059
     * @tc.desc      Append 15 extra bytes after 18 bytes of cacheitem_0059
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0059.jpg');
      const content: string = 'payload-0059-qqqrr';
      logCase('testFileCache0059', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0059-ssss');
        fs.closeSync(second);
        expect(added).assertEqual(15);
        expect(fs.statSync(path).size).assertEqual(33);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0059-ssss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0059_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0059_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0060
     * @tc.name      testFileCache0060
     * @tc.desc      Append 11 extra bytes after 20 bytes of cacheitem_0060
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0060.jpg');
      const content: string = 'payload-0060-qqqqrrr';
      logCase('testFileCache0060', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0060-');
        fs.closeSync(second);
        expect(added).assertEqual(11);
        expect(fs.statSync(path).size).assertEqual(31);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0060-');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0060_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0060_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0061
     * @tc.name      testFileCache0061
     * @tc.desc      Append 12 extra bytes after 21 bytes of cacheitem_0061
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0061.jpg');
      const content: string = 'payload-0061-qqqqqrrr';
      logCase('testFileCache0061', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0061-s');
        fs.closeSync(second);
        expect(added).assertEqual(12);
        expect(fs.statSync(path).size).assertEqual(33);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0061-s');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0061_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0061_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0062
     * @tc.name      testFileCache0062
     * @tc.desc      Append 13 extra bytes after 22 bytes of cacheitem_0062
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0062.jpg');
      const content: string = 'payload-0062-qqqqqqrrr';
      logCase('testFileCache0062', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0062-ss');
        fs.closeSync(second);
        expect(added).assertEqual(13);
        expect(fs.statSync(path).size).assertEqual(35);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0062-ss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0062_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0062_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0063
     * @tc.name      testFileCache0063
     * @tc.desc      Append 14 extra bytes after 16 bytes of cacheitem_0063
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0063.jpg');
      const content: string = 'payload-0063-rrr';
      logCase('testFileCache0063', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0063-sss');
        fs.closeSync(second);
        expect(added).assertEqual(14);
        expect(fs.statSync(path).size).assertEqual(30);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0063-sss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0063_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0063_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0064
     * @tc.name      testFileCache0064
     * @tc.desc      Append 15 extra bytes after 14 bytes of cacheitem_0064
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0064.jpg');
      const content: string = 'payload-0064-q';
      logCase('testFileCache0064', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0064-ssss');
        fs.closeSync(second);
        expect(added).assertEqual(15);
        expect(fs.statSync(path).size).assertEqual(29);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0064-ssss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0064_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0064_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0065
     * @tc.name      testFileCache0065
     * @tc.desc      Append 11 extra bytes after 15 bytes of cacheitem_0065
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0065.jpg');
      const content: string = 'payload-0065-qq';
      logCase('testFileCache0065', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0065-');
        fs.closeSync(second);
        expect(added).assertEqual(11);
        expect(fs.statSync(path).size).assertEqual(26);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0065-');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0065_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0065_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0066
     * @tc.name      testFileCache0066
     * @tc.desc      Append 12 extra bytes after 16 bytes of cacheitem_0066
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0066.jpg');
      const content: string = 'payload-0066-qqq';
      logCase('testFileCache0066', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0066-s');
        fs.closeSync(second);
        expect(added).assertEqual(12);
        expect(fs.statSync(path).size).assertEqual(28);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0066-s');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0066_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0066_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0067
     * @tc.name      testFileCache0067
     * @tc.desc      Append 13 extra bytes after 17 bytes of cacheitem_0067
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0067.jpg');
      const content: string = 'payload-0067-qqqq';
      logCase('testFileCache0067', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0067-ss');
        fs.closeSync(second);
        expect(added).assertEqual(13);
        expect(fs.statSync(path).size).assertEqual(30);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0067-ss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0067_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0067_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0068
     * @tc.name      testFileCache0068
     * @tc.desc      Append 14 extra bytes after 19 bytes of cacheitem_0068
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0068.jpg');
      const content: string = 'payload-0068-qqqqqr';
      logCase('testFileCache0068', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0068-sss');
        fs.closeSync(second);
        expect(added).assertEqual(14);
        expect(fs.statSync(path).size).assertEqual(33);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0068-sss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0068_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0068_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0069
     * @tc.name      testFileCache0069
     * @tc.desc      Append 15 extra bytes after 20 bytes of cacheitem_0069
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0069.jpg');
      const content: string = 'payload-0069-qqqqqqr';
      logCase('testFileCache0069', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0069-ssss');
        fs.closeSync(second);
        expect(added).assertEqual(15);
        expect(fs.statSync(path).size).assertEqual(35);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0069-ssss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0069_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0069_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0070
     * @tc.name      testFileCache0070
     * @tc.desc      Append 11 extra bytes after 14 bytes of cacheitem_0070
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0070.jpg');
      const content: string = 'payload-0070-r';
      logCase('testFileCache0070', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0070-');
        fs.closeSync(second);
        expect(added).assertEqual(11);
        expect(fs.statSync(path).size).assertEqual(25);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0070-');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0070_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0070_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0071
     * @tc.name      testFileCache0071
     * @tc.desc      Append 12 extra bytes after 15 bytes of cacheitem_0071
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0071.jpg');
      const content: string = 'payload-0071-qr';
      logCase('testFileCache0071', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0071-s');
        fs.closeSync(second);
        expect(added).assertEqual(12);
        expect(fs.statSync(path).size).assertEqual(27);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0071-s');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0071_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0071_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0072
     * @tc.name      testFileCache0072
     * @tc.desc      Append 13 extra bytes after 17 bytes of cacheitem_0072
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0072.jpg');
      const content: string = 'payload-0072-qqrr';
      logCase('testFileCache0072', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0072-ss');
        fs.closeSync(second);
        expect(added).assertEqual(13);
        expect(fs.statSync(path).size).assertEqual(30);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0072-ss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0072_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0072_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0073
     * @tc.name      testFileCache0073
     * @tc.desc      Append 14 extra bytes after 18 bytes of cacheitem_0073
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0073.jpg');
      const content: string = 'payload-0073-qqqrr';
      logCase('testFileCache0073', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0073-sss');
        fs.closeSync(second);
        expect(added).assertEqual(14);
        expect(fs.statSync(path).size).assertEqual(32);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0073-sss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0073_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0073_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0074
     * @tc.name      testFileCache0074
     * @tc.desc      Append 15 extra bytes after 19 bytes of cacheitem_0074
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0074.jpg');
      const content: string = 'payload-0074-qqqqrr';
      logCase('testFileCache0074', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0074-ssss');
        fs.closeSync(second);
        expect(added).assertEqual(15);
        expect(fs.statSync(path).size).assertEqual(34);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0074-ssss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0074_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0074_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0075
     * @tc.name      testFileCache0075
     * @tc.desc      Append 11 extra bytes after 20 bytes of cacheitem_0075
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0075.jpg');
      const content: string = 'payload-0075-qqqqqrr';
      logCase('testFileCache0075', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0075-');
        fs.closeSync(second);
        expect(added).assertEqual(11);
        expect(fs.statSync(path).size).assertEqual(31);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0075-');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0075_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0075_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0076
     * @tc.name      testFileCache0076
     * @tc.desc      Append 12 extra bytes after 22 bytes of cacheitem_0076
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0076.jpg');
      const content: string = 'payload-0076-qqqqqqrrr';
      logCase('testFileCache0076', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0076-s');
        fs.closeSync(second);
        expect(added).assertEqual(12);
        expect(fs.statSync(path).size).assertEqual(34);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0076-s');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0076_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0076_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0077
     * @tc.name      testFileCache0077
     * @tc.desc      Append 13 extra bytes after 16 bytes of cacheitem_0077
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0077.jpg');
      const content: string = 'payload-0077-rrr';
      logCase('testFileCache0077', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0077-ss');
        fs.closeSync(second);
        expect(added).assertEqual(13);
        expect(fs.statSync(path).size).assertEqual(29);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0077-ss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0077_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0077_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0078
     * @tc.name      testFileCache0078
     * @tc.desc      Append 14 extra bytes after 17 bytes of cacheitem_0078
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0078.jpg');
      const content: string = 'payload-0078-qrrr';
      logCase('testFileCache0078', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0078-sss');
        fs.closeSync(second);
        expect(added).assertEqual(14);
        expect(fs.statSync(path).size).assertEqual(31);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0078-sss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0078_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0078_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0079
     * @tc.name      testFileCache0079
     * @tc.desc      Append 15 extra bytes after 18 bytes of cacheitem_0079
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0079.jpg');
      const content: string = 'payload-0079-qqrrr';
      logCase('testFileCache0079', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0079-ssss');
        fs.closeSync(second);
        expect(added).assertEqual(15);
        expect(fs.statSync(path).size).assertEqual(33);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0079-ssss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0079_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0079_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0080
     * @tc.name      testFileCache0080
     * @tc.desc      Append 11 extra bytes after 16 bytes of cacheitem_0080
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0080.jpg');
      const content: string = 'payload-0080-qqq';
      logCase('testFileCache0080', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0080-');
        fs.closeSync(second);
        expect(added).assertEqual(11);
        expect(fs.statSync(path).size).assertEqual(27);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0080-');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0080_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0080_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0081
     * @tc.name      testFileCache0081
     * @tc.desc      Append 12 extra bytes after 17 bytes of cacheitem_0081
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0081.jpg');
      const content: string = 'payload-0081-qqqq';
      logCase('testFileCache0081', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0081-s');
        fs.closeSync(second);
        expect(added).assertEqual(12);
        expect(fs.statSync(path).size).assertEqual(29);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0081-s');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0081_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0081_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0082
     * @tc.name      testFileCache0082
     * @tc.desc      Append 13 extra bytes after 18 bytes of cacheitem_0082
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0082.jpg');
      const content: string = 'payload-0082-qqqqq';
      logCase('testFileCache0082', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0082-ss');
        fs.closeSync(second);
        expect(added).assertEqual(13);
        expect(fs.statSync(path).size).assertEqual(31);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0082-ss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0082_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0082_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0083
     * @tc.name      testFileCache0083
     * @tc.desc      Append 14 extra bytes after 19 bytes of cacheitem_0083
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0083.jpg');
      const content: string = 'payload-0083-qqqqqq';
      logCase('testFileCache0083', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0083-sss');
        fs.closeSync(second);
        expect(added).assertEqual(14);
        expect(fs.statSync(path).size).assertEqual(33);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0083-sss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0083_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0083_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0084
     * @tc.name      testFileCache0084
     * @tc.desc      Append 15 extra bytes after 14 bytes of cacheitem_0084
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0084.jpg');
      const content: string = 'payload-0084-r';
      logCase('testFileCache0084', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0084-ssss');
        fs.closeSync(second);
        expect(added).assertEqual(15);
        expect(fs.statSync(path).size).assertEqual(29);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0084-ssss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0084_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0084_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0085
     * @tc.name      testFileCache0085
     * @tc.desc      Append 11 extra bytes after 15 bytes of cacheitem_0085
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0085.jpg');
      const content: string = 'payload-0085-qr';
      logCase('testFileCache0085', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0085-');
        fs.closeSync(second);
        expect(added).assertEqual(11);
        expect(fs.statSync(path).size).assertEqual(26);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0085-');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0085_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0085_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0086
     * @tc.name      testFileCache0086
     * @tc.desc      Append 12 extra bytes after 16 bytes of cacheitem_0086
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0086.jpg');
      const content: string = 'payload-0086-qqr';
      logCase('testFileCache0086', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0086-s');
        fs.closeSync(second);
        expect(added).assertEqual(12);
        expect(fs.statSync(path).size).assertEqual(28);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0086-s');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0086_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0086_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0087
     * @tc.name      testFileCache0087
     * @tc.desc      Append 13 extra bytes after 17 bytes of cacheitem_0087
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0087.jpg');
      const content: string = 'payload-0087-qqqr';
      logCase('testFileCache0087', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0087-ss');
        fs.closeSync(second);
        expect(added).assertEqual(13);
        expect(fs.statSync(path).size).assertEqual(30);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0087-ss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0087_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0087_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0088
     * @tc.name      testFileCache0088
     * @tc.desc      Append 14 extra bytes after 19 bytes of cacheitem_0088
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0088.jpg');
      const content: string = 'payload-0088-qqqqrr';
      logCase('testFileCache0088', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0088-sss');
        fs.closeSync(second);
        expect(added).assertEqual(14);
        expect(fs.statSync(path).size).assertEqual(33);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0088-sss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0088_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0088_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0089
     * @tc.name      testFileCache0089
     * @tc.desc      Append 15 extra bytes after 20 bytes of cacheitem_0089
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0089.jpg');
      const content: string = 'payload-0089-qqqqqrr';
      logCase('testFileCache0089', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0089-ssss');
        fs.closeSync(second);
        expect(added).assertEqual(15);
        expect(fs.statSync(path).size).assertEqual(35);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0089-ssss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0089_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0089_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0090
     * @tc.name      testFileCache0090
     * @tc.desc      Append 11 extra bytes after 21 bytes of cacheitem_0090
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFileCache0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0090.jpg');
      const content: string = 'payload-0090-qqqqqqrr';
      logCase('testFileCache0090', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0090-');
        fs.closeSync(second);
        expect(added).assertEqual(11);
        expect(fs.statSync(path).size).assertEqual(32);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0090-');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0090_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0090_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0091
     * @tc.name      testFileCache0091
     * @tc.desc      Append 12 extra bytes after 15 bytes of cacheitem_0091
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0091.jpg');
      const content: string = 'payload-0091-rr';
      logCase('testFileCache0091', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0091-s');
        fs.closeSync(second);
        expect(added).assertEqual(12);
        expect(fs.statSync(path).size).assertEqual(27);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0091-s');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0091_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0091_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0092
     * @tc.name      testFileCache0092
     * @tc.desc      Append 13 extra bytes after 17 bytes of cacheitem_0092
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0092.jpg');
      const content: string = 'payload-0092-qrrr';
      logCase('testFileCache0092', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0092-ss');
        fs.closeSync(second);
        expect(added).assertEqual(13);
        expect(fs.statSync(path).size).assertEqual(30);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0092-ss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0092_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0092_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0093
     * @tc.name      testFileCache0093
     * @tc.desc      Append 14 extra bytes after 18 bytes of cacheitem_0093
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0093.jpg');
      const content: string = 'payload-0093-qqrrr';
      logCase('testFileCache0093', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0093-sss');
        fs.closeSync(second);
        expect(added).assertEqual(14);
        expect(fs.statSync(path).size).assertEqual(32);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0093-sss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0093_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0093_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0094
     * @tc.name      testFileCache0094
     * @tc.desc      Append 15 extra bytes after 19 bytes of cacheitem_0094
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0094.jpg');
      const content: string = 'payload-0094-qqqrrr';
      logCase('testFileCache0094', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0094-ssss');
        fs.closeSync(second);
        expect(added).assertEqual(15);
        expect(fs.statSync(path).size).assertEqual(34);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0094-ssss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0094_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0094_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0095
     * @tc.name      testFileCache0095
     * @tc.desc      Append 11 extra bytes after 20 bytes of cacheitem_0095
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0095.jpg');
      const content: string = 'payload-0095-qqqqrrr';
      logCase('testFileCache0095', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0095-');
        fs.closeSync(second);
        expect(added).assertEqual(11);
        expect(fs.statSync(path).size).assertEqual(31);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0095-');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0095_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0095_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0096
     * @tc.name      testFileCache0096
     * @tc.desc      Append 12 extra bytes after 18 bytes of cacheitem_0096
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0096.jpg');
      const content: string = 'payload-0096-qqqqq';
      logCase('testFileCache0096', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0096-s');
        fs.closeSync(second);
        expect(added).assertEqual(12);
        expect(fs.statSync(path).size).assertEqual(30);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0096-s');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0096_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0096_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0097
     * @tc.name      testFileCache0097
     * @tc.desc      Append 13 extra bytes after 19 bytes of cacheitem_0097
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0097.jpg');
      const content: string = 'payload-0097-qqqqqq';
      logCase('testFileCache0097', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0097-ss');
        fs.closeSync(second);
        expect(added).assertEqual(13);
        expect(fs.statSync(path).size).assertEqual(32);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0097-ss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0097_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0097_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0098
     * @tc.name      testFileCache0098
     * @tc.desc      Append 14 extra bytes after 13 bytes of cacheitem_0098
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0098.jpg');
      const content: string = 'payload-0098-';
      logCase('testFileCache0098', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0098-sss');
        fs.closeSync(second);
        expect(added).assertEqual(14);
        expect(fs.statSync(path).size).assertEqual(27);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0098-sss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0098_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0098_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0099
     * @tc.name      testFileCache0099
     * @tc.desc      Append 15 extra bytes after 14 bytes of cacheitem_0099
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0099.jpg');
      const content: string = 'payload-0099-q';
      logCase('testFileCache0099', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0099-ssss');
        fs.closeSync(second);
        expect(added).assertEqual(15);
        expect(fs.statSync(path).size).assertEqual(29);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0099-ssss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0099_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0099_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0100
     * @tc.name      testFileCache0100
     * @tc.desc      Append 11 extra bytes after 16 bytes of cacheitem_0100
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0100.jpg');
      const content: string = 'payload-0100-qqr';
      logCase('testFileCache0100', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0100-');
        fs.closeSync(second);
        expect(added).assertEqual(11);
        expect(fs.statSync(path).size).assertEqual(27);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0100-');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0100_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0100_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0101
     * @tc.name      testFileCache0101
     * @tc.desc      Append 12 extra bytes after 17 bytes of cacheitem_0101
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0101.jpg');
      const content: string = 'payload-0101-qqqr';
      logCase('testFileCache0101', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0101-s');
        fs.closeSync(second);
        expect(added).assertEqual(12);
        expect(fs.statSync(path).size).assertEqual(29);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0101-s');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0101_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0101_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0102
     * @tc.name      testFileCache0102
     * @tc.desc      Append 13 extra bytes after 18 bytes of cacheitem_0102
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0102.jpg');
      const content: string = 'payload-0102-qqqqr';
      logCase('testFileCache0102', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0102-ss');
        fs.closeSync(second);
        expect(added).assertEqual(13);
        expect(fs.statSync(path).size).assertEqual(31);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0102-ss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0102_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0102_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0103
     * @tc.name      testFileCache0103
     * @tc.desc      Append 14 extra bytes after 19 bytes of cacheitem_0103
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0103.jpg');
      const content: string = 'payload-0103-qqqqqr';
      logCase('testFileCache0103', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0103-sss');
        fs.closeSync(second);
        expect(added).assertEqual(14);
        expect(fs.statSync(path).size).assertEqual(33);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0103-sss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0103_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0103_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0104
     * @tc.name      testFileCache0104
     * @tc.desc      Append 15 extra bytes after 21 bytes of cacheitem_0104
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0104.jpg');
      const content: string = 'payload-0104-qqqqqqrr';
      logCase('testFileCache0104', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0104-ssss');
        fs.closeSync(second);
        expect(added).assertEqual(15);
        expect(fs.statSync(path).size).assertEqual(36);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0104-ssss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0104_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0104_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0105
     * @tc.name      testFileCache0105
     * @tc.desc      Append 11 extra bytes after 15 bytes of cacheitem_0105
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0105.jpg');
      const content: string = 'payload-0105-rr';
      logCase('testFileCache0105', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0105-');
        fs.closeSync(second);
        expect(added).assertEqual(11);
        expect(fs.statSync(path).size).assertEqual(26);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0105-');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0105_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0105_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0106
     * @tc.name      testFileCache0106
     * @tc.desc      Append 12 extra bytes after 16 bytes of cacheitem_0106
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0106.jpg');
      const content: string = 'payload-0106-qrr';
      logCase('testFileCache0106', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0106-s');
        fs.closeSync(second);
        expect(added).assertEqual(12);
        expect(fs.statSync(path).size).assertEqual(28);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0106-s');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0106_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0106_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0107
     * @tc.name      testFileCache0107
     * @tc.desc      Append 13 extra bytes after 17 bytes of cacheitem_0107
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0107.jpg');
      const content: string = 'payload-0107-qqrr';
      logCase('testFileCache0107', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0107-ss');
        fs.closeSync(second);
        expect(added).assertEqual(13);
        expect(fs.statSync(path).size).assertEqual(30);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0107-ss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0107_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0107_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0108
     * @tc.name      testFileCache0108
     * @tc.desc      Append 14 extra bytes after 19 bytes of cacheitem_0108
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0108.jpg');
      const content: string = 'payload-0108-qqqrrr';
      logCase('testFileCache0108', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, content);
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.APPEND | fs.OpenMode.READ_WRITE);
        const added: number = fs.writeSync(second.fd, 'delta-0108-sss');
        fs.closeSync(second);
        expect(added).assertEqual(14);
        expect(fs.statSync(path).size).assertEqual(33);
        expect(fs.readTextSync(path)).assertEqual(content + 'delta-0108-sss');      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0108_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0108_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0109
     * @tc.name      testFileCache0109
     * @tc.desc      Truncate and rewrite 20 bytes of cacheitem_0109
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0109.webp');
      const content: string = 'payload-0109-qqqqrrr';
      logCase('testFileCache0109', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0109');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(20);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(20);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0109_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0109_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0110
     * @tc.name      testFileCache0110
     * @tc.desc      Truncate and rewrite 21 bytes of cacheitem_0110
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0110.webp');
      const content: string = 'payload-0110-qqqqqrrr';
      logCase('testFileCache0110', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0110');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(21);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(21);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0110_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0110_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0111
     * @tc.name      testFileCache0111
     * @tc.desc      Truncate and rewrite 22 bytes of cacheitem_0111
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0111.webp');
      const content: string = 'payload-0111-qqqqqqrrr';
      logCase('testFileCache0111', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0111');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(22);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(22);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0111_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0111_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0112
     * @tc.name      testFileCache0112
     * @tc.desc      Truncate and rewrite 13 bytes of cacheitem_0112
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0112.webp');
      const content: string = 'payload-0112-';
      logCase('testFileCache0112', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0112');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(13);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(13);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0112_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0112_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0113
     * @tc.name      testFileCache0113
     * @tc.desc      Truncate and rewrite 14 bytes of cacheitem_0113
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0113.webp');
      const content: string = 'payload-0113-q';
      logCase('testFileCache0113', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0113');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(14);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(14);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0113_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0113_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0114
     * @tc.name      testFileCache0114
     * @tc.desc      Truncate and rewrite 15 bytes of cacheitem_0114
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0114.webp');
      const content: string = 'payload-0114-qq';
      logCase('testFileCache0114', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0114');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(15);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(15);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0114_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0114_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0115
     * @tc.name      testFileCache0115
     * @tc.desc      Truncate and rewrite 16 bytes of cacheitem_0115
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0115.webp');
      const content: string = 'payload-0115-qqq';
      logCase('testFileCache0115', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0115');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(16);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(16);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0115_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0115_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0116
     * @tc.name      testFileCache0116
     * @tc.desc      Truncate and rewrite 18 bytes of cacheitem_0116
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0116.webp');
      const content: string = 'payload-0116-qqqqr';
      logCase('testFileCache0116', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0116');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(18);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(18);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0116_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0116_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0117
     * @tc.name      testFileCache0117
     * @tc.desc      Truncate and rewrite 19 bytes of cacheitem_0117
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0117.webp');
      const content: string = 'payload-0117-qqqqqr';
      logCase('testFileCache0117', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0117');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(19);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(19);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0117_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0117_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0118
     * @tc.name      testFileCache0118
     * @tc.desc      Truncate and rewrite 20 bytes of cacheitem_0118
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0118.webp');
      const content: string = 'payload-0118-qqqqqqr';
      logCase('testFileCache0118', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0118');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(20);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(20);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0118_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0118_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0119
     * @tc.name      testFileCache0119
     * @tc.desc      Truncate and rewrite 14 bytes of cacheitem_0119
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0119.webp');
      const content: string = 'payload-0119-r';
      logCase('testFileCache0119', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0119');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(14);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(14);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0119_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0119_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0120
     * @tc.name      testFileCache0120
     * @tc.desc      Truncate and rewrite 16 bytes of cacheitem_0120
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0120.webp');
      const content: string = 'payload-0120-qrr';
      logCase('testFileCache0120', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0120');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(16);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(16);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0120_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0120_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0121
     * @tc.name      testFileCache0121
     * @tc.desc      Truncate and rewrite 17 bytes of cacheitem_0121
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0121.webp');
      const content: string = 'payload-0121-qqrr';
      logCase('testFileCache0121', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0121');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(17);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(17);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0121_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0121_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0122
     * @tc.name      testFileCache0122
     * @tc.desc      Truncate and rewrite 18 bytes of cacheitem_0122
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0122.webp');
      const content: string = 'payload-0122-qqqrr';
      logCase('testFileCache0122', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0122');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(18);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(18);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0122_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0122_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0123
     * @tc.name      testFileCache0123
     * @tc.desc      Truncate and rewrite 19 bytes of cacheitem_0123
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0123.webp');
      const content: string = 'payload-0123-qqqqrr';
      logCase('testFileCache0123', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0123');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(19);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(19);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0123_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0123_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0124
     * @tc.name      testFileCache0124
     * @tc.desc      Truncate and rewrite 21 bytes of cacheitem_0124
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0124.webp');
      const content: string = 'payload-0124-qqqqqrrr';
      logCase('testFileCache0124', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0124');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(21);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(21);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0124_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0124_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0125
     * @tc.name      testFileCache0125
     * @tc.desc      Truncate and rewrite 22 bytes of cacheitem_0125
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0125.webp');
      const content: string = 'payload-0125-qqqqqqrrr';
      logCase('testFileCache0125', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0125');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(22);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(22);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0125_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0125_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0126
     * @tc.name      testFileCache0126
     * @tc.desc      Truncate and rewrite 16 bytes of cacheitem_0126
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0126.webp');
      const content: string = 'payload-0126-rrr';
      logCase('testFileCache0126', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0126');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(16);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(16);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0126_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0126_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0127
     * @tc.name      testFileCache0127
     * @tc.desc      Truncate and rewrite 17 bytes of cacheitem_0127
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0127.webp');
      const content: string = 'payload-0127-qrrr';
      logCase('testFileCache0127', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0127');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(17);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(17);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0127_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0127_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0128
     * @tc.name      testFileCache0128
     * @tc.desc      Truncate and rewrite 15 bytes of cacheitem_0128
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0128.webp');
      const content: string = 'payload-0128-qq';
      logCase('testFileCache0128', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0128');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(15);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(15);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0128_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0128_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0129
     * @tc.name      testFileCache0129
     * @tc.desc      Truncate and rewrite 16 bytes of cacheitem_0129
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0129.webp');
      const content: string = 'payload-0129-qqq';
      logCase('testFileCache0129', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0129');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(16);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(16);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0129_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0129_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0130
     * @tc.name      testFileCache0130
     * @tc.desc      Truncate and rewrite 17 bytes of cacheitem_0130
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0130.webp');
      const content: string = 'payload-0130-qqqq';
      logCase('testFileCache0130', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0130');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(17);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(17);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0130_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0130_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0131
     * @tc.name      testFileCache0131
     * @tc.desc      Truncate and rewrite 18 bytes of cacheitem_0131
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0131.webp');
      const content: string = 'payload-0131-qqqqq';
      logCase('testFileCache0131', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0131');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(18);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(18);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0131_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0131_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0132
     * @tc.name      testFileCache0132
     * @tc.desc      Truncate and rewrite 20 bytes of cacheitem_0132
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0132.webp');
      const content: string = 'payload-0132-qqqqqqr';
      logCase('testFileCache0132', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0132');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(20);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(20);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0132_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0132_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0133
     * @tc.name      testFileCache0133
     * @tc.desc      Truncate and rewrite 14 bytes of cacheitem_0133
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0133.webp');
      const content: string = 'payload-0133-r';
      logCase('testFileCache0133', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0133');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(14);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(14);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0133_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0133_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0134
     * @tc.name      testFileCache0134
     * @tc.desc      Truncate and rewrite 15 bytes of cacheitem_0134
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0134.webp');
      const content: string = 'payload-0134-qr';
      logCase('testFileCache0134', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0134');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(15);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(15);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0134_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0134_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0135
     * @tc.name      testFileCache0135
     * @tc.desc      Truncate and rewrite 16 bytes of cacheitem_0135
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0135.webp');
      const content: string = 'payload-0135-qqr';
      logCase('testFileCache0135', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0135');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(16);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(16);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0135_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0135_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0136
     * @tc.name      testFileCache0136
     * @tc.desc      Truncate and rewrite 18 bytes of cacheitem_0136
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0136.webp');
      const content: string = 'payload-0136-qqqrr';
      logCase('testFileCache0136', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0136');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(18);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(18);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0136_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0136_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0137
     * @tc.name      testFileCache0137
     * @tc.desc      Truncate and rewrite 19 bytes of cacheitem_0137
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0137.webp');
      const content: string = 'payload-0137-qqqqrr';
      logCase('testFileCache0137', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0137');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(19);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(19);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0137_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0137_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0138
     * @tc.name      testFileCache0138
     * @tc.desc      Truncate and rewrite 20 bytes of cacheitem_0138
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0138.webp');
      const content: string = 'payload-0138-qqqqqrr';
      logCase('testFileCache0138', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0138');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(20);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(20);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0138_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0138_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0139
     * @tc.name      testFileCache0139
     * @tc.desc      Truncate and rewrite 21 bytes of cacheitem_0139
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0139.webp');
      const content: string = 'payload-0139-qqqqqqrr';
      logCase('testFileCache0139', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0139');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(21);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(21);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0139_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0139_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0140
     * @tc.name      testFileCache0140
     * @tc.desc      Truncate and rewrite 16 bytes of cacheitem_0140
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0140.webp');
      const content: string = 'payload-0140-rrr';
      logCase('testFileCache0140', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0140');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(16);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(16);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0140_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0140_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0141
     * @tc.name      testFileCache0141
     * @tc.desc      Truncate and rewrite 17 bytes of cacheitem_0141
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0141.webp');
      const content: string = 'payload-0141-qrrr';
      logCase('testFileCache0141', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0141');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(17);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(17);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0141_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0141_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0142
     * @tc.name      testFileCache0142
     * @tc.desc      Truncate and rewrite 18 bytes of cacheitem_0142
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0142.webp');
      const content: string = 'payload-0142-qqrrr';
      logCase('testFileCache0142', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0142');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(18);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(18);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0142_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0142_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0143
     * @tc.name      testFileCache0143
     * @tc.desc      Truncate and rewrite 19 bytes of cacheitem_0143
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0143.webp');
      const content: string = 'payload-0143-qqqrrr';
      logCase('testFileCache0143', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0143');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(19);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(19);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0143_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0143_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0144
     * @tc.name      testFileCache0144
     * @tc.desc      Truncate and rewrite 17 bytes of cacheitem_0144
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0144.webp');
      const content: string = 'payload-0144-qqqq';
      logCase('testFileCache0144', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0144');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(17);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(17);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0144_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0144_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0145
     * @tc.name      testFileCache0145
     * @tc.desc      Truncate and rewrite 18 bytes of cacheitem_0145
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0145.webp');
      const content: string = 'payload-0145-qqqqq';
      logCase('testFileCache0145', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0145');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(18);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(18);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0145_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0145_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0146
     * @tc.name      testFileCache0146
     * @tc.desc      Truncate and rewrite 19 bytes of cacheitem_0146
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0146.webp');
      const content: string = 'payload-0146-qqqqqq';
      logCase('testFileCache0146', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0146');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(19);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(19);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0146_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0146_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0147
     * @tc.name      testFileCache0147
     * @tc.desc      Truncate and rewrite 13 bytes of cacheitem_0147
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0147.webp');
      const content: string = 'payload-0147-';
      logCase('testFileCache0147', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0147');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(13);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(13);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0147_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0147_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0148
     * @tc.name      testFileCache0148
     * @tc.desc      Truncate and rewrite 15 bytes of cacheitem_0148
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0148.webp');
      const content: string = 'payload-0148-qr';
      logCase('testFileCache0148', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0148');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(15);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(15);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0148_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0148_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0149
     * @tc.name      testFileCache0149
     * @tc.desc      Truncate and rewrite 16 bytes of cacheitem_0149
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0149.webp');
      const content: string = 'payload-0149-qqr';
      logCase('testFileCache0149', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0149');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(16);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(16);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0149_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0149_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0150
     * @tc.name      testFileCache0150
     * @tc.desc      Truncate and rewrite 17 bytes of cacheitem_0150
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0150.webp');
      const content: string = 'payload-0150-qqqr';
      logCase('testFileCache0150', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0150');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(17);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(17);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0150_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0150_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0151
     * @tc.name      testFileCache0151
     * @tc.desc      Truncate and rewrite 18 bytes of cacheitem_0151
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0151.webp');
      const content: string = 'payload-0151-qqqqr';
      logCase('testFileCache0151', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0151');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(18);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(18);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0151_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0151_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0152
     * @tc.name      testFileCache0152
     * @tc.desc      Truncate and rewrite 20 bytes of cacheitem_0152
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0152.webp');
      const content: string = 'payload-0152-qqqqqrr';
      logCase('testFileCache0152', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0152');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(20);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(20);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0152_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0152_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0153
     * @tc.name      testFileCache0153
     * @tc.desc      Truncate and rewrite 21 bytes of cacheitem_0153
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0153.webp');
      const content: string = 'payload-0153-qqqqqqrr';
      logCase('testFileCache0153', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0153');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(21);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(21);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0153_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0153_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0154
     * @tc.name      testFileCache0154
     * @tc.desc      Truncate and rewrite 15 bytes of cacheitem_0154
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0154.webp');
      const content: string = 'payload-0154-rr';
      logCase('testFileCache0154', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0154');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(15);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(15);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0154_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0154_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0155
     * @tc.name      testFileCache0155
     * @tc.desc      Truncate and rewrite 16 bytes of cacheitem_0155
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0155.webp');
      const content: string = 'payload-0155-qrr';
      logCase('testFileCache0155', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0155');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(16);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(16);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0155_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0155_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0156
     * @tc.name      testFileCache0156
     * @tc.desc      Truncate and rewrite 18 bytes of cacheitem_0156
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0156.webp');
      const content: string = 'payload-0156-qqrrr';
      logCase('testFileCache0156', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0156');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(18);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(18);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0156_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0156_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0157
     * @tc.name      testFileCache0157
     * @tc.desc      Truncate and rewrite 19 bytes of cacheitem_0157
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0157.webp');
      const content: string = 'payload-0157-qqqrrr';
      logCase('testFileCache0157', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0157');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(19);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(19);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0157_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0157_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0158
     * @tc.name      testFileCache0158
     * @tc.desc      Truncate and rewrite 20 bytes of cacheitem_0158
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0158.webp');
      const content: string = 'payload-0158-qqqqrrr';
      logCase('testFileCache0158', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0158');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(20);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(20);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0158_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0158_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0159
     * @tc.name      testFileCache0159
     * @tc.desc      Truncate and rewrite 21 bytes of cacheitem_0159
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0159.webp');
      const content: string = 'payload-0159-qqqqqrrr';
      logCase('testFileCache0159', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0159');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(21);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(21);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0159_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0159_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0160
     * @tc.name      testFileCache0160
     * @tc.desc      Truncate and rewrite 19 bytes of cacheitem_0160
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0160.webp');
      const content: string = 'payload-0160-qqqqqq';
      logCase('testFileCache0160', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0160');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(19);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(19);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0160_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0160_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0161
     * @tc.name      testFileCache0161
     * @tc.desc      Truncate and rewrite 13 bytes of cacheitem_0161
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0161.webp');
      const content: string = 'payload-0161-';
      logCase('testFileCache0161', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0161');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(13);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(13);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0161_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0161_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0162
     * @tc.name      testFileCache0162
     * @tc.desc      Truncate and rewrite 14 bytes of cacheitem_0162
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0162.webp');
      const content: string = 'payload-0162-q';
      logCase('testFileCache0162', `path=${path} bytes=${content.length}`);
      try {
        const first: fs.File = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        fs.writeSync(first.fd, 'stale-head-0162');
        fs.closeSync(first);
        const second: fs.File = fs.openSync(path, fs.OpenMode.TRUNC | fs.OpenMode.READ_WRITE);
        const rewritten: number = fs.writeSync(second.fd, content);
        fs.closeSync(second);
        expect(rewritten).assertEqual(14);
        expect(fs.readTextSync(path)).assertEqual(content);
        expect(fs.statSync(path).size).assertEqual(14);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0162_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0162_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0163
     * @tc.name      testFileCache0163
     * @tc.desc      Copy cacheitem_0163 and compare 15 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0163.cache');
      const content: string = 'payload-0163-qq';
      logCase('testFileCache0163', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(15);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0163_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0163_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0164
     * @tc.name      testFileCache0164
     * @tc.desc      Copy cacheitem_0164 and compare 17 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0164.cache');
      const content: string = 'payload-0164-qqqr';
      logCase('testFileCache0164', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(17);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0164_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0164_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0165
     * @tc.name      testFileCache0165
     * @tc.desc      Copy cacheitem_0165 and compare 18 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0165.cache');
      const content: string = 'payload-0165-qqqqr';
      logCase('testFileCache0165', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(18);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0165_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0165_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0166
     * @tc.name      testFileCache0166
     * @tc.desc      Copy cacheitem_0166 and compare 19 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0166.cache');
      const content: string = 'payload-0166-qqqqqr';
      logCase('testFileCache0166', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(19);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0166_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0166_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0167
     * @tc.name      testFileCache0167
     * @tc.desc      Copy cacheitem_0167 and compare 20 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0167.cache');
      const content: string = 'payload-0167-qqqqqqr';
      logCase('testFileCache0167', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(20);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0167_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0167_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0168
     * @tc.name      testFileCache0168
     * @tc.desc      Copy cacheitem_0168 and compare 15 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0168.cache');
      const content: string = 'payload-0168-rr';
      logCase('testFileCache0168', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(15);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0168_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0168_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0169
     * @tc.name      testFileCache0169
     * @tc.desc      Copy cacheitem_0169 and compare 16 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0169.cache');
      const content: string = 'payload-0169-qrr';
      logCase('testFileCache0169', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(16);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0169_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0169_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0170
     * @tc.name      testFileCache0170
     * @tc.desc      Copy cacheitem_0170 and compare 17 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0170.cache');
      const content: string = 'payload-0170-qqrr';
      logCase('testFileCache0170', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(17);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0170_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0170_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0171
     * @tc.name      testFileCache0171
     * @tc.desc      Copy cacheitem_0171 and compare 18 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0171.cache');
      const content: string = 'payload-0171-qqqrr';
      logCase('testFileCache0171', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(18);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0171_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0171_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0172
     * @tc.name      testFileCache0172
     * @tc.desc      Copy cacheitem_0172 and compare 20 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0172.cache');
      const content: string = 'payload-0172-qqqqrrr';
      logCase('testFileCache0172', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(20);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0172_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0172_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0173
     * @tc.name      testFileCache0173
     * @tc.desc      Copy cacheitem_0173 and compare 21 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0173.cache');
      const content: string = 'payload-0173-qqqqqrrr';
      logCase('testFileCache0173', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(21);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0173_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0173_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0174
     * @tc.name      testFileCache0174
     * @tc.desc      Copy cacheitem_0174 and compare 22 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0174.cache');
      const content: string = 'payload-0174-qqqqqqrrr';
      logCase('testFileCache0174', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(22);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0174_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0174_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0175
     * @tc.name      testFileCache0175
     * @tc.desc      Copy cacheitem_0175 and compare 16 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0175.cache');
      const content: string = 'payload-0175-rrr';
      logCase('testFileCache0175', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(16);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0175_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0175_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0176
     * @tc.name      testFileCache0176
     * @tc.desc      Copy cacheitem_0176 and compare 14 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0176.cache');
      const content: string = 'payload-0176-q';
      logCase('testFileCache0176', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(14);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0176_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0176_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0177
     * @tc.name      testFileCache0177
     * @tc.desc      Copy cacheitem_0177 and compare 15 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0177.cache');
      const content: string = 'payload-0177-qq';
      logCase('testFileCache0177', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(15);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0177_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0177_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0178
     * @tc.name      testFileCache0178
     * @tc.desc      Copy cacheitem_0178 and compare 16 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0178.cache');
      const content: string = 'payload-0178-qqq';
      logCase('testFileCache0178', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(16);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0178_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0178_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0179
     * @tc.name      testFileCache0179
     * @tc.desc      Copy cacheitem_0179 and compare 17 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0179.cache');
      const content: string = 'payload-0179-qqqq';
      logCase('testFileCache0179', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(17);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0179_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0179_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0180
     * @tc.name      testFileCache0180
     * @tc.desc      Copy cacheitem_0180 and compare 19 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0180.cache');
      const content: string = 'payload-0180-qqqqqr';
      logCase('testFileCache0180', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(19);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0180_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0180_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0181
     * @tc.name      testFileCache0181
     * @tc.desc      Copy cacheitem_0181 and compare 20 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0181.cache');
      const content: string = 'payload-0181-qqqqqqr';
      logCase('testFileCache0181', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(20);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0181_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0181_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0182
     * @tc.name      testFileCache0182
     * @tc.desc      Copy cacheitem_0182 and compare 14 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0182.cache');
      const content: string = 'payload-0182-r';
      logCase('testFileCache0182', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(14);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0182_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0182_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0183
     * @tc.name      testFileCache0183
     * @tc.desc      Copy cacheitem_0183 and compare 15 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0183.cache');
      const content: string = 'payload-0183-qr';
      logCase('testFileCache0183', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(15);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0183_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0183_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0184
     * @tc.name      testFileCache0184
     * @tc.desc      Copy cacheitem_0184 and compare 17 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0184.cache');
      const content: string = 'payload-0184-qqrr';
      logCase('testFileCache0184', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(17);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0184_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0184_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0185
     * @tc.name      testFileCache0185
     * @tc.desc      Copy cacheitem_0185 and compare 18 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0185.cache');
      const content: string = 'payload-0185-qqqrr';
      logCase('testFileCache0185', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(18);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0185_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0185_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0186
     * @tc.name      testFileCache0186
     * @tc.desc      Copy cacheitem_0186 and compare 19 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0186.cache');
      const content: string = 'payload-0186-qqqqrr';
      logCase('testFileCache0186', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(19);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0186_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0186_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0187
     * @tc.name      testFileCache0187
     * @tc.desc      Copy cacheitem_0187 and compare 20 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0187.cache');
      const content: string = 'payload-0187-qqqqqrr';
      logCase('testFileCache0187', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(20);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0187_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0187_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0188
     * @tc.name      testFileCache0188
     * @tc.desc      Copy cacheitem_0188 and compare 22 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0188.cache');
      const content: string = 'payload-0188-qqqqqqrrr';
      logCase('testFileCache0188', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(22);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0188_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0188_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0189
     * @tc.name      testFileCache0189
     * @tc.desc      Copy cacheitem_0189 and compare 16 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0189.cache');
      const content: string = 'payload-0189-rrr';
      logCase('testFileCache0189', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(16);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0189_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0189_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0190
     * @tc.name      testFileCache0190
     * @tc.desc      Copy cacheitem_0190 and compare 17 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0190.cache');
      const content: string = 'payload-0190-qrrr';
      logCase('testFileCache0190', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(17);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0190_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0190_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0191
     * @tc.name      testFileCache0191
     * @tc.desc      Copy cacheitem_0191 and compare 18 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0191.cache');
      const content: string = 'payload-0191-qqrrr';
      logCase('testFileCache0191', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(18);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0191_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0191_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0192
     * @tc.name      testFileCache0192
     * @tc.desc      Copy cacheitem_0192 and compare 16 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0192.cache');
      const content: string = 'payload-0192-qqq';
      logCase('testFileCache0192', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(16);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0192_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0192_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0193
     * @tc.name      testFileCache0193
     * @tc.desc      Copy cacheitem_0193 and compare 17 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0193.cache');
      const content: string = 'payload-0193-qqqq';
      logCase('testFileCache0193', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(17);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0193_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0193_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0194
     * @tc.name      testFileCache0194
     * @tc.desc      Copy cacheitem_0194 and compare 18 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0194.cache');
      const content: string = 'payload-0194-qqqqq';
      logCase('testFileCache0194', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(18);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0194_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0194_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0195
     * @tc.name      testFileCache0195
     * @tc.desc      Copy cacheitem_0195 and compare 19 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0195.cache');
      const content: string = 'payload-0195-qqqqqq';
      logCase('testFileCache0195', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(19);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0195_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0195_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0196
     * @tc.name      testFileCache0196
     * @tc.desc      Copy cacheitem_0196 and compare 14 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0196.cache');
      const content: string = 'payload-0196-r';
      logCase('testFileCache0196', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(14);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0196_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0196_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0197
     * @tc.name      testFileCache0197
     * @tc.desc      Copy cacheitem_0197 and compare 15 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0197.cache');
      const content: string = 'payload-0197-qr';
      logCase('testFileCache0197', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(15);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0197_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0197_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0198
     * @tc.name      testFileCache0198
     * @tc.desc      Copy cacheitem_0198 and compare 16 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0198.cache');
      const content: string = 'payload-0198-qqr';
      logCase('testFileCache0198', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(16);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0198_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0198_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0199
     * @tc.name      testFileCache0199
     * @tc.desc      Copy cacheitem_0199 and compare 17 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0199.cache');
      const content: string = 'payload-0199-qqqr';
      logCase('testFileCache0199', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(17);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0199_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0199_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0200
     * @tc.name      testFileCache0200
     * @tc.desc      Copy cacheitem_0200 and compare 19 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0200.cache');
      const content: string = 'payload-0200-qqqqrr';
      logCase('testFileCache0200', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(19);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0200_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0200_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0201
     * @tc.name      testFileCache0201
     * @tc.desc      Copy cacheitem_0201 and compare 20 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0201.cache');
      const content: string = 'payload-0201-qqqqqrr';
      logCase('testFileCache0201', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(20);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0201_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0201_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0202
     * @tc.name      testFileCache0202
     * @tc.desc      Copy cacheitem_0202 and compare 21 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0202.cache');
      const content: string = 'payload-0202-qqqqqqrr';
      logCase('testFileCache0202', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(21);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0202_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0202_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0203
     * @tc.name      testFileCache0203
     * @tc.desc      Copy cacheitem_0203 and compare 15 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0203.cache');
      const content: string = 'payload-0203-rr';
      logCase('testFileCache0203', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(15);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0203_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0203_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0204
     * @tc.name      testFileCache0204
     * @tc.desc      Copy cacheitem_0204 and compare 17 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0204.cache');
      const content: string = 'payload-0204-qrrr';
      logCase('testFileCache0204', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(17);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0204_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0204_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0205
     * @tc.name      testFileCache0205
     * @tc.desc      Copy cacheitem_0205 and compare 18 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0205.cache');
      const content: string = 'payload-0205-qqrrr';
      logCase('testFileCache0205', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(18);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0205_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0205_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0206
     * @tc.name      testFileCache0206
     * @tc.desc      Copy cacheitem_0206 and compare 19 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0206.cache');
      const content: string = 'payload-0206-qqqrrr';
      logCase('testFileCache0206', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(19);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0206_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0206_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0207
     * @tc.name      testFileCache0207
     * @tc.desc      Copy cacheitem_0207 and compare 20 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0207.cache');
      const content: string = 'payload-0207-qqqqrrr';
      logCase('testFileCache0207', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(20);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0207_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0207_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0208
     * @tc.name      testFileCache0208
     * @tc.desc      Copy cacheitem_0208 and compare 18 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0208.cache');
      const content: string = 'payload-0208-qqqqq';
      logCase('testFileCache0208', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(18);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0208_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0208_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0209
     * @tc.name      testFileCache0209
     * @tc.desc      Copy cacheitem_0209 and compare 19 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0209.cache');
      const content: string = 'payload-0209-qqqqqq';
      logCase('testFileCache0209', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(19);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0209_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0209_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0210
     * @tc.name      testFileCache0210
     * @tc.desc      Copy cacheitem_0210 and compare 13 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileCache0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0210.cache');
      const content: string = 'payload-0210-';
      logCase('testFileCache0210', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(13);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0210_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0210_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0211
     * @tc.name      testFileCache0211
     * @tc.desc      Copy cacheitem_0211 and compare 14 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0211.cache');
      const content: string = 'payload-0211-q';
      logCase('testFileCache0211', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(14);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0211_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0211_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0212
     * @tc.name      testFileCache0212
     * @tc.desc      Copy cacheitem_0212 and compare 16 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0212.cache');
      const content: string = 'payload-0212-qqr';
      logCase('testFileCache0212', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(16);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0212_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0212_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0213
     * @tc.name      testFileCache0213
     * @tc.desc      Copy cacheitem_0213 and compare 17 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0213.cache');
      const content: string = 'payload-0213-qqqr';
      logCase('testFileCache0213', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(17);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0213_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0213_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0214
     * @tc.name      testFileCache0214
     * @tc.desc      Copy cacheitem_0214 and compare 18 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0214.cache');
      const content: string = 'payload-0214-qqqqr';
      logCase('testFileCache0214', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(18);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0214_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0214_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0215
     * @tc.name      testFileCache0215
     * @tc.desc      Copy cacheitem_0215 and compare 19 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0215.cache');
      const content: string = 'payload-0215-qqqqqr';
      logCase('testFileCache0215', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(19);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0215_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0215_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0216
     * @tc.name      testFileCache0216
     * @tc.desc      Copy cacheitem_0216 and compare 21 bytes in the clone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0216.cache');
      const content: string = 'payload-0216-qqqqqqrr';
      logCase('testFileCache0216', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.copyFileSync(path, path + '.copy');
        expect(fs.readTextSync(path + '.copy')).assertEqual(content);
        expect(fs.statSync(path + '.copy').size).assertEqual(21);
        expect(fs.accessSync(path)).assertTrue();
        expect(fs.accessSync(path + '.copy')).assertTrue();      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0216_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0216_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0217
     * @tc.name      testFileCache0217
     * @tc.desc      Rename cacheitem_0217 and keep 15 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0217.dat');
      const content: string = 'payload-0217-rr';
      logCase('testFileCache0217', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(15);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0217_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0217_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0218
     * @tc.name      testFileCache0218
     * @tc.desc      Rename cacheitem_0218 and keep 16 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0218.dat');
      const content: string = 'payload-0218-qrr';
      logCase('testFileCache0218', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(16);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0218_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0218_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0219
     * @tc.name      testFileCache0219
     * @tc.desc      Rename cacheitem_0219 and keep 17 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0219.dat');
      const content: string = 'payload-0219-qqrr';
      logCase('testFileCache0219', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(17);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0219_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0219_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0220
     * @tc.name      testFileCache0220
     * @tc.desc      Rename cacheitem_0220 and keep 19 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0220.dat');
      const content: string = 'payload-0220-qqqrrr';
      logCase('testFileCache0220', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(19);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0220_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0220_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0221
     * @tc.name      testFileCache0221
     * @tc.desc      Rename cacheitem_0221 and keep 20 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0221.dat');
      const content: string = 'payload-0221-qqqqrrr';
      logCase('testFileCache0221', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(20);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0221_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0221_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0222
     * @tc.name      testFileCache0222
     * @tc.desc      Rename cacheitem_0222 and keep 21 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0222.dat');
      const content: string = 'payload-0222-qqqqqrrr';
      logCase('testFileCache0222', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(21);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0222_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0222_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0223
     * @tc.name      testFileCache0223
     * @tc.desc      Rename cacheitem_0223 and keep 22 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0223.dat');
      const content: string = 'payload-0223-qqqqqqrrr';
      logCase('testFileCache0223', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(22);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0223_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0223_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0224
     * @tc.name      testFileCache0224
     * @tc.desc      Rename cacheitem_0224 and keep 13 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0224.dat');
      const content: string = 'payload-0224-';
      logCase('testFileCache0224', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(13);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0224_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0224_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0225
     * @tc.name      testFileCache0225
     * @tc.desc      Rename cacheitem_0225 and keep 14 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0225.dat');
      const content: string = 'payload-0225-q';
      logCase('testFileCache0225', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(14);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0225_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0225_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0226
     * @tc.name      testFileCache0226
     * @tc.desc      Rename cacheitem_0226 and keep 15 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0226.dat');
      const content: string = 'payload-0226-qq';
      logCase('testFileCache0226', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(15);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0226_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0226_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0227
     * @tc.name      testFileCache0227
     * @tc.desc      Rename cacheitem_0227 and keep 16 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0227.dat');
      const content: string = 'payload-0227-qqq';
      logCase('testFileCache0227', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(16);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0227_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0227_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0228
     * @tc.name      testFileCache0228
     * @tc.desc      Rename cacheitem_0228 and keep 18 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0228.dat');
      const content: string = 'payload-0228-qqqqr';
      logCase('testFileCache0228', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(18);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0228_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0228_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0229
     * @tc.name      testFileCache0229
     * @tc.desc      Rename cacheitem_0229 and keep 19 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0229.dat');
      const content: string = 'payload-0229-qqqqqr';
      logCase('testFileCache0229', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(19);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0229_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0229_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0230
     * @tc.name      testFileCache0230
     * @tc.desc      Rename cacheitem_0230 and keep 20 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0230.dat');
      const content: string = 'payload-0230-qqqqqqr';
      logCase('testFileCache0230', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(20);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0230_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0230_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0231
     * @tc.name      testFileCache0231
     * @tc.desc      Rename cacheitem_0231 and keep 14 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0231.dat');
      const content: string = 'payload-0231-r';
      logCase('testFileCache0231', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(14);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0231_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0231_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0232
     * @tc.name      testFileCache0232
     * @tc.desc      Rename cacheitem_0232 and keep 16 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0232.dat');
      const content: string = 'payload-0232-qrr';
      logCase('testFileCache0232', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(16);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0232_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0232_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0233
     * @tc.name      testFileCache0233
     * @tc.desc      Rename cacheitem_0233 and keep 17 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0233.dat');
      const content: string = 'payload-0233-qqrr';
      logCase('testFileCache0233', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(17);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0233_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0233_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0234
     * @tc.name      testFileCache0234
     * @tc.desc      Rename cacheitem_0234 and keep 18 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0234.dat');
      const content: string = 'payload-0234-qqqrr';
      logCase('testFileCache0234', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(18);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0234_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0234_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0235
     * @tc.name      testFileCache0235
     * @tc.desc      Rename cacheitem_0235 and keep 19 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0235.dat');
      const content: string = 'payload-0235-qqqqrr';
      logCase('testFileCache0235', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(19);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0235_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0235_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0236
     * @tc.name      testFileCache0236
     * @tc.desc      Rename cacheitem_0236 and keep 21 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0236.dat');
      const content: string = 'payload-0236-qqqqqrrr';
      logCase('testFileCache0236', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(21);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0236_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0236_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0237
     * @tc.name      testFileCache0237
     * @tc.desc      Rename cacheitem_0237 and keep 22 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0237.dat');
      const content: string = 'payload-0237-qqqqqqrrr';
      logCase('testFileCache0237', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(22);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0237_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0237_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0238
     * @tc.name      testFileCache0238
     * @tc.desc      Rename cacheitem_0238 and keep 16 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0238.dat');
      const content: string = 'payload-0238-rrr';
      logCase('testFileCache0238', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(16);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0238_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0238_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0239
     * @tc.name      testFileCache0239
     * @tc.desc      Rename cacheitem_0239 and keep 17 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0239.dat');
      const content: string = 'payload-0239-qrrr';
      logCase('testFileCache0239', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(17);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0239_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0239_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0240
     * @tc.name      testFileCache0240
     * @tc.desc      Rename cacheitem_0240 and keep 15 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0240.dat');
      const content: string = 'payload-0240-qq';
      logCase('testFileCache0240', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(15);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0240_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0240_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0241
     * @tc.name      testFileCache0241
     * @tc.desc      Rename cacheitem_0241 and keep 16 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0241.dat');
      const content: string = 'payload-0241-qqq';
      logCase('testFileCache0241', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(16);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0241_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0241_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0242
     * @tc.name      testFileCache0242
     * @tc.desc      Rename cacheitem_0242 and keep 17 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0242.dat');
      const content: string = 'payload-0242-qqqq';
      logCase('testFileCache0242', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(17);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0242_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0242_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0243
     * @tc.name      testFileCache0243
     * @tc.desc      Rename cacheitem_0243 and keep 18 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0243.dat');
      const content: string = 'payload-0243-qqqqq';
      logCase('testFileCache0243', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(18);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0243_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0243_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0244
     * @tc.name      testFileCache0244
     * @tc.desc      Rename cacheitem_0244 and keep 20 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0244.dat');
      const content: string = 'payload-0244-qqqqqqr';
      logCase('testFileCache0244', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(20);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0244_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0244_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0245
     * @tc.name      testFileCache0245
     * @tc.desc      Rename cacheitem_0245 and keep 14 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0245.dat');
      const content: string = 'payload-0245-r';
      logCase('testFileCache0245', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(14);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0245_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0245_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0246
     * @tc.name      testFileCache0246
     * @tc.desc      Rename cacheitem_0246 and keep 15 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0246.dat');
      const content: string = 'payload-0246-qr';
      logCase('testFileCache0246', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(15);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0246_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0246_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0247
     * @tc.name      testFileCache0247
     * @tc.desc      Rename cacheitem_0247 and keep 16 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0247.dat');
      const content: string = 'payload-0247-qqr';
      logCase('testFileCache0247', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(16);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0247_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0247_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0248
     * @tc.name      testFileCache0248
     * @tc.desc      Rename cacheitem_0248 and keep 18 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0248.dat');
      const content: string = 'payload-0248-qqqrr';
      logCase('testFileCache0248', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(18);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0248_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0248_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0249
     * @tc.name      testFileCache0249
     * @tc.desc      Rename cacheitem_0249 and keep 19 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0249.dat');
      const content: string = 'payload-0249-qqqqrr';
      logCase('testFileCache0249', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(19);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0249_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0249_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0250
     * @tc.name      testFileCache0250
     * @tc.desc      Rename cacheitem_0250 and keep 20 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0250.dat');
      const content: string = 'payload-0250-qqqqqrr';
      logCase('testFileCache0250', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(20);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0250_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0250_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0251
     * @tc.name      testFileCache0251
     * @tc.desc      Rename cacheitem_0251 and keep 21 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0251.dat');
      const content: string = 'payload-0251-qqqqqqrr';
      logCase('testFileCache0251', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(21);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0251_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0251_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0252
     * @tc.name      testFileCache0252
     * @tc.desc      Rename cacheitem_0252 and keep 16 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0252.dat');
      const content: string = 'payload-0252-rrr';
      logCase('testFileCache0252', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(16);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0252_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0252_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0253
     * @tc.name      testFileCache0253
     * @tc.desc      Rename cacheitem_0253 and keep 17 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0253.dat');
      const content: string = 'payload-0253-qrrr';
      logCase('testFileCache0253', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(17);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0253_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0253_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0254
     * @tc.name      testFileCache0254
     * @tc.desc      Rename cacheitem_0254 and keep 18 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0254.dat');
      const content: string = 'payload-0254-qqrrr';
      logCase('testFileCache0254', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(18);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0254_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0254_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0255
     * @tc.name      testFileCache0255
     * @tc.desc      Rename cacheitem_0255 and keep 19 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0255.dat');
      const content: string = 'payload-0255-qqqrrr';
      logCase('testFileCache0255', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(19);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0255_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0255_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0256
     * @tc.name      testFileCache0256
     * @tc.desc      Rename cacheitem_0256 and keep 17 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0256.dat');
      const content: string = 'payload-0256-qqqq';
      logCase('testFileCache0256', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(17);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0256_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0256_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0257
     * @tc.name      testFileCache0257
     * @tc.desc      Rename cacheitem_0257 and keep 18 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0257.dat');
      const content: string = 'payload-0257-qqqqq';
      logCase('testFileCache0257', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(18);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0257_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0257_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0258
     * @tc.name      testFileCache0258
     * @tc.desc      Rename cacheitem_0258 and keep 19 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0258.dat');
      const content: string = 'payload-0258-qqqqqq';
      logCase('testFileCache0258', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(19);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0258_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0258_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0259
     * @tc.name      testFileCache0259
     * @tc.desc      Rename cacheitem_0259 and keep 13 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0259.dat');
      const content: string = 'payload-0259-';
      logCase('testFileCache0259', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(13);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0259_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0259_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0260
     * @tc.name      testFileCache0260
     * @tc.desc      Rename cacheitem_0260 and keep 15 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0260.dat');
      const content: string = 'payload-0260-qr';
      logCase('testFileCache0260', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(15);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0260_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0260_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0261
     * @tc.name      testFileCache0261
     * @tc.desc      Rename cacheitem_0261 and keep 16 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0261.dat');
      const content: string = 'payload-0261-qqr';
      logCase('testFileCache0261', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(16);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0261_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0261_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0262
     * @tc.name      testFileCache0262
     * @tc.desc      Rename cacheitem_0262 and keep 17 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0262.dat');
      const content: string = 'payload-0262-qqqr';
      logCase('testFileCache0262', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(17);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0262_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0262_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0263
     * @tc.name      testFileCache0263
     * @tc.desc      Rename cacheitem_0263 and keep 18 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0263.dat');
      const content: string = 'payload-0263-qqqqr';
      logCase('testFileCache0263', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(18);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0263_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0263_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0264
     * @tc.name      testFileCache0264
     * @tc.desc      Rename cacheitem_0264 and keep 20 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0264.dat');
      const content: string = 'payload-0264-qqqqqrr';
      logCase('testFileCache0264', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(20);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0264_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0264_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0265
     * @tc.name      testFileCache0265
     * @tc.desc      Rename cacheitem_0265 and keep 21 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0265.dat');
      const content: string = 'payload-0265-qqqqqqrr';
      logCase('testFileCache0265', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(21);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0265_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0265_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0266
     * @tc.name      testFileCache0266
     * @tc.desc      Rename cacheitem_0266 and keep 15 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0266.dat');
      const content: string = 'payload-0266-rr';
      logCase('testFileCache0266', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(15);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0266_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0266_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0267
     * @tc.name      testFileCache0267
     * @tc.desc      Rename cacheitem_0267 and keep 16 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0267.dat');
      const content: string = 'payload-0267-qrr';
      logCase('testFileCache0267', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(16);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0267_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0267_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0268
     * @tc.name      testFileCache0268
     * @tc.desc      Rename cacheitem_0268 and keep 18 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0268.dat');
      const content: string = 'payload-0268-qqrrr';
      logCase('testFileCache0268', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(18);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0268_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0268_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0269
     * @tc.name      testFileCache0269
     * @tc.desc      Rename cacheitem_0269 and keep 19 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0269.dat');
      const content: string = 'payload-0269-qqqrrr';
      logCase('testFileCache0269', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(19);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0269_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0269_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0270
     * @tc.name      testFileCache0270
     * @tc.desc      Rename cacheitem_0270 and keep 20 bytes readable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0270.dat');
      const content: string = 'payload-0270-qqqqrrr';
      logCase('testFileCache0270', `path=${path} bytes=${content.length}`);
      try {
        writeText(path, content);
        fs.renameSync(path, path + '.moved');
        expect(fs.accessSync(path)).assertFalse();
        expect(fs.accessSync(path + '.moved')).assertTrue();
        expect(fs.readTextSync(path + '.moved')).assertEqual(content);
        expect(fs.statSync(path + '.moved').size).assertEqual(20);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0270_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0270_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0271
     * @tc.name      testFileCache0271
     * @tc.desc      Create nested folder storage for cacheitem_0271 with 21 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0271.bin');
      const content: string = 'payload-0271-qqqqqrrr';
      logCase('testFileCache0271', `path=${path} bytes=${content.length}`);
      try {
        const folder: string = dirPath('cacheitem_0271_dir');
        if (!fs.accessSync(folder)) {
          fs.mkdirSync(folder);
        }
        const nested: string = folder + '/inner.dat';
        writeText(nested, content);
        expect(fs.accessSync(folder)).assertTrue();
        expect(fs.statSync(folder).isDirectory()).assertTrue();
        expect(fs.statSync(nested).size).assertEqual(21);
        expect(fs.readTextSync(nested)).assertEqual(content);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0271_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0271_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0272
     * @tc.name      testFileCache0272
     * @tc.desc      Create nested folder storage for cacheitem_0272 with 19 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0272.bin');
      const content: string = 'payload-0272-qqqqqq';
      logCase('testFileCache0272', `path=${path} bytes=${content.length}`);
      try {
        const folder: string = dirPath('cacheitem_0272_dir');
        if (!fs.accessSync(folder)) {
          fs.mkdirSync(folder);
        }
        const nested: string = folder + '/inner.dat';
        writeText(nested, content);
        expect(fs.accessSync(folder)).assertTrue();
        expect(fs.statSync(folder).isDirectory()).assertTrue();
        expect(fs.statSync(nested).size).assertEqual(19);
        expect(fs.readTextSync(nested)).assertEqual(content);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0272_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0272_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0273
     * @tc.name      testFileCache0273
     * @tc.desc      Create nested folder storage for cacheitem_0273 with 13 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0273.bin');
      const content: string = 'payload-0273-';
      logCase('testFileCache0273', `path=${path} bytes=${content.length}`);
      try {
        const folder: string = dirPath('cacheitem_0273_dir');
        if (!fs.accessSync(folder)) {
          fs.mkdirSync(folder);
        }
        const nested: string = folder + '/inner.dat';
        writeText(nested, content);
        expect(fs.accessSync(folder)).assertTrue();
        expect(fs.statSync(folder).isDirectory()).assertTrue();
        expect(fs.statSync(nested).size).assertEqual(13);
        expect(fs.readTextSync(nested)).assertEqual(content);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0273_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0273_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0274
     * @tc.name      testFileCache0274
     * @tc.desc      Create nested folder storage for cacheitem_0274 with 14 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0274.bin');
      const content: string = 'payload-0274-q';
      logCase('testFileCache0274', `path=${path} bytes=${content.length}`);
      try {
        const folder: string = dirPath('cacheitem_0274_dir');
        if (!fs.accessSync(folder)) {
          fs.mkdirSync(folder);
        }
        const nested: string = folder + '/inner.dat';
        writeText(nested, content);
        expect(fs.accessSync(folder)).assertTrue();
        expect(fs.statSync(folder).isDirectory()).assertTrue();
        expect(fs.statSync(nested).size).assertEqual(14);
        expect(fs.readTextSync(nested)).assertEqual(content);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0274_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0274_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0275
     * @tc.name      testFileCache0275
     * @tc.desc      Create nested folder storage for cacheitem_0275 with 15 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0275.bin');
      const content: string = 'payload-0275-qq';
      logCase('testFileCache0275', `path=${path} bytes=${content.length}`);
      try {
        const folder: string = dirPath('cacheitem_0275_dir');
        if (!fs.accessSync(folder)) {
          fs.mkdirSync(folder);
        }
        const nested: string = folder + '/inner.dat';
        writeText(nested, content);
        expect(fs.accessSync(folder)).assertTrue();
        expect(fs.statSync(folder).isDirectory()).assertTrue();
        expect(fs.statSync(nested).size).assertEqual(15);
        expect(fs.readTextSync(nested)).assertEqual(content);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0275_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0275_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0276
     * @tc.name      testFileCache0276
     * @tc.desc      Create nested folder storage for cacheitem_0276 with 17 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0276.bin');
      const content: string = 'payload-0276-qqqr';
      logCase('testFileCache0276', `path=${path} bytes=${content.length}`);
      try {
        const folder: string = dirPath('cacheitem_0276_dir');
        if (!fs.accessSync(folder)) {
          fs.mkdirSync(folder);
        }
        const nested: string = folder + '/inner.dat';
        writeText(nested, content);
        expect(fs.accessSync(folder)).assertTrue();
        expect(fs.statSync(folder).isDirectory()).assertTrue();
        expect(fs.statSync(nested).size).assertEqual(17);
        expect(fs.readTextSync(nested)).assertEqual(content);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0276_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0276_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0277
     * @tc.name      testFileCache0277
     * @tc.desc      Create nested folder storage for cacheitem_0277 with 18 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileCache0277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const path: string = testPath('cacheitem_0277.bin');
      const content: string = 'payload-0277-qqqqr';
      logCase('testFileCache0277', `path=${path} bytes=${content.length}`);
      try {
        const folder: string = dirPath('cacheitem_0277_dir');
        if (!fs.accessSync(folder)) {
          fs.mkdirSync(folder);
        }
        const nested: string = folder + '/inner.dat';
        writeText(nested, content);
        expect(fs.accessSync(folder)).assertTrue();
        expect(fs.statSync(folder).isDirectory()).assertTrue();
        expect(fs.statSync(nested).size).assertEqual(18);
        expect(fs.readTextSync(nested)).assertEqual(content);      } finally {
        const leftovers: string[] = [path, path + '.copy', path + '.moved',
          dirPath('cacheitem_0277_dir') + '/inner.dat'];
        leftovers.forEach((item: string) => {
          if (fs.accessSync(item)) {
            fs.unlinkSync(item);
          }
        });
        const folder: string = dirPath('cacheitem_0277_dir');
        if (fs.accessSync(folder)) {
          fs.rmdirSync(folder);
        }
      }
      expect(fs.accessSync(path)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_FILECACHE_0278
     * @tc.name      testFileCache0278
     * @tc.desc      Create nested folder storage for cacheitem_0278 with 19 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
