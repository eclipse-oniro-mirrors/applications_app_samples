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
import { appContext, writeText } from './shared/Probe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

export default function cachePathMatrixTest() {
  describe('CachePathMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0001
     * @tc.name      testCachePath0001
     * @tc.desc      Count snap_0001.jpg cache name length and sandbox write of 12 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0001.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0001-p';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0001', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(12);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(12);
        expect(checksum).assertEqual(895);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(13);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(9);
        expect(name.substring(9)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(11)).assertEqual(112);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0002
     * @tc.name      testCachePath0002
     * @tc.desc      Count snap_0002.webp cache name length and sandbox write of 13 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0002.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0002-pp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0002', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(13);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(13);
        expect(checksum).assertEqual(1008);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(9);
        expect(name.substring(9)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(12)).assertEqual('p');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0003
     * @tc.name      testCachePath0003
     * @tc.desc      Count snap_0003.bin cache name length and sandbox write of 15 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0003.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0003-pppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0003', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(15);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(15);
        expect(checksum).assertEqual(1243);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(13);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(9);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(14)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0004
     * @tc.name      testCachePath0004
     * @tc.desc      Count snap_0004.cache cache name length and sandbox write of 16 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0004.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0004-ppppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0004', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(16);
        expect(checksum).assertEqual(1356);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(15)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0005
     * @tc.name      testCachePath0005
     * @tc.desc      Count snap_0005.dat cache name length and sandbox write of 17 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0005.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0005-pppppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0005', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(17);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(17);
        expect(checksum).assertEqual(1469);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(13);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(9);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(16)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0006
     * @tc.name      testCachePath0006
     * @tc.desc      Count snap_0006.png cache name length and sandbox write of 19 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0006.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0006-ppppppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0006', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(19);
        expect(checksum).assertEqual(1704);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(13);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(9);
        expect(name.substring(9)).assertEqual('.png');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(18)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0007
     * @tc.name      testCachePath0007
     * @tc.desc      Count snap_0007.jpg cache name length and sandbox write of 20 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0007.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0007-pppppppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0007', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(20);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(20);
        expect(checksum).assertEqual(1817);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(13);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(9);
        expect(name.substring(9)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(19)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0008
     * @tc.name      testCachePath0008
     * @tc.desc      Count snap_0008.webp cache name length and sandbox write of 21 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0008.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0008-ppppppppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0008', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(21);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(21);
        expect(checksum).assertEqual(1930);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(9);
        expect(name.substring(9)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(20)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0009
     * @tc.name      testCachePath0009
     * @tc.desc      Count snap_0009.bin cache name length and sandbox write of 14 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0009.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0009-zzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0009', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(14);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(14);
        expect(checksum).assertEqual(1157);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(13);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(9);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(13)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0010
     * @tc.name      testCachePath0010
     * @tc.desc      Count snap_0010.cache cache name length and sandbox write of 15 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0010.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0010-pzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0010', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(15);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(15);
        expect(checksum).assertEqual(1261);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(14)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0011
     * @tc.name      testCachePath0011
     * @tc.desc      Count snap_0011.dat cache name length and sandbox write of 16 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0011.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0011-ppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0011', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(16);
        expect(checksum).assertEqual(1374);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(13);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(9);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(15)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0012
     * @tc.name      testCachePath0012
     * @tc.desc      Count snap_0012.png cache name length and sandbox write of 18 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0012.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0012-pppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0012', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(18);
        expect(checksum).assertEqual(1609);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(13);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(9);
        expect(name.substring(9)).assertEqual('.png');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(17)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0013
     * @tc.name      testCachePath0013
     * @tc.desc      Count snap_0013.jpg cache name length and sandbox write of 19 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0013.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0013-ppppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0013', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(19);
        expect(checksum).assertEqual(1722);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(13);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(9);
        expect(name.substring(9)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(18)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0014
     * @tc.name      testCachePath0014
     * @tc.desc      Count snap_0014.webp cache name length and sandbox write of 20 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0014.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0014-pppppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0014', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(20);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(20);
        expect(checksum).assertEqual(1835);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(9);
        expect(name.substring(9)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(19)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0015
     * @tc.name      testCachePath0015
     * @tc.desc      Count snap_0015.bin cache name length and sandbox write of 17 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0015.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0015-pppppp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0015', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(17);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(17);
        expect(checksum).assertEqual(1460);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(13);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(9);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(16)).assertEqual('p');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0016
     * @tc.name      testCachePath0016
     * @tc.desc      Count snap_0016.cache cache name length and sandbox write of 18 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0016.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0016-ppppppp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0016', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(18);
        expect(checksum).assertEqual(1573);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(17)).assertEqual(112);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0017
     * @tc.name      testCachePath0017
     * @tc.desc      Count snap_0017.dat cache name length and sandbox write of 19 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0017.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0017-pppppppp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0017', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(19);
        expect(checksum).assertEqual(1686);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(13);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(9);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(18)).assertEqual('p');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0018
     * @tc.name      testCachePath0018
     * @tc.desc      Count snap_0018.png cache name length and sandbox write of 12 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0018.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0018-z';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0018', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(12);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(12);
        expect(checksum).assertEqual(913);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(13);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(9);
        expect(name.substring(9)).assertEqual('.png');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(11)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0019
     * @tc.name      testCachePath0019
     * @tc.desc      Count snap_0019.jpg cache name length and sandbox write of 13 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0019.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0019-pz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0019', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(13);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(13);
        expect(checksum).assertEqual(1026);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(13);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(9);
        expect(name.substring(9)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(12)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0020
     * @tc.name      testCachePath0020
     * @tc.desc      Count snap_0020.webp cache name length and sandbox write of 14 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0020.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0020-ppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0020', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(14);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(14);
        expect(checksum).assertEqual(1130);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(9);
        expect(name.substring(9)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(13)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0021
     * @tc.name      testCachePath0021
     * @tc.desc      Count snap_0021.bin cache name length and sandbox write of 16 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0021.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0021-pppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0021', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(16);
        expect(checksum).assertEqual(1365);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(13);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(9);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(15)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0022
     * @tc.name      testCachePath0022
     * @tc.desc      Count snap_0022.cache cache name length and sandbox write of 17 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0022.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0022-ppppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0022', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(17);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(17);
        expect(checksum).assertEqual(1478);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(16)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0023
     * @tc.name      testCachePath0023
     * @tc.desc      Count snap_0023.dat cache name length and sandbox write of 18 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0023.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0023-pppppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0023', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(18);
        expect(checksum).assertEqual(1591);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(13);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(9);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(17)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0024
     * @tc.name      testCachePath0024
     * @tc.desc      Count snap_0024.png cache name length and sandbox write of 20 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0024.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0024-ppppppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0024', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(20);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(20);
        expect(checksum).assertEqual(1826);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(13);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(9);
        expect(name.substring(9)).assertEqual('.png');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(19)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0025
     * @tc.name      testCachePath0025
     * @tc.desc      Count snap_0025.jpg cache name length and sandbox write of 21 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0025.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0025-pppppppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0025', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(21);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(21);
        expect(checksum).assertEqual(1939);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(13);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(9);
        expect(name.substring(9)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(20)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0026
     * @tc.name      testCachePath0026
     * @tc.desc      Count snap_0026.bin cache name length and sandbox write of 22 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0026.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0026-ppppppppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0026', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(22);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(22);
        expect(checksum).assertEqual(2052);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(13);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(9);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(21)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0027
     * @tc.name      testCachePath0027
     * @tc.desc      Count snap_0027.cache cache name length and sandbox write of 15 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0027.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0027-zzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0027', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(15);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(15);
        expect(checksum).assertEqual(1279);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(14)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0028
     * @tc.name      testCachePath0028
     * @tc.desc      Count snap_0028.dat cache name length and sandbox write of 16 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0028.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0028-pzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0028', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(16);
        expect(checksum).assertEqual(1392);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(13);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(9);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(15)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0029
     * @tc.name      testCachePath0029
     * @tc.desc      Count snap_0029.png cache name length and sandbox write of 17 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0029.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0029-ppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0029', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(17);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(17);
        expect(checksum).assertEqual(1505);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(13);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(9);
        expect(name.substring(9)).assertEqual('.png');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(16)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0030
     * @tc.name      testCachePath0030
     * @tc.desc      Count snap_0030.jpg cache name length and sandbox write of 14 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0030.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0030-ppp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0030', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(14);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(14);
        expect(checksum).assertEqual(1121);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(13);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(9);
        expect(name.substring(9)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(13)).assertEqual(112);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0031
     * @tc.name      testCachePath0031
     * @tc.desc      Count snap_0031.webp cache name length and sandbox write of 15 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0031.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0031-pppp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0031', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(15);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(15);
        expect(checksum).assertEqual(1234);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(9);
        expect(name.substring(9)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(14)).assertEqual('p');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0032
     * @tc.name      testCachePath0032
     * @tc.desc      Count snap_0032.bin cache name length and sandbox write of 16 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0032.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0032-ppppp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0032', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(16);
        expect(checksum).assertEqual(1347);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(13);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(9);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(15)).assertEqual(112);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0033
     * @tc.name      testCachePath0033
     * @tc.desc      Count snap_0033.cache cache name length and sandbox write of 18 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'snap_0033.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0033-ppppppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0033', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(18);
        expect(checksum).assertEqual(1582);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(17)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0034
     * @tc.name      testCachePath0034
     * @tc.desc      Count thumb_0034.dat cache name length and sandbox write of 19 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0034.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0034-pppppppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0034', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(19);
        expect(checksum).assertEqual(1695);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(18)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0035
     * @tc.name      testCachePath0035
     * @tc.desc      Count thumb_0035.png cache name length and sandbox write of 20 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0035.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0035-ppppppppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0035', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(20);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(20);
        expect(checksum).assertEqual(1808);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.png');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(19)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0036
     * @tc.name      testCachePath0036
     * @tc.desc      Count thumb_0036.jpg cache name length and sandbox write of 13 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0036.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0036-zz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0036', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(13);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(13);
        expect(checksum).assertEqual(1035);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(12)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0037
     * @tc.name      testCachePath0037
     * @tc.desc      Count thumb_0037.webp cache name length and sandbox write of 14 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0037.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0037-pzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0037', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(14);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(14);
        expect(checksum).assertEqual(1148);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(13)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0038
     * @tc.name      testCachePath0038
     * @tc.desc      Count thumb_0038.bin cache name length and sandbox write of 15 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0038.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0038-ppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0038', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(15);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(15);
        expect(checksum).assertEqual(1261);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(14)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0039
     * @tc.name      testCachePath0039
     * @tc.desc      Count thumb_0039.cache cache name length and sandbox write of 17 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0039.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0039-pppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0039', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(17);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(17);
        expect(checksum).assertEqual(1496);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(16);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(16)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0040
     * @tc.name      testCachePath0040
     * @tc.desc      Count thumb_0040.dat cache name length and sandbox write of 18 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0040.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0040-ppppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0040', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(18);
        expect(checksum).assertEqual(1600);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(17)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0041
     * @tc.name      testCachePath0041
     * @tc.desc      Count thumb_0041.png cache name length and sandbox write of 19 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0041.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0041-pppppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0041', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(19);
        expect(checksum).assertEqual(1713);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.png');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(18)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0042
     * @tc.name      testCachePath0042
     * @tc.desc      Count thumb_0042.jpg cache name length and sandbox write of 21 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0042.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0042-ppppppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0042', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(21);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(21);
        expect(checksum).assertEqual(1948);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(20)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0043
     * @tc.name      testCachePath0043
     * @tc.desc      Count thumb_0043.webp cache name length and sandbox write of 22 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0043.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0043-pppppppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0043', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(22);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(22);
        expect(checksum).assertEqual(2061);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(21)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0044
     * @tc.name      testCachePath0044
     * @tc.desc      Count thumb_0044.bin cache name length and sandbox write of 23 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0044.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0044-ppppppppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0044', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(23);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(23);
        expect(checksum).assertEqual(2174);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(22)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0045
     * @tc.name      testCachePath0045
     * @tc.desc      Count thumb_0045.cache cache name length and sandbox write of 11 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0045.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0045-';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0045', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(11);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(11);
        expect(checksum).assertEqual(791);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(16);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(10)).assertEqual('-');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0046
     * @tc.name      testCachePath0046
     * @tc.desc      Count thumb_0046.dat cache name length and sandbox write of 12 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0046.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0046-p';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0046', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(12);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(12);
        expect(checksum).assertEqual(904);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(11)).assertEqual(112);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0047
     * @tc.name      testCachePath0047
     * @tc.desc      Count thumb_0047.png cache name length and sandbox write of 13 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0047.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0047-pp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0047', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(13);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(13);
        expect(checksum).assertEqual(1017);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.png');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(12)).assertEqual('p');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0048
     * @tc.name      testCachePath0048
     * @tc.desc      Count thumb_0048.jpg cache name length and sandbox write of 15 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0048.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0048-pppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0048', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(15);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(15);
        expect(checksum).assertEqual(1252);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(14)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0049
     * @tc.name      testCachePath0049
     * @tc.desc      Count thumb_0049.webp cache name length and sandbox write of 16 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0049.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0049-ppppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0049', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(16);
        expect(checksum).assertEqual(1365);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(15)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0050
     * @tc.name      testCachePath0050
     * @tc.desc      Count thumb_0050.bin cache name length and sandbox write of 17 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0050.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0050-pppppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0050', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(17);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(17);
        expect(checksum).assertEqual(1469);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(16)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0051
     * @tc.name      testCachePath0051
     * @tc.desc      Count thumb_0051.cache cache name length and sandbox write of 19 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0051.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0051-ppppppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0051', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(19);
        expect(checksum).assertEqual(1704);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(16);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(18)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0052
     * @tc.name      testCachePath0052
     * @tc.desc      Count thumb_0052.png cache name length and sandbox write of 20 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0052.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0052-pppppppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0052', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(20);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(20);
        expect(checksum).assertEqual(1817);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.png');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(19)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0053
     * @tc.name      testCachePath0053
     * @tc.desc      Count thumb_0053.jpg cache name length and sandbox write of 21 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0053.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0053-ppppppppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0053', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(21);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(21);
        expect(checksum).assertEqual(1930);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(20)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0054
     * @tc.name      testCachePath0054
     * @tc.desc      Count thumb_0054.webp cache name length and sandbox write of 14 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0054.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0054-zzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0054', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(14);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(14);
        expect(checksum).assertEqual(1157);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(13)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0055
     * @tc.name      testCachePath0055
     * @tc.desc      Count thumb_0055.bin cache name length and sandbox write of 15 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0055.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0055-pzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0055', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(15);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(15);
        expect(checksum).assertEqual(1270);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(14)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0056
     * @tc.name      testCachePath0056
     * @tc.desc      Count thumb_0056.cache cache name length and sandbox write of 16 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0056.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0056-ppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0056', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(16);
        expect(checksum).assertEqual(1383);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(16);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(15)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0057
     * @tc.name      testCachePath0057
     * @tc.desc      Count thumb_0057.dat cache name length and sandbox write of 18 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0057.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0057-pppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0057', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(18);
        expect(checksum).assertEqual(1618);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(17)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0058
     * @tc.name      testCachePath0058
     * @tc.desc      Count thumb_0058.png cache name length and sandbox write of 19 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0058.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0058-ppppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0058', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(19);
        expect(checksum).assertEqual(1731);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.png');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(18)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0059
     * @tc.name      testCachePath0059
     * @tc.desc      Count thumb_0059.jpg cache name length and sandbox write of 20 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0059.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0059-pppppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0059', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(20);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(20);
        expect(checksum).assertEqual(1844);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(19)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0060
     * @tc.name      testCachePath0060
     * @tc.desc      Count thumb_0060.webp cache name length and sandbox write of 17 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0060.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0060-pppppp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0060', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(17);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(17);
        expect(checksum).assertEqual(1460);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(16)).assertEqual('p');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0061
     * @tc.name      testCachePath0061
     * @tc.desc      Count thumb_0061.bin cache name length and sandbox write of 18 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0061.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0061-ppppppp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0061', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(18);
        expect(checksum).assertEqual(1573);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(17)).assertEqual(112);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0062
     * @tc.name      testCachePath0062
     * @tc.desc      Count thumb_0062.cache cache name length and sandbox write of 19 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0062.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0062-pppppppp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0062', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(19);
        expect(checksum).assertEqual(1686);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(16);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(18)).assertEqual('p');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0063
     * @tc.name      testCachePath0063
     * @tc.desc      Count thumb_0063.dat cache name length and sandbox write of 12 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0063.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0063-z';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0063', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(12);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(12);
        expect(checksum).assertEqual(913);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(11)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0064
     * @tc.name      testCachePath0064
     * @tc.desc      Count thumb_0064.png cache name length and sandbox write of 13 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0064.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0064-pz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0064', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(13);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(13);
        expect(checksum).assertEqual(1026);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.png');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(12)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0065
     * @tc.name      testCachePath0065
     * @tc.desc      Count thumb_0065.jpg cache name length and sandbox write of 14 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0065.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0065-ppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0065', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(14);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(14);
        expect(checksum).assertEqual(1139);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(13)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0066
     * @tc.name      testCachePath0066
     * @tc.desc      Count thumb_0066.webp cache name length and sandbox write of 16 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'thumb_0066.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0066-pppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0066', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(16);
        expect(checksum).assertEqual(1374);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(15)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0067
     * @tc.name      testCachePath0067
     * @tc.desc      Count poster_0067.bin cache name length and sandbox write of 17 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0067.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0067-ppppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0067', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(17);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(17);
        expect(checksum).assertEqual(1487);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(11);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(16)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0068
     * @tc.name      testCachePath0068
     * @tc.desc      Count poster_0068.cache cache name length and sandbox write of 18 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0068.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0068-pppppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0068', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(18);
        expect(checksum).assertEqual(1600);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(17);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(17)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0069
     * @tc.name      testCachePath0069
     * @tc.desc      Count poster_0069.dat cache name length and sandbox write of 20 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0069.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0069-ppppppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0069', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(20);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(20);
        expect(checksum).assertEqual(1835);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(11);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(19)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0070
     * @tc.name      testCachePath0070
     * @tc.desc      Count poster_0070.png cache name length and sandbox write of 21 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0070.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0070-pppppppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0070', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(21);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(21);
        expect(checksum).assertEqual(1939);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(11);
        expect(name.substring(11)).assertEqual('.png');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(20)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0071
     * @tc.name      testCachePath0071
     * @tc.desc      Count poster_0071.jpg cache name length and sandbox write of 22 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0071.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0071-ppppppppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0071', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(22);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(22);
        expect(checksum).assertEqual(2052);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(11);
        expect(name.substring(11)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(21)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0072
     * @tc.name      testCachePath0072
     * @tc.desc      Count poster_0072.webp cache name length and sandbox write of 15 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0072.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0072-zzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0072', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(15);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(15);
        expect(checksum).assertEqual(1279);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(16);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(11);
        expect(name.substring(11)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(14)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0073
     * @tc.name      testCachePath0073
     * @tc.desc      Count poster_0073.bin cache name length and sandbox write of 16 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0073.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0073-pzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0073', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(16);
        expect(checksum).assertEqual(1392);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(11);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(15)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0074
     * @tc.name      testCachePath0074
     * @tc.desc      Count poster_0074.cache cache name length and sandbox write of 17 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0074.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0074-ppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0074', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(17);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(17);
        expect(checksum).assertEqual(1505);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(17);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(16)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0075
     * @tc.name      testCachePath0075
     * @tc.desc      Count poster_0075.dat cache name length and sandbox write of 14 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0075.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0075-ppp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0075', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(14);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(14);
        expect(checksum).assertEqual(1130);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(11);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(13)).assertEqual(112);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0076
     * @tc.name      testCachePath0076
     * @tc.desc      Count poster_0076.png cache name length and sandbox write of 15 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0076.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0076-pppp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0076', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(15);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(15);
        expect(checksum).assertEqual(1243);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(11);
        expect(name.substring(11)).assertEqual('.png');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(14)).assertEqual('p');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0077
     * @tc.name      testCachePath0077
     * @tc.desc      Count poster_0077.jpg cache name length and sandbox write of 16 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0077.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0077-ppppp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0077', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(16);
        expect(checksum).assertEqual(1356);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(11);
        expect(name.substring(11)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(15)).assertEqual(112);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0078
     * @tc.name      testCachePath0078
     * @tc.desc      Count poster_0078.bin cache name length and sandbox write of 18 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0078.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0078-ppppppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0078', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(18);
        expect(checksum).assertEqual(1591);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(11);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(17)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0079
     * @tc.name      testCachePath0079
     * @tc.desc      Count poster_0079.cache cache name length and sandbox write of 19 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0079.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0079-pppppppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0079', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(19);
        expect(checksum).assertEqual(1704);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(17);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(18)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0080
     * @tc.name      testCachePath0080
     * @tc.desc      Count poster_0080.dat cache name length and sandbox write of 20 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0080.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0080-ppppppppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0080', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(20);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(20);
        expect(checksum).assertEqual(1808);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(11);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(19)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0081
     * @tc.name      testCachePath0081
     * @tc.desc      Count poster_0081.png cache name length and sandbox write of 13 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0081.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0081-zz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0081', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(13);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(13);
        expect(checksum).assertEqual(1035);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(11);
        expect(name.substring(11)).assertEqual('.png');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(12)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0082
     * @tc.name      testCachePath0082
     * @tc.desc      Count poster_0082.jpg cache name length and sandbox write of 14 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0082.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0082-pzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0082', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(14);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(14);
        expect(checksum).assertEqual(1148);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(11);
        expect(name.substring(11)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(13)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0083
     * @tc.name      testCachePath0083
     * @tc.desc      Count poster_0083.webp cache name length and sandbox write of 15 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0083.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0083-ppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0083', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(15);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(15);
        expect(checksum).assertEqual(1261);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(16);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(11);
        expect(name.substring(11)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(14)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0084
     * @tc.name      testCachePath0084
     * @tc.desc      Count poster_0084.bin cache name length and sandbox write of 17 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0084.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0084-pppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0084', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(17);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(17);
        expect(checksum).assertEqual(1496);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(11);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(16)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0085
     * @tc.name      testCachePath0085
     * @tc.desc      Count poster_0085.cache cache name length and sandbox write of 18 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0085.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0085-ppppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0085', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(18);
        expect(checksum).assertEqual(1609);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(17);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(17)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0086
     * @tc.name      testCachePath0086
     * @tc.desc      Count poster_0086.dat cache name length and sandbox write of 19 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0086.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0086-pppppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0086', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(19);
        expect(checksum).assertEqual(1722);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(11);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(18)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0087
     * @tc.name      testCachePath0087
     * @tc.desc      Count poster_0087.png cache name length and sandbox write of 21 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0087.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0087-ppppppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0087', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(21);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(21);
        expect(checksum).assertEqual(1957);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(11);
        expect(name.substring(11)).assertEqual('.png');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(20)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0088
     * @tc.name      testCachePath0088
     * @tc.desc      Count poster_0088.jpg cache name length and sandbox write of 22 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0088.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0088-pppppppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0088', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(22);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(22);
        expect(checksum).assertEqual(2070);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(11);
        expect(name.substring(11)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(21)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0089
     * @tc.name      testCachePath0089
     * @tc.desc      Count poster_0089.webp cache name length and sandbox write of 23 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0089.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0089-ppppppppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0089', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(23);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(23);
        expect(checksum).assertEqual(2183);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(16);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(11);
        expect(name.substring(11)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(22)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0090
     * @tc.name      testCachePath0090
     * @tc.desc      Count poster_0090.bin cache name length and sandbox write of 11 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCachePath0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0090.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0090-';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0090', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(11);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(11);
        expect(checksum).assertEqual(791);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(11);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(10)).assertEqual('-');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0091
     * @tc.name      testCachePath0091
     * @tc.desc      Count poster_0091.cache cache name length and sandbox write of 12 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0091.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0091-p';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0091', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(12);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(12);
        expect(checksum).assertEqual(904);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(17);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(11)).assertEqual(112);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0092
     * @tc.name      testCachePath0092
     * @tc.desc      Count poster_0092.dat cache name length and sandbox write of 13 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0092.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0092-pp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0092', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(13);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(13);
        expect(checksum).assertEqual(1017);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(11);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(12)).assertEqual('p');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0093
     * @tc.name      testCachePath0093
     * @tc.desc      Count poster_0093.png cache name length and sandbox write of 15 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0093.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0093-pppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0093', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(15);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(15);
        expect(checksum).assertEqual(1252);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(11);
        expect(name.substring(11)).assertEqual('.png');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(14)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0094
     * @tc.name      testCachePath0094
     * @tc.desc      Count poster_0094.jpg cache name length and sandbox write of 16 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0094.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0094-ppppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0094', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(16);
        expect(checksum).assertEqual(1365);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(11);
        expect(name.substring(11)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(15)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0095
     * @tc.name      testCachePath0095
     * @tc.desc      Count poster_0095.webp cache name length and sandbox write of 17 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0095.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0095-pppppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0095', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(17);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(17);
        expect(checksum).assertEqual(1478);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(16);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(11);
        expect(name.substring(11)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(16)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0096
     * @tc.name      testCachePath0096
     * @tc.desc      Count poster_0096.bin cache name length and sandbox write of 19 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0096.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0096-ppppppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0096', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(19);
        expect(checksum).assertEqual(1713);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(11);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(18)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0097
     * @tc.name      testCachePath0097
     * @tc.desc      Count poster_0097.cache cache name length and sandbox write of 20 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0097.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0097-pppppppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0097', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(20);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(20);
        expect(checksum).assertEqual(1826);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(17);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(19)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0098
     * @tc.name      testCachePath0098
     * @tc.desc      Count poster_0098.dat cache name length and sandbox write of 21 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0098.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0098-ppppppppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0098', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(21);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(21);
        expect(checksum).assertEqual(1939);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(11);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(20)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0099
     * @tc.name      testCachePath0099
     * @tc.desc      Count poster_0099.png cache name length and sandbox write of 14 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'poster_0099.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0099-zzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0099', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(14);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(14);
        expect(checksum).assertEqual(1166);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(11);
        expect(name.substring(11)).assertEqual('.png');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(13)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0100
     * @tc.name      testCachePath0100
     * @tc.desc      Count cover_0100.jpg cache name length and sandbox write of 15 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0100.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0100-pzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0100', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(15);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(15);
        expect(checksum).assertEqual(1261);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(14)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0101
     * @tc.name      testCachePath0101
     * @tc.desc      Count cover_0101.webp cache name length and sandbox write of 16 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0101.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0101-ppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0101', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(16);
        expect(checksum).assertEqual(1374);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(15)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0102
     * @tc.name      testCachePath0102
     * @tc.desc      Count cover_0102.bin cache name length and sandbox write of 18 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0102.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0102-pppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0102', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(18);
        expect(checksum).assertEqual(1609);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(17)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0103
     * @tc.name      testCachePath0103
     * @tc.desc      Count cover_0103.cache cache name length and sandbox write of 19 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0103.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0103-ppppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0103', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(19);
        expect(checksum).assertEqual(1722);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(16);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(18)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0104
     * @tc.name      testCachePath0104
     * @tc.desc      Count cover_0104.png cache name length and sandbox write of 20 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0104.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0104-pppppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0104', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(20);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(20);
        expect(checksum).assertEqual(1835);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.png');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(19)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0105
     * @tc.name      testCachePath0105
     * @tc.desc      Count cover_0105.jpg cache name length and sandbox write of 17 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0105.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0105-pppppp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0105', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(17);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(17);
        expect(checksum).assertEqual(1460);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(16)).assertEqual('p');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0106
     * @tc.name      testCachePath0106
     * @tc.desc      Count cover_0106.webp cache name length and sandbox write of 18 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0106.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0106-ppppppp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0106', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(18);
        expect(checksum).assertEqual(1573);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(17)).assertEqual(112);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0107
     * @tc.name      testCachePath0107
     * @tc.desc      Count cover_0107.bin cache name length and sandbox write of 19 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0107.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0107-pppppppp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0107', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(19);
        expect(checksum).assertEqual(1686);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(18)).assertEqual('p');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0108
     * @tc.name      testCachePath0108
     * @tc.desc      Count cover_0108.cache cache name length and sandbox write of 12 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0108.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0108-z';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0108', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(12);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(12);
        expect(checksum).assertEqual(913);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(16);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(11)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0109
     * @tc.name      testCachePath0109
     * @tc.desc      Count cover_0109.dat cache name length and sandbox write of 13 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0109.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0109-pz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0109', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(13);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(13);
        expect(checksum).assertEqual(1026);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(12)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0110
     * @tc.name      testCachePath0110
     * @tc.desc      Count cover_0110.png cache name length and sandbox write of 14 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0110.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0110-ppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0110', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(14);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(14);
        expect(checksum).assertEqual(1130);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.png');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(13)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0111
     * @tc.name      testCachePath0111
     * @tc.desc      Count cover_0111.jpg cache name length and sandbox write of 16 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0111.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0111-pppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0111', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(16);
        expect(checksum).assertEqual(1365);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(15)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0112
     * @tc.name      testCachePath0112
     * @tc.desc      Count cover_0112.webp cache name length and sandbox write of 17 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0112.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0112-ppppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0112', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(17);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(17);
        expect(checksum).assertEqual(1478);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(16)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0113
     * @tc.name      testCachePath0113
     * @tc.desc      Count cover_0113.bin cache name length and sandbox write of 18 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0113.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0113-pppppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0113', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(18);
        expect(checksum).assertEqual(1591);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(17)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0114
     * @tc.name      testCachePath0114
     * @tc.desc      Count cover_0114.cache cache name length and sandbox write of 20 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0114.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0114-ppppppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0114', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(20);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(20);
        expect(checksum).assertEqual(1826);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(16);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(19)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0115
     * @tc.name      testCachePath0115
     * @tc.desc      Count cover_0115.dat cache name length and sandbox write of 21 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0115.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0115-pppppppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0115', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(21);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(21);
        expect(checksum).assertEqual(1939);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(20)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0116
     * @tc.name      testCachePath0116
     * @tc.desc      Count cover_0116.png cache name length and sandbox write of 22 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0116.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0116-ppppppppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0116', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(22);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(22);
        expect(checksum).assertEqual(2052);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.png');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(21)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0117
     * @tc.name      testCachePath0117
     * @tc.desc      Count cover_0117.jpg cache name length and sandbox write of 15 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0117.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0117-zzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0117', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(15);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(15);
        expect(checksum).assertEqual(1279);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(14)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0118
     * @tc.name      testCachePath0118
     * @tc.desc      Count cover_0118.webp cache name length and sandbox write of 16 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0118.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0118-pzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0118', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(16);
        expect(checksum).assertEqual(1392);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(15)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0119
     * @tc.name      testCachePath0119
     * @tc.desc      Count cover_0119.bin cache name length and sandbox write of 17 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0119.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0119-ppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0119', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(17);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(17);
        expect(checksum).assertEqual(1505);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(16)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0120
     * @tc.name      testCachePath0120
     * @tc.desc      Count cover_0120.cache cache name length and sandbox write of 14 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0120.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0120-ppp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0120', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(14);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(14);
        expect(checksum).assertEqual(1121);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(16);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(13)).assertEqual(112);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0121
     * @tc.name      testCachePath0121
     * @tc.desc      Count cover_0121.dat cache name length and sandbox write of 15 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0121.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0121-pppp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0121', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(15);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(15);
        expect(checksum).assertEqual(1234);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(14)).assertEqual('p');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0122
     * @tc.name      testCachePath0122
     * @tc.desc      Count cover_0122.png cache name length and sandbox write of 16 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0122.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0122-ppppp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0122', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(16);
        expect(checksum).assertEqual(1347);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.png');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(15)).assertEqual(112);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0123
     * @tc.name      testCachePath0123
     * @tc.desc      Count cover_0123.jpg cache name length and sandbox write of 18 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0123.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0123-ppppppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0123', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(18);
        expect(checksum).assertEqual(1582);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(17)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0124
     * @tc.name      testCachePath0124
     * @tc.desc      Count cover_0124.webp cache name length and sandbox write of 19 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0124.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0124-pppppppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0124', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(19);
        expect(checksum).assertEqual(1695);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(18)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0125
     * @tc.name      testCachePath0125
     * @tc.desc      Count cover_0125.bin cache name length and sandbox write of 20 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0125.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0125-ppppppppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0125', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(20);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(20);
        expect(checksum).assertEqual(1808);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(19)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0126
     * @tc.name      testCachePath0126
     * @tc.desc      Count cover_0126.cache cache name length and sandbox write of 13 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0126.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0126-zz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0126', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(13);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(13);
        expect(checksum).assertEqual(1035);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(16);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(12)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0127
     * @tc.name      testCachePath0127
     * @tc.desc      Count cover_0127.dat cache name length and sandbox write of 14 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0127.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0127-pzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0127', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(14);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(14);
        expect(checksum).assertEqual(1148);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(13)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0128
     * @tc.name      testCachePath0128
     * @tc.desc      Count cover_0128.png cache name length and sandbox write of 15 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0128.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0128-ppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0128', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(15);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(15);
        expect(checksum).assertEqual(1261);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.png');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(14)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0129
     * @tc.name      testCachePath0129
     * @tc.desc      Count cover_0129.jpg cache name length and sandbox write of 17 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0129.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0129-pppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0129', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(17);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(17);
        expect(checksum).assertEqual(1496);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(16)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0130
     * @tc.name      testCachePath0130
     * @tc.desc      Count cover_0130.bin cache name length and sandbox write of 18 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0130.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0130-ppppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0130', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(18);
        expect(checksum).assertEqual(1600);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(17)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0131
     * @tc.name      testCachePath0131
     * @tc.desc      Count cover_0131.cache cache name length and sandbox write of 19 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0131.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0131-pppppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0131', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(19);
        expect(checksum).assertEqual(1713);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(16);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(18)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0132
     * @tc.name      testCachePath0132
     * @tc.desc      Count cover_0132.dat cache name length and sandbox write of 21 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'cover_0132.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0132-ppppppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0132', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(21);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(21);
        expect(checksum).assertEqual(1948);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(20)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0133
     * @tc.name      testCachePath0133
     * @tc.desc      Count frame_0133.png cache name length and sandbox write of 22 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0133.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0133-pppppppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0133', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(22);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(22);
        expect(checksum).assertEqual(2061);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.png');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(21)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0134
     * @tc.name      testCachePath0134
     * @tc.desc      Count frame_0134.jpg cache name length and sandbox write of 23 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0134.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0134-ppppppppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0134', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(23);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(23);
        expect(checksum).assertEqual(2174);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(22)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0135
     * @tc.name      testCachePath0135
     * @tc.desc      Count frame_0135.webp cache name length and sandbox write of 11 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0135.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0135-';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0135', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(11);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(11);
        expect(checksum).assertEqual(791);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(10)).assertEqual('-');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0136
     * @tc.name      testCachePath0136
     * @tc.desc      Count frame_0136.bin cache name length and sandbox write of 12 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0136.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0136-p';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0136', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(12);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(12);
        expect(checksum).assertEqual(904);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(11)).assertEqual(112);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0137
     * @tc.name      testCachePath0137
     * @tc.desc      Count frame_0137.cache cache name length and sandbox write of 13 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0137.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0137-pp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0137', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(13);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(13);
        expect(checksum).assertEqual(1017);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(16);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(12)).assertEqual('p');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0138
     * @tc.name      testCachePath0138
     * @tc.desc      Count frame_0138.dat cache name length and sandbox write of 15 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0138.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0138-pppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0138', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(15);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(15);
        expect(checksum).assertEqual(1252);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(14)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0139
     * @tc.name      testCachePath0139
     * @tc.desc      Count frame_0139.png cache name length and sandbox write of 16 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0139.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0139-ppppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0139', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(16);
        expect(checksum).assertEqual(1365);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.png');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(15)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0140
     * @tc.name      testCachePath0140
     * @tc.desc      Count frame_0140.jpg cache name length and sandbox write of 17 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0140.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0140-pppppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0140', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(17);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(17);
        expect(checksum).assertEqual(1469);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(16)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0141
     * @tc.name      testCachePath0141
     * @tc.desc      Count frame_0141.webp cache name length and sandbox write of 19 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0141.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0141-ppppppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0141', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(19);
        expect(checksum).assertEqual(1704);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(18)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0142
     * @tc.name      testCachePath0142
     * @tc.desc      Count frame_0142.bin cache name length and sandbox write of 20 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0142.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0142-pppppppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0142', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(20);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(20);
        expect(checksum).assertEqual(1817);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(19)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0143
     * @tc.name      testCachePath0143
     * @tc.desc      Count frame_0143.cache cache name length and sandbox write of 21 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0143.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0143-ppppppppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0143', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(21);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(21);
        expect(checksum).assertEqual(1930);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(16);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(20)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0144
     * @tc.name      testCachePath0144
     * @tc.desc      Count frame_0144.dat cache name length and sandbox write of 14 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0144.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0144-zzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0144', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(14);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(14);
        expect(checksum).assertEqual(1157);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(13)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0145
     * @tc.name      testCachePath0145
     * @tc.desc      Count frame_0145.png cache name length and sandbox write of 15 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0145.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0145-pzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0145', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(15);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(15);
        expect(checksum).assertEqual(1270);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.png');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(14)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0146
     * @tc.name      testCachePath0146
     * @tc.desc      Count frame_0146.jpg cache name length and sandbox write of 16 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0146.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0146-ppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0146', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(16);
        expect(checksum).assertEqual(1383);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(15)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0147
     * @tc.name      testCachePath0147
     * @tc.desc      Count frame_0147.webp cache name length and sandbox write of 18 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0147.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0147-pppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0147', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(18);
        expect(checksum).assertEqual(1618);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(17)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0148
     * @tc.name      testCachePath0148
     * @tc.desc      Count frame_0148.bin cache name length and sandbox write of 19 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0148.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0148-ppppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0148', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(19);
        expect(checksum).assertEqual(1731);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(18)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0149
     * @tc.name      testCachePath0149
     * @tc.desc      Count frame_0149.cache cache name length and sandbox write of 20 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0149.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0149-pppppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0149', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(20);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(20);
        expect(checksum).assertEqual(1844);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(16);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(19)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0150
     * @tc.name      testCachePath0150
     * @tc.desc      Count frame_0150.dat cache name length and sandbox write of 17 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0150.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0150-pppppp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0150', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(17);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(17);
        expect(checksum).assertEqual(1460);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(16)).assertEqual('p');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0151
     * @tc.name      testCachePath0151
     * @tc.desc      Count frame_0151.png cache name length and sandbox write of 18 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0151.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0151-ppppppp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0151', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(18);
        expect(checksum).assertEqual(1573);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.png');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(17)).assertEqual(112);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0152
     * @tc.name      testCachePath0152
     * @tc.desc      Count frame_0152.jpg cache name length and sandbox write of 19 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0152.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0152-pppppppp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0152', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(19);
        expect(checksum).assertEqual(1686);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(18)).assertEqual('p');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0153
     * @tc.name      testCachePath0153
     * @tc.desc      Count frame_0153.webp cache name length and sandbox write of 12 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0153.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0153-z';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0153', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(12);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(12);
        expect(checksum).assertEqual(913);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(11)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0154
     * @tc.name      testCachePath0154
     * @tc.desc      Count frame_0154.bin cache name length and sandbox write of 13 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0154.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0154-pz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0154', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(13);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(13);
        expect(checksum).assertEqual(1026);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(12)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0155
     * @tc.name      testCachePath0155
     * @tc.desc      Count frame_0155.cache cache name length and sandbox write of 14 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0155.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0155-ppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0155', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(14);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(14);
        expect(checksum).assertEqual(1139);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(16);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(13)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0156
     * @tc.name      testCachePath0156
     * @tc.desc      Count frame_0156.png cache name length and sandbox write of 16 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0156.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0156-pppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0156', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(16);
        expect(checksum).assertEqual(1374);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.png');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(15)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0157
     * @tc.name      testCachePath0157
     * @tc.desc      Count frame_0157.jpg cache name length and sandbox write of 17 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0157.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0157-ppppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0157', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(17);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(17);
        expect(checksum).assertEqual(1487);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(16)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0158
     * @tc.name      testCachePath0158
     * @tc.desc      Count frame_0158.webp cache name length and sandbox write of 18 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0158.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0158-pppppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0158', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(18);
        expect(checksum).assertEqual(1600);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(17)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0159
     * @tc.name      testCachePath0159
     * @tc.desc      Count frame_0159.bin cache name length and sandbox write of 20 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0159.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0159-ppppppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0159', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(20);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(20);
        expect(checksum).assertEqual(1835);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(19)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0160
     * @tc.name      testCachePath0160
     * @tc.desc      Count frame_0160.cache cache name length and sandbox write of 21 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0160.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0160-pppppppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0160', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(21);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(21);
        expect(checksum).assertEqual(1939);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(16);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(20)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0161
     * @tc.name      testCachePath0161
     * @tc.desc      Count frame_0161.dat cache name length and sandbox write of 22 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0161.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0161-ppppppppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0161', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(22);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(22);
        expect(checksum).assertEqual(2052);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(21)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0162
     * @tc.name      testCachePath0162
     * @tc.desc      Count frame_0162.png cache name length and sandbox write of 15 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0162.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0162-zzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0162', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(15);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(15);
        expect(checksum).assertEqual(1279);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.png');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(14)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0163
     * @tc.name      testCachePath0163
     * @tc.desc      Count frame_0163.jpg cache name length and sandbox write of 16 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0163.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0163-pzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0163', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(16);
        expect(checksum).assertEqual(1392);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(15)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0164
     * @tc.name      testCachePath0164
     * @tc.desc      Count frame_0164.webp cache name length and sandbox write of 17 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0164.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0164-ppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0164', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(17);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(17);
        expect(checksum).assertEqual(1505);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(16)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0165
     * @tc.name      testCachePath0165
     * @tc.desc      Count frame_0165.bin cache name length and sandbox write of 14 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'frame_0165.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0165-ppp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0165', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(14);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(14);
        expect(checksum).assertEqual(1130);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(13)).assertEqual(112);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0166
     * @tc.name      testCachePath0166
     * @tc.desc      Count asset_0166.cache cache name length and sandbox write of 15 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0166.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0166-pppp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0166', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(15);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(15);
        expect(checksum).assertEqual(1243);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(16);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(14)).assertEqual('p');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0167
     * @tc.name      testCachePath0167
     * @tc.desc      Count asset_0167.dat cache name length and sandbox write of 16 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0167.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0167-ppppp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0167', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(16);
        expect(checksum).assertEqual(1356);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(15)).assertEqual(112);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0168
     * @tc.name      testCachePath0168
     * @tc.desc      Count asset_0168.png cache name length and sandbox write of 18 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0168.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0168-ppppppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0168', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(18);
        expect(checksum).assertEqual(1591);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.png');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(17)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0169
     * @tc.name      testCachePath0169
     * @tc.desc      Count asset_0169.jpg cache name length and sandbox write of 19 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0169.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0169-pppppppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0169', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(19);
        expect(checksum).assertEqual(1704);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(18)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0170
     * @tc.name      testCachePath0170
     * @tc.desc      Count asset_0170.webp cache name length and sandbox write of 20 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0170.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0170-ppppppppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0170', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(20);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(20);
        expect(checksum).assertEqual(1808);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(19)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0171
     * @tc.name      testCachePath0171
     * @tc.desc      Count asset_0171.bin cache name length and sandbox write of 13 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0171.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0171-zz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0171', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(13);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(13);
        expect(checksum).assertEqual(1035);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(12)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0172
     * @tc.name      testCachePath0172
     * @tc.desc      Count asset_0172.cache cache name length and sandbox write of 14 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0172.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0172-pzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0172', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(14);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(14);
        expect(checksum).assertEqual(1148);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(16);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(13)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0173
     * @tc.name      testCachePath0173
     * @tc.desc      Count asset_0173.dat cache name length and sandbox write of 15 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0173.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0173-ppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0173', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(15);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(15);
        expect(checksum).assertEqual(1261);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(14)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0174
     * @tc.name      testCachePath0174
     * @tc.desc      Count asset_0174.png cache name length and sandbox write of 17 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0174.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0174-pppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0174', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(17);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(17);
        expect(checksum).assertEqual(1496);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.png');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(16)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0175
     * @tc.name      testCachePath0175
     * @tc.desc      Count asset_0175.jpg cache name length and sandbox write of 18 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0175.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0175-ppppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0175', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(18);
        expect(checksum).assertEqual(1609);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(17)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0176
     * @tc.name      testCachePath0176
     * @tc.desc      Count asset_0176.webp cache name length and sandbox write of 19 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0176.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0176-pppppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0176', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(19);
        expect(checksum).assertEqual(1722);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(18)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0177
     * @tc.name      testCachePath0177
     * @tc.desc      Count asset_0177.bin cache name length and sandbox write of 21 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0177.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0177-ppppppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0177', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(21);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(21);
        expect(checksum).assertEqual(1957);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(20)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0178
     * @tc.name      testCachePath0178
     * @tc.desc      Count asset_0178.cache cache name length and sandbox write of 22 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0178.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0178-pppppppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0178', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(22);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(22);
        expect(checksum).assertEqual(2070);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(16);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(21)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0179
     * @tc.name      testCachePath0179
     * @tc.desc      Count asset_0179.dat cache name length and sandbox write of 23 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0179.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0179-ppppppppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0179', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(23);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(23);
        expect(checksum).assertEqual(2183);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(22)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0180
     * @tc.name      testCachePath0180
     * @tc.desc      Count asset_0180.png cache name length and sandbox write of 11 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0180.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0180-';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0180', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(11);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(11);
        expect(checksum).assertEqual(791);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.png');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(10)).assertEqual('-');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0181
     * @tc.name      testCachePath0181
     * @tc.desc      Count asset_0181.jpg cache name length and sandbox write of 12 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0181.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0181-p';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0181', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(12);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(12);
        expect(checksum).assertEqual(904);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(11)).assertEqual(112);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0182
     * @tc.name      testCachePath0182
     * @tc.desc      Count asset_0182.bin cache name length and sandbox write of 13 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0182.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0182-pp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0182', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(13);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(13);
        expect(checksum).assertEqual(1017);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(12)).assertEqual('p');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0183
     * @tc.name      testCachePath0183
     * @tc.desc      Count asset_0183.cache cache name length and sandbox write of 15 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0183.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0183-pppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0183', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(15);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(15);
        expect(checksum).assertEqual(1252);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(16);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(14)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0184
     * @tc.name      testCachePath0184
     * @tc.desc      Count asset_0184.dat cache name length and sandbox write of 16 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0184.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0184-ppppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0184', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(16);
        expect(checksum).assertEqual(1365);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(15)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0185
     * @tc.name      testCachePath0185
     * @tc.desc      Count asset_0185.png cache name length and sandbox write of 17 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0185.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0185-pppppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0185', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(17);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(17);
        expect(checksum).assertEqual(1478);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.png');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(16)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0186
     * @tc.name      testCachePath0186
     * @tc.desc      Count asset_0186.jpg cache name length and sandbox write of 19 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0186.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0186-ppppppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0186', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(19);
        expect(checksum).assertEqual(1713);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(18)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0187
     * @tc.name      testCachePath0187
     * @tc.desc      Count asset_0187.webp cache name length and sandbox write of 20 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0187.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0187-pppppppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0187', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(20);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(20);
        expect(checksum).assertEqual(1826);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(19)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0188
     * @tc.name      testCachePath0188
     * @tc.desc      Count asset_0188.bin cache name length and sandbox write of 21 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0188.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0188-ppppppppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0188', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(21);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(21);
        expect(checksum).assertEqual(1939);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(20)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0189
     * @tc.name      testCachePath0189
     * @tc.desc      Count asset_0189.cache cache name length and sandbox write of 14 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0189.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0189-zzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0189', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(14);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(14);
        expect(checksum).assertEqual(1166);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(16);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(13)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0190
     * @tc.name      testCachePath0190
     * @tc.desc      Count asset_0190.dat cache name length and sandbox write of 15 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0190.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0190-pzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0190', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(15);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(15);
        expect(checksum).assertEqual(1270);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(14)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0191
     * @tc.name      testCachePath0191
     * @tc.desc      Count asset_0191.png cache name length and sandbox write of 16 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0191.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0191-ppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0191', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(16);
        expect(checksum).assertEqual(1383);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.png');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(15)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0192
     * @tc.name      testCachePath0192
     * @tc.desc      Count asset_0192.jpg cache name length and sandbox write of 18 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0192.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0192-pppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0192', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(18);
        expect(checksum).assertEqual(1618);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(17)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0193
     * @tc.name      testCachePath0193
     * @tc.desc      Count asset_0193.webp cache name length and sandbox write of 19 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0193.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0193-ppppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0193', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(19);
        expect(checksum).assertEqual(1731);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(18)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0194
     * @tc.name      testCachePath0194
     * @tc.desc      Count asset_0194.bin cache name length and sandbox write of 20 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0194.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0194-pppppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0194', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(20);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(20);
        expect(checksum).assertEqual(1844);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(19)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0195
     * @tc.name      testCachePath0195
     * @tc.desc      Count asset_0195.cache cache name length and sandbox write of 17 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0195.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0195-pppppp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0195', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(17);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(17);
        expect(checksum).assertEqual(1469);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(16);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(16)).assertEqual('p');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0196
     * @tc.name      testCachePath0196
     * @tc.desc      Count asset_0196.dat cache name length and sandbox write of 18 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0196.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0196-ppppppp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0196', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(18);
        expect(checksum).assertEqual(1582);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(10);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(17)).assertEqual(112);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0197
     * @tc.name      testCachePath0197
     * @tc.desc      Count asset_0197.png cache name length and sandbox write of 19 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0197.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0197-pppppppp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0197', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(19);
        expect(checksum).assertEqual(1695);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.png');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(18)).assertEqual('p');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0198
     * @tc.name      testCachePath0198
     * @tc.desc      Count asset_0198.jpg cache name length and sandbox write of 12 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'asset_0198.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0198-z';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0198', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(12);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(12);
        expect(checksum).assertEqual(922);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(14);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(10);
        expect(name.substring(10)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(11)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0199
     * @tc.name      testCachePath0199
     * @tc.desc      Count sprite_0199.webp cache name length and sandbox write of 13 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'sprite_0199.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0199-pz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0199', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(13);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(13);
        expect(checksum).assertEqual(1035);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(16);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(11);
        expect(name.substring(11)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(12)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0200
     * @tc.name      testCachePath0200
     * @tc.desc      Count sprite_0200.bin cache name length and sandbox write of 14 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'sprite_0200.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0200-ppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0200', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(14);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(14);
        expect(checksum).assertEqual(1130);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(11);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(13)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0201
     * @tc.name      testCachePath0201
     * @tc.desc      Count sprite_0201.cache cache name length and sandbox write of 16 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'sprite_0201.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0201-pppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0201', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(16);
        expect(checksum).assertEqual(1365);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(17);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(15)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0202
     * @tc.name      testCachePath0202
     * @tc.desc      Count sprite_0202.dat cache name length and sandbox write of 17 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'sprite_0202.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0202-ppppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0202', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(17);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(17);
        expect(checksum).assertEqual(1478);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(11);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(16)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0203
     * @tc.name      testCachePath0203
     * @tc.desc      Count sprite_0203.png cache name length and sandbox write of 18 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'sprite_0203.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0203-pppppzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0203', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(18);
        expect(checksum).assertEqual(1591);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(11);
        expect(name.substring(11)).assertEqual('.png');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(17)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0204
     * @tc.name      testCachePath0204
     * @tc.desc      Count sprite_0204.jpg cache name length and sandbox write of 20 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'sprite_0204.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0204-ppppppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0204', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(20);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(20);
        expect(checksum).assertEqual(1826);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(11);
        expect(name.substring(11)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(19)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0205
     * @tc.name      testCachePath0205
     * @tc.desc      Count sprite_0205.webp cache name length and sandbox write of 21 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'sprite_0205.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0205-pppppppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0205', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(21);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(21);
        expect(checksum).assertEqual(1939);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(16);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(11);
        expect(name.substring(11)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(20)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0206
     * @tc.name      testCachePath0206
     * @tc.desc      Count sprite_0206.bin cache name length and sandbox write of 22 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'sprite_0206.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0206-ppppppppzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0206', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(22);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(22);
        expect(checksum).assertEqual(2052);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(11);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(21)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0207
     * @tc.name      testCachePath0207
     * @tc.desc      Count sprite_0207.cache cache name length and sandbox write of 15 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'sprite_0207.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0207-zzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0207', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(15);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(15);
        expect(checksum).assertEqual(1279);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(17);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(14)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0208
     * @tc.name      testCachePath0208
     * @tc.desc      Count sprite_0208.png cache name length and sandbox write of 16 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'sprite_0208.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0208-pzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0208', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(16);
        expect(checksum).assertEqual(1392);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(11);
        expect(name.substring(11)).assertEqual('.png');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(15)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0209
     * @tc.name      testCachePath0209
     * @tc.desc      Count sprite_0209.jpg cache name length and sandbox write of 17 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'sprite_0209.jpg';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0209-ppzzzz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0209', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(17);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(17);
        expect(checksum).assertEqual(1505);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(11);
        expect(name.substring(11)).assertEqual('.jpg');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(16)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0210
     * @tc.name      testCachePath0210
     * @tc.desc      Count sprite_0210.webp cache name length and sandbox write of 14 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCachePath0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'sprite_0210.webp';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0210-ppp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0210', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(14);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(14);
        expect(checksum).assertEqual(1121);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(16);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(11);
        expect(name.substring(11)).assertEqual('.webp');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(13)).assertEqual(112);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0211
     * @tc.name      testCachePath0211
     * @tc.desc      Count sprite_0211.bin cache name length and sandbox write of 15 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCachePath0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'sprite_0211.bin';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0211-pppp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0211', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(15);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(15);
        expect(checksum).assertEqual(1234);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(11);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(14)).assertEqual('p');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0212
     * @tc.name      testCachePath0212
     * @tc.desc      Count sprite_0212.cache cache name length and sandbox write of 16 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCachePath0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'sprite_0212.cache';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0212-ppppp';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0212', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(16);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(16);
        expect(checksum).assertEqual(1347);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(17);
        expect(fs.accessSync(full)).assertTrue();
        expect(full.length).assertEqual(ctx.filesDir.length + 1 + name.length);
        expect(name.includes('cache')).assertTrue();
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(15)).assertEqual(112);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0213
     * @tc.name      testCachePath0213
     * @tc.desc      Count sprite_0213.dat cache name length and sandbox write of 18 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCachePath0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'sprite_0213.dat';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0213-ppppppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0213', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(18);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(18);
        expect(checksum).assertEqual(1582);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.indexOf('.')).assertEqual(11);
        expect(content.charAt(0)).assertEqual('c');
        expect(content.length % 2).assertEqual(0);
        expect(fs.readTextSync(full).charCodeAt(17)).assertEqual(122);
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
      }
      expect(fs.accessSync(full)).assertFalse();
    });
    /**
     * @tc.number    SUB_PREHTTP_CACHEPATH_0214
     * @tc.name      testCachePath0214
     * @tc.desc      Count sprite_0214.png cache name length and sandbox write of 19 bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCachePath0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ctx: common.Context = appContext();
      const name: string = 'sprite_0214.png';
      const full: string = ctx.filesDir + '/' + name;
      const content: string = 'cache-0214-pppppppz';
      let checksum: number = 0;
      for (let k: number = 0; k < content.length; k++) {
        checksum += content.charCodeAt(k);
      }
      logCase('testCachePath0214', `name=${name} checksum=${checksum}`);
      try {
        const file: fs.File = fs.openSync(full, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC);
        const written: number = fs.writeSync(file.fd, content);
        fs.closeSync(file);
        expect(written).assertEqual(19);
        expect(fs.readTextSync(full)).assertEqual(content);
        expect(fs.statSync(full).size).assertEqual(19);
        expect(checksum).assertEqual(1695);
        expect(full.endsWith(name)).assertTrue();
        expect(full.startsWith(ctx.filesDir + '/')).assertTrue();
        expect(name.length).assertEqual(15);
        expect(fs.accessSync(full)).assertTrue();
        expect(name.lastIndexOf('.')).assertEqual(11);
        expect(name.substring(11)).assertEqual('.png');
        expect(content.length % 2).assertEqual(1);
        expect(content.charAt(18)).assertEqual('z');
      } finally {
        if (fs.accessSync(full)) {
          fs.unlinkSync(full);
        }
