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
