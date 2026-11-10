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

export default function SubtitleSafeFileIoCoreFirstTest() {
  describe('SubtitleSafeFileIoCoreFirstTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0001
     * @tc.name      testSafeFileIo0001
     * @tc.desc      Write 100 bytes, truncate to 50, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0001', 0, () => {
      const path: string = `${context.filesDir}/safe_file_1.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(100);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 0) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(100);
        fileIo.truncateSync(file.fd, 50);
        expect(fileIo.statSync(path).size).assertEqual(50);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(50);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(50);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(50);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0002
     * @tc.name      testSafeFileIo0002
     * @tc.desc      Write 103 bytes, truncate to 51, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0002', 0, () => {
      const path: string = `${context.filesDir}/safe_file_2.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(103);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 1) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(103);
        fileIo.truncateSync(file.fd, 51);
        expect(fileIo.statSync(path).size).assertEqual(51);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(51);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(51);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(51);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0003
     * @tc.name      testSafeFileIo0003
     * @tc.desc      Write 106 bytes, truncate to 53, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0003', 0, () => {
      const path: string = `${context.filesDir}/safe_file_3.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(106);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 2) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(106);
        fileIo.truncateSync(file.fd, 53);
        expect(fileIo.statSync(path).size).assertEqual(53);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(53);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(53);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(53);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0004
     * @tc.name      testSafeFileIo0004
     * @tc.desc      Write 109 bytes, truncate to 54, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0004', 0, () => {
      const path: string = `${context.filesDir}/safe_file_4.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(109);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 3) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(109);
        fileIo.truncateSync(file.fd, 54);
        expect(fileIo.statSync(path).size).assertEqual(54);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(54);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(54);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(54);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0005
     * @tc.name      testSafeFileIo0005
     * @tc.desc      Write 112 bytes, truncate to 56, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0005', 0, () => {
      const path: string = `${context.filesDir}/safe_file_5.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(112);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 4) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(112);
        fileIo.truncateSync(file.fd, 56);
        expect(fileIo.statSync(path).size).assertEqual(56);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(56);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(56);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(56);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0006
     * @tc.name      testSafeFileIo0006
     * @tc.desc      Write 115 bytes, truncate to 57, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0006', 0, () => {
      const path: string = `${context.filesDir}/safe_file_6.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(115);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 5) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(115);
        fileIo.truncateSync(file.fd, 57);
        expect(fileIo.statSync(path).size).assertEqual(57);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(57);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(57);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(57);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0007
     * @tc.name      testSafeFileIo0007
     * @tc.desc      Write 118 bytes, truncate to 59, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0007', 0, () => {
      const path: string = `${context.filesDir}/safe_file_7.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(118);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 6) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(118);
        fileIo.truncateSync(file.fd, 59);
        expect(fileIo.statSync(path).size).assertEqual(59);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(59);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(59);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(59);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0008
     * @tc.name      testSafeFileIo0008
     * @tc.desc      Write 121 bytes, truncate to 60, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0008', 0, () => {
      const path: string = `${context.filesDir}/safe_file_8.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(121);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 7) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(121);
        fileIo.truncateSync(file.fd, 60);
        expect(fileIo.statSync(path).size).assertEqual(60);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(60);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(60);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(60);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0009
     * @tc.name      testSafeFileIo0009
     * @tc.desc      Write 124 bytes, truncate to 62, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0009', 0, () => {
      const path: string = `${context.filesDir}/safe_file_9.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(124);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 8) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(124);
        fileIo.truncateSync(file.fd, 62);
        expect(fileIo.statSync(path).size).assertEqual(62);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(62);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(62);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(62);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0010
     * @tc.name      testSafeFileIo0010
     * @tc.desc      Write 127 bytes, truncate to 63, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0010', 0, () => {
      const path: string = `${context.filesDir}/safe_file_10.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(127);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 9) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(127);
        fileIo.truncateSync(file.fd, 63);
        expect(fileIo.statSync(path).size).assertEqual(63);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(63);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(63);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(63);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0011
     * @tc.name      testSafeFileIo0011
     * @tc.desc      Write 130 bytes, truncate to 65, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0011', 0, () => {
      const path: string = `${context.filesDir}/safe_file_11.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(130);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 10) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(130);
        fileIo.truncateSync(file.fd, 65);
        expect(fileIo.statSync(path).size).assertEqual(65);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(65);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(65);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(65);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0012
     * @tc.name      testSafeFileIo0012
     * @tc.desc      Write 133 bytes, truncate to 66, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0012', 0, () => {
      const path: string = `${context.filesDir}/safe_file_12.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(133);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 11) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(133);
        fileIo.truncateSync(file.fd, 66);
        expect(fileIo.statSync(path).size).assertEqual(66);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(66);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(66);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(66);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0013
     * @tc.name      testSafeFileIo0013
     * @tc.desc      Write 136 bytes, truncate to 68, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0013', 0, () => {
      const path: string = `${context.filesDir}/safe_file_13.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(136);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 12) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(136);
        fileIo.truncateSync(file.fd, 68);
        expect(fileIo.statSync(path).size).assertEqual(68);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(68);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(68);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(68);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0014
     * @tc.name      testSafeFileIo0014
     * @tc.desc      Write 139 bytes, truncate to 69, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0014', 0, () => {
      const path: string = `${context.filesDir}/safe_file_14.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(139);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 13) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(139);
        fileIo.truncateSync(file.fd, 69);
        expect(fileIo.statSync(path).size).assertEqual(69);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(69);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(69);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(69);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0015
     * @tc.name      testSafeFileIo0015
     * @tc.desc      Write 142 bytes, truncate to 71, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0015', 0, () => {
      const path: string = `${context.filesDir}/safe_file_15.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(142);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 14) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(142);
        fileIo.truncateSync(file.fd, 71);
        expect(fileIo.statSync(path).size).assertEqual(71);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(71);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(71);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(71);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0016
     * @tc.name      testSafeFileIo0016
     * @tc.desc      Write 145 bytes, truncate to 72, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0016', 0, () => {
      const path: string = `${context.filesDir}/safe_file_16.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(145);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 15) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(145);
        fileIo.truncateSync(file.fd, 72);
        expect(fileIo.statSync(path).size).assertEqual(72);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(72);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(72);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(72);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0017
     * @tc.name      testSafeFileIo0017
     * @tc.desc      Write 148 bytes, truncate to 74, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0017', 0, () => {
      const path: string = `${context.filesDir}/safe_file_17.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(148);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 16) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(148);
        fileIo.truncateSync(file.fd, 74);
        expect(fileIo.statSync(path).size).assertEqual(74);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(74);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(74);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(74);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0018
     * @tc.name      testSafeFileIo0018
     * @tc.desc      Write 151 bytes, truncate to 75, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0018', 0, () => {
      const path: string = `${context.filesDir}/safe_file_18.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(151);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 17) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(151);
        fileIo.truncateSync(file.fd, 75);
        expect(fileIo.statSync(path).size).assertEqual(75);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(75);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(75);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(75);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0019
     * @tc.name      testSafeFileIo0019
     * @tc.desc      Write 154 bytes, truncate to 77, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0019', 0, () => {
      const path: string = `${context.filesDir}/safe_file_19.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(154);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 18) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(154);
        fileIo.truncateSync(file.fd, 77);
        expect(fileIo.statSync(path).size).assertEqual(77);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(77);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(77);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(77);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0020
     * @tc.name      testSafeFileIo0020
     * @tc.desc      Write 157 bytes, truncate to 78, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0020', 0, () => {
      const path: string = `${context.filesDir}/safe_file_20.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(157);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 19) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(157);
        fileIo.truncateSync(file.fd, 78);
        expect(fileIo.statSync(path).size).assertEqual(78);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(78);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(78);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(78);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0021
     * @tc.name      testSafeFileIo0021
     * @tc.desc      Write 160 bytes, truncate to 80, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0021', 0, () => {
      const path: string = `${context.filesDir}/safe_file_21.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(160);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 20) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(160);
        fileIo.truncateSync(file.fd, 80);
        expect(fileIo.statSync(path).size).assertEqual(80);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(80);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(80);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(80);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0022
     * @tc.name      testSafeFileIo0022
     * @tc.desc      Write 163 bytes, truncate to 81, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0022', 0, () => {
      const path: string = `${context.filesDir}/safe_file_22.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(163);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 21) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(163);
        fileIo.truncateSync(file.fd, 81);
        expect(fileIo.statSync(path).size).assertEqual(81);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(81);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(81);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(81);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0023
     * @tc.name      testSafeFileIo0023
     * @tc.desc      Write 166 bytes, truncate to 83, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0023', 0, () => {
      const path: string = `${context.filesDir}/safe_file_23.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(166);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 22) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(166);
        fileIo.truncateSync(file.fd, 83);
        expect(fileIo.statSync(path).size).assertEqual(83);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(83);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(83);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(83);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0024
     * @tc.name      testSafeFileIo0024
     * @tc.desc      Write 169 bytes, truncate to 84, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0024', 0, () => {
      const path: string = `${context.filesDir}/safe_file_24.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(169);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 23) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(169);
        fileIo.truncateSync(file.fd, 84);
        expect(fileIo.statSync(path).size).assertEqual(84);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(84);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(84);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(84);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0025
     * @tc.name      testSafeFileIo0025
     * @tc.desc      Write 172 bytes, truncate to 86, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0025', 0, () => {
      const path: string = `${context.filesDir}/safe_file_25.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(172);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 24) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(172);
        fileIo.truncateSync(file.fd, 86);
        expect(fileIo.statSync(path).size).assertEqual(86);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(86);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(86);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(86);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0026
     * @tc.name      testSafeFileIo0026
     * @tc.desc      Write 175 bytes, truncate to 87, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0026', 0, () => {
      const path: string = `${context.filesDir}/safe_file_26.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(175);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 25) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(175);
        fileIo.truncateSync(file.fd, 87);
        expect(fileIo.statSync(path).size).assertEqual(87);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(87);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(87);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(87);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0027
     * @tc.name      testSafeFileIo0027
     * @tc.desc      Write 178 bytes, truncate to 89, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0027', 0, () => {
      const path: string = `${context.filesDir}/safe_file_27.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(178);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 26) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(178);
        fileIo.truncateSync(file.fd, 89);
        expect(fileIo.statSync(path).size).assertEqual(89);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(89);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(89);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(89);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0028
     * @tc.name      testSafeFileIo0028
     * @tc.desc      Write 181 bytes, truncate to 90, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0028', 0, () => {
      const path: string = `${context.filesDir}/safe_file_28.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(181);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 27) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(181);
        fileIo.truncateSync(file.fd, 90);
        expect(fileIo.statSync(path).size).assertEqual(90);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(90);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(90);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(90);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0029
     * @tc.name      testSafeFileIo0029
     * @tc.desc      Write 184 bytes, truncate to 92, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0029', 0, () => {
      const path: string = `${context.filesDir}/safe_file_29.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(184);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 28) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(184);
        fileIo.truncateSync(file.fd, 92);
        expect(fileIo.statSync(path).size).assertEqual(92);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(92);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(92);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(92);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0030
     * @tc.name      testSafeFileIo0030
     * @tc.desc      Write 187 bytes, truncate to 93, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0030', 0, () => {
      const path: string = `${context.filesDir}/safe_file_30.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(187);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 29) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(187);
        fileIo.truncateSync(file.fd, 93);
        expect(fileIo.statSync(path).size).assertEqual(93);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(93);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(93);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(93);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0031
     * @tc.name      testSafeFileIo0031
     * @tc.desc      Write 190 bytes, truncate to 95, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0031', 0, () => {
      const path: string = `${context.filesDir}/safe_file_31.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(190);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 30) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(190);
        fileIo.truncateSync(file.fd, 95);
        expect(fileIo.statSync(path).size).assertEqual(95);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(95);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(95);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(95);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0032
     * @tc.name      testSafeFileIo0032
     * @tc.desc      Write 193 bytes, truncate to 96, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0032', 0, () => {
      const path: string = `${context.filesDir}/safe_file_32.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(193);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 31) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(193);
        fileIo.truncateSync(file.fd, 96);
        expect(fileIo.statSync(path).size).assertEqual(96);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(96);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(96);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(96);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0033
     * @tc.name      testSafeFileIo0033
     * @tc.desc      Write 196 bytes, truncate to 98, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0033', 0, () => {
      const path: string = `${context.filesDir}/safe_file_33.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(196);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 32) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(196);
        fileIo.truncateSync(file.fd, 98);
        expect(fileIo.statSync(path).size).assertEqual(98);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(98);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(98);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(98);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0034
     * @tc.name      testSafeFileIo0034
     * @tc.desc      Write 199 bytes, truncate to 99, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0034', 0, () => {
      const path: string = `${context.filesDir}/safe_file_34.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(199);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 33) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(199);
        fileIo.truncateSync(file.fd, 99);
        expect(fileIo.statSync(path).size).assertEqual(99);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(99);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(99);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(99);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0035
     * @tc.name      testSafeFileIo0035
     * @tc.desc      Write 202 bytes, truncate to 101, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0035', 0, () => {
      const path: string = `${context.filesDir}/safe_file_35.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(202);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 34) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(202);
        fileIo.truncateSync(file.fd, 101);
        expect(fileIo.statSync(path).size).assertEqual(101);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(101);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(101);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(101);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0036
     * @tc.name      testSafeFileIo0036
     * @tc.desc      Write 205 bytes, truncate to 102, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0036', 0, () => {
      const path: string = `${context.filesDir}/safe_file_36.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(205);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 35) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(205);
        fileIo.truncateSync(file.fd, 102);
        expect(fileIo.statSync(path).size).assertEqual(102);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(102);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(102);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(102);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0037
     * @tc.name      testSafeFileIo0037
     * @tc.desc      Write 208 bytes, truncate to 104, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0037', 0, () => {
      const path: string = `${context.filesDir}/safe_file_37.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(208);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 36) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(208);
        fileIo.truncateSync(file.fd, 104);
        expect(fileIo.statSync(path).size).assertEqual(104);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(104);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(104);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(104);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0038
     * @tc.name      testSafeFileIo0038
     * @tc.desc      Write 211 bytes, truncate to 105, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0038', 0, () => {
      const path: string = `${context.filesDir}/safe_file_38.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(211);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 37) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(211);
        fileIo.truncateSync(file.fd, 105);
        expect(fileIo.statSync(path).size).assertEqual(105);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(105);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(105);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(105);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0039
     * @tc.name      testSafeFileIo0039
     * @tc.desc      Write 214 bytes, truncate to 107, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0039', 0, () => {
      const path: string = `${context.filesDir}/safe_file_39.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(214);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 38) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(214);
        fileIo.truncateSync(file.fd, 107);
        expect(fileIo.statSync(path).size).assertEqual(107);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(107);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(107);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(107);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0040
     * @tc.name      testSafeFileIo0040
     * @tc.desc      Write 217 bytes, truncate to 108, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0040', 0, () => {
      const path: string = `${context.filesDir}/safe_file_40.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(217);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 39) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(217);
        fileIo.truncateSync(file.fd, 108);
        expect(fileIo.statSync(path).size).assertEqual(108);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(108);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(108);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(108);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0041
     * @tc.name      testSafeFileIo0041
     * @tc.desc      Write 220 bytes, truncate to 110, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0041', 0, () => {
      const path: string = `${context.filesDir}/safe_file_41.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(220);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 40) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(220);
        fileIo.truncateSync(file.fd, 110);
        expect(fileIo.statSync(path).size).assertEqual(110);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(110);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(110);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(110);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0042
     * @tc.name      testSafeFileIo0042
     * @tc.desc      Write 223 bytes, truncate to 111, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0042', 0, () => {
      const path: string = `${context.filesDir}/safe_file_42.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(223);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 41) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(223);
        fileIo.truncateSync(file.fd, 111);
        expect(fileIo.statSync(path).size).assertEqual(111);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(111);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(111);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(111);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
  })
}
