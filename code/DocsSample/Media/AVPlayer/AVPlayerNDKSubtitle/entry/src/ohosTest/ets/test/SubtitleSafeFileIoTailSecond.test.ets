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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { fileIo } from '@kit.CoreFileKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';

const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();

export default function SubtitleSafeFileIoTailSecondTest() {
  describe('SubtitleSafeFileIoTailSecondTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0211
     * @tc.name      testSafeFileIo0211
     * @tc.desc      Write 730 bytes, truncate to 365, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_211.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(730);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 210) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(730);
        fileIo.truncateSync(file.fd, 365);
        expect(fileIo.statSync(path).size).assertEqual(365);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(365);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(365);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(365);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0212
     * @tc.name      testSafeFileIo0212
     * @tc.desc      Write 733 bytes, truncate to 366, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_212.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(733);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 211) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(733);
        fileIo.truncateSync(file.fd, 366);
        expect(fileIo.statSync(path).size).assertEqual(366);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(366);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(366);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(366);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0213
     * @tc.name      testSafeFileIo0213
     * @tc.desc      Write 736 bytes, truncate to 368, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_213.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(736);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 212) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(736);
        fileIo.truncateSync(file.fd, 368);
        expect(fileIo.statSync(path).size).assertEqual(368);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(368);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(368);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(368);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0214
     * @tc.name      testSafeFileIo0214
     * @tc.desc      Write 739 bytes, truncate to 369, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_214.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(739);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 213) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(739);
        fileIo.truncateSync(file.fd, 369);
        expect(fileIo.statSync(path).size).assertEqual(369);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(369);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(369);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(369);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0215
     * @tc.name      testSafeFileIo0215
     * @tc.desc      Write 742 bytes, truncate to 371, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_215.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(742);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 214) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(742);
        fileIo.truncateSync(file.fd, 371);
        expect(fileIo.statSync(path).size).assertEqual(371);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(371);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(371);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(371);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0216
     * @tc.name      testSafeFileIo0216
     * @tc.desc      Write 745 bytes, truncate to 372, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_216.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(745);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 215) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(745);
        fileIo.truncateSync(file.fd, 372);
        expect(fileIo.statSync(path).size).assertEqual(372);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(372);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(372);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(372);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0217
     * @tc.name      testSafeFileIo0217
     * @tc.desc      Write 748 bytes, truncate to 374, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_217.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(748);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 216) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(748);
        fileIo.truncateSync(file.fd, 374);
        expect(fileIo.statSync(path).size).assertEqual(374);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(374);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(374);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(374);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0218
     * @tc.name      testSafeFileIo0218
     * @tc.desc      Write 751 bytes, truncate to 375, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_218.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(751);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 217) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(751);
        fileIo.truncateSync(file.fd, 375);
        expect(fileIo.statSync(path).size).assertEqual(375);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(375);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(375);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(375);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0219
     * @tc.name      testSafeFileIo0219
     * @tc.desc      Write 754 bytes, truncate to 377, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_219.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(754);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 218) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(754);
        fileIo.truncateSync(file.fd, 377);
        expect(fileIo.statSync(path).size).assertEqual(377);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(377);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(377);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(377);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0220
     * @tc.name      testSafeFileIo0220
     * @tc.desc      Write 757 bytes, truncate to 378, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_220.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(757);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 219) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(757);
        fileIo.truncateSync(file.fd, 378);
        expect(fileIo.statSync(path).size).assertEqual(378);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(378);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(378);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(378);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0221
     * @tc.name      testSafeFileIo0221
     * @tc.desc      Write 760 bytes, truncate to 380, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_221.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(760);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 220) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(760);
        fileIo.truncateSync(file.fd, 380);
        expect(fileIo.statSync(path).size).assertEqual(380);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(380);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(380);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(380);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0222
     * @tc.name      testSafeFileIo0222
     * @tc.desc      Write 763 bytes, truncate to 381, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_222.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(763);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 221) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(763);
        fileIo.truncateSync(file.fd, 381);
        expect(fileIo.statSync(path).size).assertEqual(381);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(381);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(381);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(381);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0223
     * @tc.name      testSafeFileIo0223
     * @tc.desc      Write 766 bytes, truncate to 383, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_223.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(766);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 222) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(766);
        fileIo.truncateSync(file.fd, 383);
        expect(fileIo.statSync(path).size).assertEqual(383);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(383);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(383);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(383);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0224
     * @tc.name      testSafeFileIo0224
     * @tc.desc      Write 769 bytes, truncate to 384, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_224.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(769);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 223) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(769);
        fileIo.truncateSync(file.fd, 384);
        expect(fileIo.statSync(path).size).assertEqual(384);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(384);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(384);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(384);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0225
     * @tc.name      testSafeFileIo0225
     * @tc.desc      Write 772 bytes, truncate to 386, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_225.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(772);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 224) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(772);
        fileIo.truncateSync(file.fd, 386);
        expect(fileIo.statSync(path).size).assertEqual(386);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(386);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(386);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(386);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0226
     * @tc.name      testSafeFileIo0226
     * @tc.desc      Write 775 bytes, truncate to 387, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_226.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(775);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 225) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(775);
        fileIo.truncateSync(file.fd, 387);
        expect(fileIo.statSync(path).size).assertEqual(387);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(387);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(387);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(387);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0227
     * @tc.name      testSafeFileIo0227
     * @tc.desc      Write 778 bytes, truncate to 389, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_227.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(778);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 226) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(778);
        fileIo.truncateSync(file.fd, 389);
        expect(fileIo.statSync(path).size).assertEqual(389);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(389);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(389);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(389);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0228
     * @tc.name      testSafeFileIo0228
     * @tc.desc      Write 781 bytes, truncate to 390, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_228.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(781);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 227) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(781);
        fileIo.truncateSync(file.fd, 390);
        expect(fileIo.statSync(path).size).assertEqual(390);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(390);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(390);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(390);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0229
     * @tc.name      testSafeFileIo0229
     * @tc.desc      Write 784 bytes, truncate to 392, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_229.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(784);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 228) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(784);
        fileIo.truncateSync(file.fd, 392);
        expect(fileIo.statSync(path).size).assertEqual(392);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(392);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(392);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(392);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0230
     * @tc.name      testSafeFileIo0230
     * @tc.desc      Write 787 bytes, truncate to 393, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_230.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(787);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 229) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(787);
        fileIo.truncateSync(file.fd, 393);
        expect(fileIo.statSync(path).size).assertEqual(393);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(393);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(393);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(393);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0231
     * @tc.name      testSafeFileIo0231
     * @tc.desc      Write 790 bytes, truncate to 395, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_231.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(790);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 230) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(790);
        fileIo.truncateSync(file.fd, 395);
        expect(fileIo.statSync(path).size).assertEqual(395);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(395);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(395);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(395);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0232
     * @tc.name      testSafeFileIo0232
     * @tc.desc      Write 793 bytes, truncate to 396, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_232.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(793);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 231) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(793);
        fileIo.truncateSync(file.fd, 396);
        expect(fileIo.statSync(path).size).assertEqual(396);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(396);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(396);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(396);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0233
     * @tc.name      testSafeFileIo0233
     * @tc.desc      Write 796 bytes, truncate to 398, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_233.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(796);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 232) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(796);
        fileIo.truncateSync(file.fd, 398);
        expect(fileIo.statSync(path).size).assertEqual(398);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(398);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(398);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(398);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0234
     * @tc.name      testSafeFileIo0234
     * @tc.desc      Write 799 bytes, truncate to 399, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_234.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(799);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 233) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(799);
        fileIo.truncateSync(file.fd, 399);
        expect(fileIo.statSync(path).size).assertEqual(399);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(399);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(399);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(399);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0235
     * @tc.name      testSafeFileIo0235
     * @tc.desc      Write 802 bytes, truncate to 401, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_235.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(802);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 234) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(802);
        fileIo.truncateSync(file.fd, 401);
        expect(fileIo.statSync(path).size).assertEqual(401);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(401);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(401);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(401);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0236
     * @tc.name      testSafeFileIo0236
     * @tc.desc      Write 805 bytes, truncate to 402, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_236.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(805);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 235) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(805);
        fileIo.truncateSync(file.fd, 402);
        expect(fileIo.statSync(path).size).assertEqual(402);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(402);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(402);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(402);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0237
     * @tc.name      testSafeFileIo0237
     * @tc.desc      Write 808 bytes, truncate to 404, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_237.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(808);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 236) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(808);
        fileIo.truncateSync(file.fd, 404);
        expect(fileIo.statSync(path).size).assertEqual(404);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(404);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(404);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(404);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0238
     * @tc.name      testSafeFileIo0238
     * @tc.desc      Write 811 bytes, truncate to 405, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_238.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(811);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 237) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(811);
        fileIo.truncateSync(file.fd, 405);
        expect(fileIo.statSync(path).size).assertEqual(405);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(405);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(405);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(405);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0239
     * @tc.name      testSafeFileIo0239
     * @tc.desc      Write 814 bytes, truncate to 407, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_239.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(814);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 238) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(814);
        fileIo.truncateSync(file.fd, 407);
        expect(fileIo.statSync(path).size).assertEqual(407);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(407);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(407);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(407);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0240
     * @tc.name      testSafeFileIo0240
     * @tc.desc      Write 817 bytes, truncate to 408, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_240.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(817);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 239) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(817);
        fileIo.truncateSync(file.fd, 408);
        expect(fileIo.statSync(path).size).assertEqual(408);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(408);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(408);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(408);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0241
     * @tc.name      testSafeFileIo0241
     * @tc.desc      Write 820 bytes, truncate to 410, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_241.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(820);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 240) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(820);
        fileIo.truncateSync(file.fd, 410);
        expect(fileIo.statSync(path).size).assertEqual(410);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(410);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(410);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(410);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0242
     * @tc.name      testSafeFileIo0242
     * @tc.desc      Write 823 bytes, truncate to 411, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_242.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(823);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 241) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(823);
        fileIo.truncateSync(file.fd, 411);
        expect(fileIo.statSync(path).size).assertEqual(411);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(411);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(411);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(411);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0243
     * @tc.name      testSafeFileIo0243
     * @tc.desc      Write 826 bytes, truncate to 413, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_243.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(826);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 242) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(826);
        fileIo.truncateSync(file.fd, 413);
        expect(fileIo.statSync(path).size).assertEqual(413);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(413);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(413);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(413);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0244
     * @tc.name      testSafeFileIo0244
     * @tc.desc      Write 829 bytes, truncate to 414, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_244.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(829);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 243) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(829);
        fileIo.truncateSync(file.fd, 414);
        expect(fileIo.statSync(path).size).assertEqual(414);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(414);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(414);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(414);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0245
     * @tc.name      testSafeFileIo0245
     * @tc.desc      Write 832 bytes, truncate to 416, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_245.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(832);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 244) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(832);
        fileIo.truncateSync(file.fd, 416);
        expect(fileIo.statSync(path).size).assertEqual(416);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(416);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(416);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(416);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0246
     * @tc.name      testSafeFileIo0246
     * @tc.desc      Write 835 bytes, truncate to 417, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_246.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(835);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 245) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(835);
        fileIo.truncateSync(file.fd, 417);
        expect(fileIo.statSync(path).size).assertEqual(417);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(417);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(417);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(417);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0247
     * @tc.name      testSafeFileIo0247
     * @tc.desc      Write 838 bytes, truncate to 419, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_247.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(838);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 246) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(838);
        fileIo.truncateSync(file.fd, 419);
        expect(fileIo.statSync(path).size).assertEqual(419);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(419);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(419);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(419);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0248
     * @tc.name      testSafeFileIo0248
     * @tc.desc      Write 841 bytes, truncate to 420, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_248.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(841);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 247) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(841);
        fileIo.truncateSync(file.fd, 420);
        expect(fileIo.statSync(path).size).assertEqual(420);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(420);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(420);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(420);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0249
     * @tc.name      testSafeFileIo0249
     * @tc.desc      Write 844 bytes, truncate to 422, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_249.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(844);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 248) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(844);
        fileIo.truncateSync(file.fd, 422);
        expect(fileIo.statSync(path).size).assertEqual(422);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(422);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(422);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(422);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0250
     * @tc.name      testSafeFileIo0250
     * @tc.desc      Write 847 bytes, truncate to 423, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_250.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(847);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 249) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(847);
        fileIo.truncateSync(file.fd, 423);
        expect(fileIo.statSync(path).size).assertEqual(423);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(423);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(423);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(423);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0251
     * @tc.name      testSafeFileIo0251
     * @tc.desc      Write 850 bytes, truncate to 425, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_251.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(850);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 250) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(850);
        fileIo.truncateSync(file.fd, 425);
        expect(fileIo.statSync(path).size).assertEqual(425);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(425);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(425);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(425);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0252
     * @tc.name      testSafeFileIo0252
     * @tc.desc      Write 853 bytes, truncate to 426, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_252.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(853);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 251) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(853);
        fileIo.truncateSync(file.fd, 426);
        expect(fileIo.statSync(path).size).assertEqual(426);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(426);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(426);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(426);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
  })
}
