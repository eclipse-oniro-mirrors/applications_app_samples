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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeAll, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import { fileIo as fs } from '@kit.CoreFileKit';

const delegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;


const TAG: string = '[Sample_playWithCacheFileIoIntegration]';
const DOMAIN: number = 0xF811;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertClose(expectValue: number, precision: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function playWithCacheFileIoIntegrationTest(): void {
  describe('playWithCacheFileIoIntegrationTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    beforeAll(async () => {
      const want: Want = { bundleName: bundleName, abilityName: 'EntryAbility' };
      await delegator.startAbility(want);
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 3000);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILEIO_0001
     * @tc.name      testExtCacheFileIo0001
     * @tc.desc      Cache file 1 bytes writes, reads and unlinks.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFileIo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const path: string = ability.context.filesDir + '/cache_it_1.dat';
      const buffer: ArrayBuffer = new ArrayBuffer(1);
      const file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      const written: number = fs.writeSync(file.fd, buffer);
      fs.closeSync(file);
      expect(written).assertEqual(1);
      const stat = fs.statSync(path);
      expect(stat.size).assertEqual(1);
      const reader = fs.openSync(path, fs.OpenMode.READ_ONLY);
      const readBuffer: ArrayBuffer = new ArrayBuffer(1);
      const readBytes: number = fs.readSync(reader.fd, readBuffer);
      fs.closeSync(reader);
      expect(readBytes).assertEqual(1);
      fs.unlinkSync(path);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILEIO_0002
     * @tc.name      testExtCacheFileIo0002
     * @tc.desc      Cache file 8 bytes writes, reads and unlinks.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFileIo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const path: string = ability.context.filesDir + '/cache_it_2.dat';
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      const file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      const written: number = fs.writeSync(file.fd, buffer);
      fs.closeSync(file);
      expect(written).assertEqual(8);
      const stat = fs.statSync(path);
      expect(stat.size).assertEqual(8);
      const reader = fs.openSync(path, fs.OpenMode.READ_ONLY);
      const readBuffer: ArrayBuffer = new ArrayBuffer(8);
      const readBytes: number = fs.readSync(reader.fd, readBuffer);
      fs.closeSync(reader);
      expect(readBytes).assertEqual(8);
      fs.unlinkSync(path);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILEIO_0003
     * @tc.name      testExtCacheFileIo0003
     * @tc.desc      Cache file 16 bytes writes, reads and unlinks.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFileIo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const path: string = ability.context.filesDir + '/cache_it_3.dat';
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      const file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      const written: number = fs.writeSync(file.fd, buffer);
      fs.closeSync(file);
      expect(written).assertEqual(16);
      const stat = fs.statSync(path);
      expect(stat.size).assertEqual(16);
      const reader = fs.openSync(path, fs.OpenMode.READ_ONLY);
      const readBuffer: ArrayBuffer = new ArrayBuffer(16);
      const readBytes: number = fs.readSync(reader.fd, readBuffer);
      fs.closeSync(reader);
      expect(readBytes).assertEqual(16);
      fs.unlinkSync(path);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILEIO_0004
     * @tc.name      testExtCacheFileIo0004
     * @tc.desc      Cache file 32 bytes writes, reads and unlinks.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFileIo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const path: string = ability.context.filesDir + '/cache_it_4.dat';
      const buffer: ArrayBuffer = new ArrayBuffer(32);
      const file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      const written: number = fs.writeSync(file.fd, buffer);
      fs.closeSync(file);
      expect(written).assertEqual(32);
      const stat = fs.statSync(path);
      expect(stat.size).assertEqual(32);
      const reader = fs.openSync(path, fs.OpenMode.READ_ONLY);
      const readBuffer: ArrayBuffer = new ArrayBuffer(32);
      const readBytes: number = fs.readSync(reader.fd, readBuffer);
      fs.closeSync(reader);
      expect(readBytes).assertEqual(32);
      fs.unlinkSync(path);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILEIO_0005
     * @tc.name      testExtCacheFileIo0005
     * @tc.desc      Cache file 64 bytes writes, reads and unlinks.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFileIo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const path: string = ability.context.filesDir + '/cache_it_5.dat';
      const buffer: ArrayBuffer = new ArrayBuffer(64);
      const file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      const written: number = fs.writeSync(file.fd, buffer);
      fs.closeSync(file);
      expect(written).assertEqual(64);
      const stat = fs.statSync(path);
      expect(stat.size).assertEqual(64);
      const reader = fs.openSync(path, fs.OpenMode.READ_ONLY);
      const readBuffer: ArrayBuffer = new ArrayBuffer(64);
      const readBytes: number = fs.readSync(reader.fd, readBuffer);
      fs.closeSync(reader);
      expect(readBytes).assertEqual(64);
      fs.unlinkSync(path);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILEIO_0006
     * @tc.name      testExtCacheFileIo0006
     * @tc.desc      Cache file 128 bytes writes, reads and unlinks.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFileIo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const path: string = ability.context.filesDir + '/cache_it_6.dat';
      const buffer: ArrayBuffer = new ArrayBuffer(128);
      const file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      const written: number = fs.writeSync(file.fd, buffer);
      fs.closeSync(file);
      expect(written).assertEqual(128);
      const stat = fs.statSync(path);
      expect(stat.size).assertEqual(128);
      const reader = fs.openSync(path, fs.OpenMode.READ_ONLY);
      const readBuffer: ArrayBuffer = new ArrayBuffer(128);
      const readBytes: number = fs.readSync(reader.fd, readBuffer);
      fs.closeSync(reader);
      expect(readBytes).assertEqual(128);
      fs.unlinkSync(path);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILEIO_0007
     * @tc.name      testExtCacheFileIo0007
     * @tc.desc      Cache file 256 bytes writes, reads and unlinks.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFileIo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const path: string = ability.context.filesDir + '/cache_it_7.dat';
      const buffer: ArrayBuffer = new ArrayBuffer(256);
      const file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      const written: number = fs.writeSync(file.fd, buffer);
      fs.closeSync(file);
      expect(written).assertEqual(256);
      const stat = fs.statSync(path);
      expect(stat.size).assertEqual(256);
      const reader = fs.openSync(path, fs.OpenMode.READ_ONLY);
      const readBuffer: ArrayBuffer = new ArrayBuffer(256);
      const readBytes: number = fs.readSync(reader.fd, readBuffer);
      fs.closeSync(reader);
      expect(readBytes).assertEqual(256);
      fs.unlinkSync(path);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILEIO_0008
     * @tc.name      testExtCacheFileIo0008
     * @tc.desc      Cache file 512 bytes writes, reads and unlinks.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFileIo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const path: string = ability.context.filesDir + '/cache_it_8.dat';
      const buffer: ArrayBuffer = new ArrayBuffer(512);
      const file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      const written: number = fs.writeSync(file.fd, buffer);
      fs.closeSync(file);
      expect(written).assertEqual(512);
      const stat = fs.statSync(path);
      expect(stat.size).assertEqual(512);
      const reader = fs.openSync(path, fs.OpenMode.READ_ONLY);
      const readBuffer: ArrayBuffer = new ArrayBuffer(512);
      const readBytes: number = fs.readSync(reader.fd, readBuffer);
      fs.closeSync(reader);
      expect(readBytes).assertEqual(512);
      fs.unlinkSync(path);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILEIO_0009
     * @tc.name      testExtCacheFileIo0009
     * @tc.desc      Cache file 1024 bytes writes, reads and unlinks.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFileIo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const path: string = ability.context.filesDir + '/cache_it_9.dat';
      const buffer: ArrayBuffer = new ArrayBuffer(1024);
      const file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      const written: number = fs.writeSync(file.fd, buffer);
      fs.closeSync(file);
      expect(written).assertEqual(1024);
      const stat = fs.statSync(path);
      expect(stat.size).assertEqual(1024);
      const reader = fs.openSync(path, fs.OpenMode.READ_ONLY);
      const readBuffer: ArrayBuffer = new ArrayBuffer(1024);
      const readBytes: number = fs.readSync(reader.fd, readBuffer);
      fs.closeSync(reader);
      expect(readBytes).assertEqual(1024);
      fs.unlinkSync(path);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILEIO_0010
     * @tc.name      testExtCacheFileIo0010
     * @tc.desc      Cache file 2048 bytes writes, reads and unlinks.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFileIo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const path: string = ability.context.filesDir + '/cache_it_10.dat';
      const buffer: ArrayBuffer = new ArrayBuffer(2048);
      const file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      const written: number = fs.writeSync(file.fd, buffer);
      fs.closeSync(file);
      expect(written).assertEqual(2048);
      const stat = fs.statSync(path);
      expect(stat.size).assertEqual(2048);
      const reader = fs.openSync(path, fs.OpenMode.READ_ONLY);
      const readBuffer: ArrayBuffer = new ArrayBuffer(2048);
      const readBytes: number = fs.readSync(reader.fd, readBuffer);
      fs.closeSync(reader);
      expect(readBytes).assertEqual(2048);
      fs.unlinkSync(path);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILEIO_0011
     * @tc.name      testExtCacheFileIo0011
     * @tc.desc      Cache file 4096 bytes writes, reads and unlinks.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFileIo0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const path: string = ability.context.filesDir + '/cache_it_11.dat';
      const buffer: ArrayBuffer = new ArrayBuffer(4096);
      const file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      const written: number = fs.writeSync(file.fd, buffer);
      fs.closeSync(file);
      expect(written).assertEqual(4096);
      const stat = fs.statSync(path);
      expect(stat.size).assertEqual(4096);
      const reader = fs.openSync(path, fs.OpenMode.READ_ONLY);
      const readBuffer: ArrayBuffer = new ArrayBuffer(4096);
      const readBytes: number = fs.readSync(reader.fd, readBuffer);
      fs.closeSync(reader);
      expect(readBytes).assertEqual(4096);
      fs.unlinkSync(path);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_FILEIO_0012
     * @tc.name      testExtCacheFileIo0012
     * @tc.desc      Cache file 8192 bytes writes, reads and unlinks.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheFileIo0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      const path: string = ability.context.filesDir + '/cache_it_12.dat';
      const buffer: ArrayBuffer = new ArrayBuffer(8192);
      const file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      const written: number = fs.writeSync(file.fd, buffer);
      fs.closeSync(file);
      expect(written).assertEqual(8192);
      const stat = fs.statSync(path);
      expect(stat.size).assertEqual(8192);
      const reader = fs.openSync(path, fs.OpenMode.READ_ONLY);
      const readBuffer: ArrayBuffer = new ArrayBuffer(8192);
      const readBytes: number = fs.readSync(reader.fd, readBuffer);
      fs.closeSync(reader);
      expect(readBytes).assertEqual(8192);
      fs.unlinkSync(path);
    })
  });
}
