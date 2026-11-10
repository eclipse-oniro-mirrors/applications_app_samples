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
import { describe, it, expect } from '@ohos/hypium';
import { fileIo } from '@kit.CoreFileKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const context = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();

export default function SubtitleSafeFileIoMiddleSecondTest() {
  describe('SubtitleSafeFileIoMiddleSecondTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0127
     * @tc.name      testSafeFileIo0127
     * @tc.desc      Write 478 bytes, truncate to 239, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0127', 0, () => {
      const path: string = `${context.filesDir}/safe_file_127.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(478);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 126) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(478);
        fileIo.truncateSync(file.fd, 239);
        expect(fileIo.statSync(path).size).assertEqual(239);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(239);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(239);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(239);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0128
     * @tc.name      testSafeFileIo0128
     * @tc.desc      Write 481 bytes, truncate to 240, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0128', 0, () => {
      const path: string = `${context.filesDir}/safe_file_128.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(481);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 127) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(481);
        fileIo.truncateSync(file.fd, 240);
        expect(fileIo.statSync(path).size).assertEqual(240);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(240);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(240);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(240);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0129
     * @tc.name      testSafeFileIo0129
     * @tc.desc      Write 484 bytes, truncate to 242, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0129', 0, () => {
      const path: string = `${context.filesDir}/safe_file_129.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(484);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 128) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(484);
        fileIo.truncateSync(file.fd, 242);
        expect(fileIo.statSync(path).size).assertEqual(242);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(242);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(242);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(242);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0130
     * @tc.name      testSafeFileIo0130
     * @tc.desc      Write 487 bytes, truncate to 243, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0130', 0, () => {
      const path: string = `${context.filesDir}/safe_file_130.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(487);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 129) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(487);
        fileIo.truncateSync(file.fd, 243);
        expect(fileIo.statSync(path).size).assertEqual(243);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(243);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(243);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(243);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0131
     * @tc.name      testSafeFileIo0131
     * @tc.desc      Write 490 bytes, truncate to 245, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0131', 0, () => {
      const path: string = `${context.filesDir}/safe_file_131.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(490);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 130) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(490);
        fileIo.truncateSync(file.fd, 245);
        expect(fileIo.statSync(path).size).assertEqual(245);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(245);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(245);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(245);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0132
     * @tc.name      testSafeFileIo0132
     * @tc.desc      Write 493 bytes, truncate to 246, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0132', 0, () => {
      const path: string = `${context.filesDir}/safe_file_132.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(493);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 131) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(493);
        fileIo.truncateSync(file.fd, 246);
        expect(fileIo.statSync(path).size).assertEqual(246);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(246);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(246);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(246);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0133
     * @tc.name      testSafeFileIo0133
     * @tc.desc      Write 496 bytes, truncate to 248, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0133', 0, () => {
      const path: string = `${context.filesDir}/safe_file_133.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(496);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 132) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(496);
        fileIo.truncateSync(file.fd, 248);
        expect(fileIo.statSync(path).size).assertEqual(248);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(248);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(248);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(248);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0134
     * @tc.name      testSafeFileIo0134
     * @tc.desc      Write 499 bytes, truncate to 249, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0134', 0, () => {
      const path: string = `${context.filesDir}/safe_file_134.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(499);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 133) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(499);
        fileIo.truncateSync(file.fd, 249);
        expect(fileIo.statSync(path).size).assertEqual(249);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(249);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(249);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(249);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0135
     * @tc.name      testSafeFileIo0135
     * @tc.desc      Write 502 bytes, truncate to 251, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0135', 0, () => {
      const path: string = `${context.filesDir}/safe_file_135.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(502);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 134) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(502);
        fileIo.truncateSync(file.fd, 251);
        expect(fileIo.statSync(path).size).assertEqual(251);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(251);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(251);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(251);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0136
     * @tc.name      testSafeFileIo0136
     * @tc.desc      Write 505 bytes, truncate to 252, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0136', 0, () => {
      const path: string = `${context.filesDir}/safe_file_136.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(505);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 135) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(505);
        fileIo.truncateSync(file.fd, 252);
        expect(fileIo.statSync(path).size).assertEqual(252);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(252);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(252);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(252);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0137
     * @tc.name      testSafeFileIo0137
     * @tc.desc      Write 508 bytes, truncate to 254, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0137', 0, () => {
      const path: string = `${context.filesDir}/safe_file_137.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(508);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 136) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(508);
        fileIo.truncateSync(file.fd, 254);
        expect(fileIo.statSync(path).size).assertEqual(254);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(254);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(254);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(254);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0138
     * @tc.name      testSafeFileIo0138
     * @tc.desc      Write 511 bytes, truncate to 255, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0138', 0, () => {
      const path: string = `${context.filesDir}/safe_file_138.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(511);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 137) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(511);
        fileIo.truncateSync(file.fd, 255);
        expect(fileIo.statSync(path).size).assertEqual(255);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(255);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(255);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(255);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0139
     * @tc.name      testSafeFileIo0139
     * @tc.desc      Write 514 bytes, truncate to 257, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0139', 0, () => {
      const path: string = `${context.filesDir}/safe_file_139.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(514);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 138) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(514);
        fileIo.truncateSync(file.fd, 257);
        expect(fileIo.statSync(path).size).assertEqual(257);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(257);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(257);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(257);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0140
     * @tc.name      testSafeFileIo0140
     * @tc.desc      Write 517 bytes, truncate to 258, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0140', 0, () => {
      const path: string = `${context.filesDir}/safe_file_140.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(517);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 139) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(517);
        fileIo.truncateSync(file.fd, 258);
        expect(fileIo.statSync(path).size).assertEqual(258);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(258);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(258);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(258);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0141
     * @tc.name      testSafeFileIo0141
     * @tc.desc      Write 520 bytes, truncate to 260, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0141', 0, () => {
      const path: string = `${context.filesDir}/safe_file_141.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(520);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 140) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(520);
        fileIo.truncateSync(file.fd, 260);
        expect(fileIo.statSync(path).size).assertEqual(260);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(260);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(260);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(260);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0142
     * @tc.name      testSafeFileIo0142
     * @tc.desc      Write 523 bytes, truncate to 261, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0142', 0, () => {
      const path: string = `${context.filesDir}/safe_file_142.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(523);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 141) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(523);
        fileIo.truncateSync(file.fd, 261);
        expect(fileIo.statSync(path).size).assertEqual(261);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(261);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(261);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(261);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0143
     * @tc.name      testSafeFileIo0143
     * @tc.desc      Write 526 bytes, truncate to 263, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0143', 0, () => {
      const path: string = `${context.filesDir}/safe_file_143.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(526);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 142) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(526);
        fileIo.truncateSync(file.fd, 263);
        expect(fileIo.statSync(path).size).assertEqual(263);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(263);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(263);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(263);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0144
     * @tc.name      testSafeFileIo0144
     * @tc.desc      Write 529 bytes, truncate to 264, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0144', 0, () => {
      const path: string = `${context.filesDir}/safe_file_144.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(529);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 143) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(529);
        fileIo.truncateSync(file.fd, 264);
        expect(fileIo.statSync(path).size).assertEqual(264);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(264);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(264);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(264);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0145
     * @tc.name      testSafeFileIo0145
     * @tc.desc      Write 532 bytes, truncate to 266, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0145', 0, () => {
      const path: string = `${context.filesDir}/safe_file_145.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(532);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 144) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(532);
        fileIo.truncateSync(file.fd, 266);
        expect(fileIo.statSync(path).size).assertEqual(266);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(266);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(266);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(266);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0146
     * @tc.name      testSafeFileIo0146
     * @tc.desc      Write 535 bytes, truncate to 267, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0146', 0, () => {
      const path: string = `${context.filesDir}/safe_file_146.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(535);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 145) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(535);
        fileIo.truncateSync(file.fd, 267);
        expect(fileIo.statSync(path).size).assertEqual(267);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(267);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(267);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(267);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0147
     * @tc.name      testSafeFileIo0147
     * @tc.desc      Write 538 bytes, truncate to 269, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0147', 0, () => {
      const path: string = `${context.filesDir}/safe_file_147.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(538);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 146) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(538);
        fileIo.truncateSync(file.fd, 269);
        expect(fileIo.statSync(path).size).assertEqual(269);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(269);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(269);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(269);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0148
     * @tc.name      testSafeFileIo0148
     * @tc.desc      Write 541 bytes, truncate to 270, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0148', 0, () => {
      const path: string = `${context.filesDir}/safe_file_148.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(541);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 147) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(541);
        fileIo.truncateSync(file.fd, 270);
        expect(fileIo.statSync(path).size).assertEqual(270);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(270);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(270);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(270);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0149
     * @tc.name      testSafeFileIo0149
     * @tc.desc      Write 544 bytes, truncate to 272, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0149', 0, () => {
      const path: string = `${context.filesDir}/safe_file_149.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(544);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 148) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(544);
        fileIo.truncateSync(file.fd, 272);
        expect(fileIo.statSync(path).size).assertEqual(272);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(272);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(272);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(272);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0150
     * @tc.name      testSafeFileIo0150
     * @tc.desc      Write 547 bytes, truncate to 273, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0150', 0, () => {
      const path: string = `${context.filesDir}/safe_file_150.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(547);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 149) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(547);
        fileIo.truncateSync(file.fd, 273);
        expect(fileIo.statSync(path).size).assertEqual(273);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(273);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(273);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(273);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0151
     * @tc.name      testSafeFileIo0151
     * @tc.desc      Write 550 bytes, truncate to 275, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0151', 0, () => {
      const path: string = `${context.filesDir}/safe_file_151.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(550);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 150) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(550);
        fileIo.truncateSync(file.fd, 275);
        expect(fileIo.statSync(path).size).assertEqual(275);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(275);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(275);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(275);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0152
     * @tc.name      testSafeFileIo0152
     * @tc.desc      Write 553 bytes, truncate to 276, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0152', 0, () => {
      const path: string = `${context.filesDir}/safe_file_152.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(553);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 151) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(553);
        fileIo.truncateSync(file.fd, 276);
        expect(fileIo.statSync(path).size).assertEqual(276);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(276);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(276);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(276);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0153
     * @tc.name      testSafeFileIo0153
     * @tc.desc      Write 556 bytes, truncate to 278, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0153', 0, () => {
      const path: string = `${context.filesDir}/safe_file_153.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(556);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 152) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(556);
        fileIo.truncateSync(file.fd, 278);
        expect(fileIo.statSync(path).size).assertEqual(278);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(278);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(278);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(278);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0154
     * @tc.name      testSafeFileIo0154
     * @tc.desc      Write 559 bytes, truncate to 279, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0154', 0, () => {
      const path: string = `${context.filesDir}/safe_file_154.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(559);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 153) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(559);
        fileIo.truncateSync(file.fd, 279);
        expect(fileIo.statSync(path).size).assertEqual(279);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(279);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(279);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(279);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0155
     * @tc.name      testSafeFileIo0155
     * @tc.desc      Write 562 bytes, truncate to 281, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0155', 0, () => {
      const path: string = `${context.filesDir}/safe_file_155.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(562);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 154) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(562);
        fileIo.truncateSync(file.fd, 281);
        expect(fileIo.statSync(path).size).assertEqual(281);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(281);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(281);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(281);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0156
     * @tc.name      testSafeFileIo0156
     * @tc.desc      Write 565 bytes, truncate to 282, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0156', 0, () => {
      const path: string = `${context.filesDir}/safe_file_156.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(565);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 155) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(565);
        fileIo.truncateSync(file.fd, 282);
        expect(fileIo.statSync(path).size).assertEqual(282);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(282);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(282);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(282);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0157
     * @tc.name      testSafeFileIo0157
     * @tc.desc      Write 568 bytes, truncate to 284, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0157', 0, () => {
      const path: string = `${context.filesDir}/safe_file_157.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(568);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 156) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(568);
        fileIo.truncateSync(file.fd, 284);
        expect(fileIo.statSync(path).size).assertEqual(284);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(284);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(284);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(284);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0158
     * @tc.name      testSafeFileIo0158
     * @tc.desc      Write 571 bytes, truncate to 285, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0158', 0, () => {
      const path: string = `${context.filesDir}/safe_file_158.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(571);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 157) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(571);
        fileIo.truncateSync(file.fd, 285);
        expect(fileIo.statSync(path).size).assertEqual(285);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(285);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(285);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(285);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0159
     * @tc.name      testSafeFileIo0159
     * @tc.desc      Write 574 bytes, truncate to 287, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0159', 0, () => {
      const path: string = `${context.filesDir}/safe_file_159.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(574);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 158) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(574);
        fileIo.truncateSync(file.fd, 287);
        expect(fileIo.statSync(path).size).assertEqual(287);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(287);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(287);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(287);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0160
     * @tc.name      testSafeFileIo0160
     * @tc.desc      Write 577 bytes, truncate to 288, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0160', 0, () => {
      const path: string = `${context.filesDir}/safe_file_160.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(577);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 159) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(577);
        fileIo.truncateSync(file.fd, 288);
        expect(fileIo.statSync(path).size).assertEqual(288);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(288);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(288);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(288);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0161
     * @tc.name      testSafeFileIo0161
     * @tc.desc      Write 580 bytes, truncate to 290, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0161', 0, () => {
      const path: string = `${context.filesDir}/safe_file_161.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(580);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 160) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(580);
        fileIo.truncateSync(file.fd, 290);
        expect(fileIo.statSync(path).size).assertEqual(290);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(290);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(290);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(290);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0162
     * @tc.name      testSafeFileIo0162
     * @tc.desc      Write 583 bytes, truncate to 291, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0162', 0, () => {
      const path: string = `${context.filesDir}/safe_file_162.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(583);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 161) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(583);
        fileIo.truncateSync(file.fd, 291);
        expect(fileIo.statSync(path).size).assertEqual(291);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(291);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(291);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(291);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0163
     * @tc.name      testSafeFileIo0163
     * @tc.desc      Write 586 bytes, truncate to 293, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0163', 0, () => {
      const path: string = `${context.filesDir}/safe_file_163.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(586);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 162) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(586);
        fileIo.truncateSync(file.fd, 293);
        expect(fileIo.statSync(path).size).assertEqual(293);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(293);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(293);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(293);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0164
     * @tc.name      testSafeFileIo0164
     * @tc.desc      Write 589 bytes, truncate to 294, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0164', 0, () => {
      const path: string = `${context.filesDir}/safe_file_164.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(589);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 163) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(589);
        fileIo.truncateSync(file.fd, 294);
        expect(fileIo.statSync(path).size).assertEqual(294);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(294);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(294);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(294);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0165
     * @tc.name      testSafeFileIo0165
     * @tc.desc      Write 592 bytes, truncate to 296, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0165', 0, () => {
      const path: string = `${context.filesDir}/safe_file_165.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(592);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 164) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(592);
        fileIo.truncateSync(file.fd, 296);
        expect(fileIo.statSync(path).size).assertEqual(296);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(296);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(296);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(296);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0166
     * @tc.name      testSafeFileIo0166
     * @tc.desc      Write 595 bytes, truncate to 297, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0166', 0, () => {
      const path: string = `${context.filesDir}/safe_file_166.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(595);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 165) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(595);
        fileIo.truncateSync(file.fd, 297);
        expect(fileIo.statSync(path).size).assertEqual(297);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(297);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(297);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(297);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0167
     * @tc.name      testSafeFileIo0167
     * @tc.desc      Write 598 bytes, truncate to 299, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0167', 0, () => {
      const path: string = `${context.filesDir}/safe_file_167.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(598);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 166) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(598);
        fileIo.truncateSync(file.fd, 299);
        expect(fileIo.statSync(path).size).assertEqual(299);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(299);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(299);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(299);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0168
     * @tc.name      testSafeFileIo0168
     * @tc.desc      Write 601 bytes, truncate to 300, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0168', 0, () => {
      const path: string = `${context.filesDir}/safe_file_168.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(601);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 167) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(601);
        fileIo.truncateSync(file.fd, 300);
        expect(fileIo.statSync(path).size).assertEqual(300);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(300);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(300);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(300);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
  })
}
