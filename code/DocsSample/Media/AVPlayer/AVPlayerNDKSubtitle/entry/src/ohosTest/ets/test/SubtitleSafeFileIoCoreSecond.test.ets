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
import { describe, it as hypiumIt, expect as hypiumExpect, TestType, Size, Level, Assert } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { fileIo } from '@kit.CoreFileKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';

const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();


const TAG: string = '[Sample_SubtitleSafeFileIoCoreSecond]';
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


function expect(actual: string | number | boolean | Object | null | undefined): Assert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}
export default function SubtitleSafeFileIoCoreSecondTest(): void {
  describe('SubtitleSafeFileIoCoreSecondTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0043
     * @tc.name      testSafeFileIo0043
     * @tc.desc      Write 226 bytes, truncate to 113, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_43.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(226);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 42) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(226);
        fileIo.truncateSync(file.fd, 113);
        expect(fileIo.statSync(path).size).assertEqual(113);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(113);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(113);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(113);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0044
     * @tc.name      testSafeFileIo0044
     * @tc.desc      Write 229 bytes, truncate to 114, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_44.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(229);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 43) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(229);
        fileIo.truncateSync(file.fd, 114);
        expect(fileIo.statSync(path).size).assertEqual(114);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(114);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(114);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(114);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0045
     * @tc.name      testSafeFileIo0045
     * @tc.desc      Write 232 bytes, truncate to 116, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_45.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(232);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 44) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(232);
        fileIo.truncateSync(file.fd, 116);
        expect(fileIo.statSync(path).size).assertEqual(116);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(116);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(116);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(116);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0046
     * @tc.name      testSafeFileIo0046
     * @tc.desc      Write 235 bytes, truncate to 117, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_46.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(235);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 45) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(235);
        fileIo.truncateSync(file.fd, 117);
        expect(fileIo.statSync(path).size).assertEqual(117);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(117);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(117);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(117);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0047
     * @tc.name      testSafeFileIo0047
     * @tc.desc      Write 238 bytes, truncate to 119, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_47.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(238);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 46) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(238);
        fileIo.truncateSync(file.fd, 119);
        expect(fileIo.statSync(path).size).assertEqual(119);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(119);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(119);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(119);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0048
     * @tc.name      testSafeFileIo0048
     * @tc.desc      Write 241 bytes, truncate to 120, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_48.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(241);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 47) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(241);
        fileIo.truncateSync(file.fd, 120);
        expect(fileIo.statSync(path).size).assertEqual(120);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(120);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(120);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(120);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0049
     * @tc.name      testSafeFileIo0049
     * @tc.desc      Write 244 bytes, truncate to 122, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_49.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(244);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 48) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(244);
        fileIo.truncateSync(file.fd, 122);
        expect(fileIo.statSync(path).size).assertEqual(122);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(122);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(122);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(122);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0050
     * @tc.name      testSafeFileIo0050
     * @tc.desc      Write 247 bytes, truncate to 123, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_50.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(247);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 49) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(247);
        fileIo.truncateSync(file.fd, 123);
        expect(fileIo.statSync(path).size).assertEqual(123);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(123);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(123);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(123);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0051
     * @tc.name      testSafeFileIo0051
     * @tc.desc      Write 250 bytes, truncate to 125, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_51.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(250);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 50) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(250);
        fileIo.truncateSync(file.fd, 125);
        expect(fileIo.statSync(path).size).assertEqual(125);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(125);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(125);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(125);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0052
     * @tc.name      testSafeFileIo0052
     * @tc.desc      Write 253 bytes, truncate to 126, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_52.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(253);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 51) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(253);
        fileIo.truncateSync(file.fd, 126);
        expect(fileIo.statSync(path).size).assertEqual(126);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(126);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(126);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(126);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0053
     * @tc.name      testSafeFileIo0053
     * @tc.desc      Write 256 bytes, truncate to 128, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_53.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(256);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 52) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(256);
        fileIo.truncateSync(file.fd, 128);
        expect(fileIo.statSync(path).size).assertEqual(128);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(128);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(128);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(128);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0054
     * @tc.name      testSafeFileIo0054
     * @tc.desc      Write 259 bytes, truncate to 129, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_54.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(259);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 53) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(259);
        fileIo.truncateSync(file.fd, 129);
        expect(fileIo.statSync(path).size).assertEqual(129);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(129);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(129);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(129);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0055
     * @tc.name      testSafeFileIo0055
     * @tc.desc      Write 262 bytes, truncate to 131, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_55.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(262);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 54) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(262);
        fileIo.truncateSync(file.fd, 131);
        expect(fileIo.statSync(path).size).assertEqual(131);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(131);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(131);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(131);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0056
     * @tc.name      testSafeFileIo0056
     * @tc.desc      Write 265 bytes, truncate to 132, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_56.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(265);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 55) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(265);
        fileIo.truncateSync(file.fd, 132);
        expect(fileIo.statSync(path).size).assertEqual(132);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(132);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(132);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(132);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0057
     * @tc.name      testSafeFileIo0057
     * @tc.desc      Write 268 bytes, truncate to 134, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_57.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(268);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 56) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(268);
        fileIo.truncateSync(file.fd, 134);
        expect(fileIo.statSync(path).size).assertEqual(134);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(134);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(134);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(134);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0058
     * @tc.name      testSafeFileIo0058
     * @tc.desc      Write 271 bytes, truncate to 135, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_58.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(271);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 57) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(271);
        fileIo.truncateSync(file.fd, 135);
        expect(fileIo.statSync(path).size).assertEqual(135);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(135);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(135);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(135);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0059
     * @tc.name      testSafeFileIo0059
     * @tc.desc      Write 274 bytes, truncate to 137, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_59.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(274);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 58) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(274);
        fileIo.truncateSync(file.fd, 137);
        expect(fileIo.statSync(path).size).assertEqual(137);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(137);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(137);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(137);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0060
     * @tc.name      testSafeFileIo0060
     * @tc.desc      Write 277 bytes, truncate to 138, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_60.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(277);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 59) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(277);
        fileIo.truncateSync(file.fd, 138);
        expect(fileIo.statSync(path).size).assertEqual(138);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(138);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(138);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(138);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0061
     * @tc.name      testSafeFileIo0061
     * @tc.desc      Write 280 bytes, truncate to 140, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_61.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(280);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 60) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(280);
        fileIo.truncateSync(file.fd, 140);
        expect(fileIo.statSync(path).size).assertEqual(140);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(140);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(140);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(140);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0062
     * @tc.name      testSafeFileIo0062
     * @tc.desc      Write 283 bytes, truncate to 141, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_62.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(283);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 61) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(283);
        fileIo.truncateSync(file.fd, 141);
        expect(fileIo.statSync(path).size).assertEqual(141);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(141);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(141);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(141);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0063
     * @tc.name      testSafeFileIo0063
     * @tc.desc      Write 286 bytes, truncate to 143, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_63.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(286);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 62) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(286);
        fileIo.truncateSync(file.fd, 143);
        expect(fileIo.statSync(path).size).assertEqual(143);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(143);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(143);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(143);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0064
     * @tc.name      testSafeFileIo0064
     * @tc.desc      Write 289 bytes, truncate to 144, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_64.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(289);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 63) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(289);
        fileIo.truncateSync(file.fd, 144);
        expect(fileIo.statSync(path).size).assertEqual(144);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(144);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(144);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(144);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0065
     * @tc.name      testSafeFileIo0065
     * @tc.desc      Write 292 bytes, truncate to 146, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_65.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(292);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 64) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(292);
        fileIo.truncateSync(file.fd, 146);
        expect(fileIo.statSync(path).size).assertEqual(146);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(146);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(146);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(146);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0066
     * @tc.name      testSafeFileIo0066
     * @tc.desc      Write 295 bytes, truncate to 147, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_66.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(295);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 65) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(295);
        fileIo.truncateSync(file.fd, 147);
        expect(fileIo.statSync(path).size).assertEqual(147);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(147);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(147);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(147);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0067
     * @tc.name      testSafeFileIo0067
     * @tc.desc      Write 298 bytes, truncate to 149, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_67.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(298);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 66) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(298);
        fileIo.truncateSync(file.fd, 149);
        expect(fileIo.statSync(path).size).assertEqual(149);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(149);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(149);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(149);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0068
     * @tc.name      testSafeFileIo0068
     * @tc.desc      Write 301 bytes, truncate to 150, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_68.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(301);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 67) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(301);
        fileIo.truncateSync(file.fd, 150);
        expect(fileIo.statSync(path).size).assertEqual(150);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(150);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(150);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(150);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0069
     * @tc.name      testSafeFileIo0069
     * @tc.desc      Write 304 bytes, truncate to 152, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_69.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(304);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 68) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(304);
        fileIo.truncateSync(file.fd, 152);
        expect(fileIo.statSync(path).size).assertEqual(152);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(152);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(152);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(152);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0070
     * @tc.name      testSafeFileIo0070
     * @tc.desc      Write 307 bytes, truncate to 153, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_70.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(307);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 69) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(307);
        fileIo.truncateSync(file.fd, 153);
        expect(fileIo.statSync(path).size).assertEqual(153);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(153);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(153);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(153);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0071
     * @tc.name      testSafeFileIo0071
     * @tc.desc      Write 310 bytes, truncate to 155, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_71.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(310);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 70) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(310);
        fileIo.truncateSync(file.fd, 155);
        expect(fileIo.statSync(path).size).assertEqual(155);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(155);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(155);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(155);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0072
     * @tc.name      testSafeFileIo0072
     * @tc.desc      Write 313 bytes, truncate to 156, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_72.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(313);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 71) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(313);
        fileIo.truncateSync(file.fd, 156);
        expect(fileIo.statSync(path).size).assertEqual(156);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(156);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(156);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(156);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0073
     * @tc.name      testSafeFileIo0073
     * @tc.desc      Write 316 bytes, truncate to 158, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_73.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(316);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 72) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(316);
        fileIo.truncateSync(file.fd, 158);
        expect(fileIo.statSync(path).size).assertEqual(158);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(158);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(158);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(158);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0074
     * @tc.name      testSafeFileIo0074
     * @tc.desc      Write 319 bytes, truncate to 159, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_74.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(319);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 73) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(319);
        fileIo.truncateSync(file.fd, 159);
        expect(fileIo.statSync(path).size).assertEqual(159);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(159);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(159);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(159);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0075
     * @tc.name      testSafeFileIo0075
     * @tc.desc      Write 322 bytes, truncate to 161, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_75.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(322);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 74) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(322);
        fileIo.truncateSync(file.fd, 161);
        expect(fileIo.statSync(path).size).assertEqual(161);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(161);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(161);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(161);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0076
     * @tc.name      testSafeFileIo0076
     * @tc.desc      Write 325 bytes, truncate to 162, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_76.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(325);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 75) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(325);
        fileIo.truncateSync(file.fd, 162);
        expect(fileIo.statSync(path).size).assertEqual(162);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(162);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(162);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(162);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0077
     * @tc.name      testSafeFileIo0077
     * @tc.desc      Write 328 bytes, truncate to 164, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_77.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(328);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 76) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(328);
        fileIo.truncateSync(file.fd, 164);
        expect(fileIo.statSync(path).size).assertEqual(164);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(164);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(164);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(164);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0078
     * @tc.name      testSafeFileIo0078
     * @tc.desc      Write 331 bytes, truncate to 165, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_78.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(331);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 77) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(331);
        fileIo.truncateSync(file.fd, 165);
        expect(fileIo.statSync(path).size).assertEqual(165);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(165);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(165);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(165);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0079
     * @tc.name      testSafeFileIo0079
     * @tc.desc      Write 334 bytes, truncate to 167, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_79.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(334);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 78) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(334);
        fileIo.truncateSync(file.fd, 167);
        expect(fileIo.statSync(path).size).assertEqual(167);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(167);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(167);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(167);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0080
     * @tc.name      testSafeFileIo0080
     * @tc.desc      Write 337 bytes, truncate to 168, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_80.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(337);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 79) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(337);
        fileIo.truncateSync(file.fd, 168);
        expect(fileIo.statSync(path).size).assertEqual(168);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(168);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(168);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(168);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0081
     * @tc.name      testSafeFileIo0081
     * @tc.desc      Write 340 bytes, truncate to 170, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_81.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(340);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 80) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(340);
        fileIo.truncateSync(file.fd, 170);
        expect(fileIo.statSync(path).size).assertEqual(170);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(170);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(170);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(170);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0082
     * @tc.name      testSafeFileIo0082
     * @tc.desc      Write 343 bytes, truncate to 171, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_82.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(343);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 81) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(343);
        fileIo.truncateSync(file.fd, 171);
        expect(fileIo.statSync(path).size).assertEqual(171);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(171);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(171);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(171);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0083
     * @tc.name      testSafeFileIo0083
     * @tc.desc      Write 346 bytes, truncate to 173, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_83.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(346);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 82) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(346);
        fileIo.truncateSync(file.fd, 173);
        expect(fileIo.statSync(path).size).assertEqual(173);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(173);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(173);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(173);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0084
     * @tc.name      testSafeFileIo0084
     * @tc.desc      Write 349 bytes, truncate to 174, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_84.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(349);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 83) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(349);
        fileIo.truncateSync(file.fd, 174);
        expect(fileIo.statSync(path).size).assertEqual(174);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(174);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(174);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(174);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
  })
}
