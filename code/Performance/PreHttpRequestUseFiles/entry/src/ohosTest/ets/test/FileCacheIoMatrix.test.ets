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
