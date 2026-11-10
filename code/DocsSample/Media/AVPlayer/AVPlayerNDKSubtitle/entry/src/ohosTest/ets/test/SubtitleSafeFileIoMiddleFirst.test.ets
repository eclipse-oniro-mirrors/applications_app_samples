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

export default function SubtitleSafeFileIoMiddleFirstTest() {
  describe('SubtitleSafeFileIoMiddleFirstTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0085
     * @tc.name      testSafeFileIo0085
     * @tc.desc      Write 352 bytes, truncate to 176, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0085', 0, () => {
      const path: string = `${context.filesDir}/safe_file_85.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(352);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 84) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(352);
        fileIo.truncateSync(file.fd, 176);
        expect(fileIo.statSync(path).size).assertEqual(176);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(176);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(176);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(176);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0086
     * @tc.name      testSafeFileIo0086
     * @tc.desc      Write 355 bytes, truncate to 177, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0086', 0, () => {
      const path: string = `${context.filesDir}/safe_file_86.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(355);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 85) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(355);
        fileIo.truncateSync(file.fd, 177);
        expect(fileIo.statSync(path).size).assertEqual(177);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(177);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(177);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(177);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0087
     * @tc.name      testSafeFileIo0087
     * @tc.desc      Write 358 bytes, truncate to 179, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0087', 0, () => {
      const path: string = `${context.filesDir}/safe_file_87.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(358);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 86) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(358);
        fileIo.truncateSync(file.fd, 179);
        expect(fileIo.statSync(path).size).assertEqual(179);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(179);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(179);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(179);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0088
     * @tc.name      testSafeFileIo0088
     * @tc.desc      Write 361 bytes, truncate to 180, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0088', 0, () => {
      const path: string = `${context.filesDir}/safe_file_88.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(361);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 87) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(361);
        fileIo.truncateSync(file.fd, 180);
        expect(fileIo.statSync(path).size).assertEqual(180);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(180);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(180);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(180);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0089
     * @tc.name      testSafeFileIo0089
     * @tc.desc      Write 364 bytes, truncate to 182, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0089', 0, () => {
      const path: string = `${context.filesDir}/safe_file_89.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(364);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 88) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(364);
        fileIo.truncateSync(file.fd, 182);
        expect(fileIo.statSync(path).size).assertEqual(182);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(182);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(182);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(182);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0090
     * @tc.name      testSafeFileIo0090
     * @tc.desc      Write 367 bytes, truncate to 183, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0090', 0, () => {
      const path: string = `${context.filesDir}/safe_file_90.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(367);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 89) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(367);
        fileIo.truncateSync(file.fd, 183);
        expect(fileIo.statSync(path).size).assertEqual(183);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(183);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(183);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(183);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0091
     * @tc.name      testSafeFileIo0091
     * @tc.desc      Write 370 bytes, truncate to 185, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0091', 0, () => {
      const path: string = `${context.filesDir}/safe_file_91.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(370);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 90) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(370);
        fileIo.truncateSync(file.fd, 185);
        expect(fileIo.statSync(path).size).assertEqual(185);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(185);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(185);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(185);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0092
     * @tc.name      testSafeFileIo0092
     * @tc.desc      Write 373 bytes, truncate to 186, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0092', 0, () => {
      const path: string = `${context.filesDir}/safe_file_92.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(373);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 91) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(373);
        fileIo.truncateSync(file.fd, 186);
        expect(fileIo.statSync(path).size).assertEqual(186);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(186);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(186);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(186);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0093
     * @tc.name      testSafeFileIo0093
     * @tc.desc      Write 376 bytes, truncate to 188, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0093', 0, () => {
      const path: string = `${context.filesDir}/safe_file_93.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(376);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 92) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(376);
        fileIo.truncateSync(file.fd, 188);
        expect(fileIo.statSync(path).size).assertEqual(188);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(188);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(188);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(188);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0094
     * @tc.name      testSafeFileIo0094
     * @tc.desc      Write 379 bytes, truncate to 189, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0094', 0, () => {
      const path: string = `${context.filesDir}/safe_file_94.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(379);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 93) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(379);
        fileIo.truncateSync(file.fd, 189);
        expect(fileIo.statSync(path).size).assertEqual(189);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(189);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(189);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(189);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0095
     * @tc.name      testSafeFileIo0095
     * @tc.desc      Write 382 bytes, truncate to 191, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0095', 0, () => {
      const path: string = `${context.filesDir}/safe_file_95.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(382);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 94) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(382);
        fileIo.truncateSync(file.fd, 191);
        expect(fileIo.statSync(path).size).assertEqual(191);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(191);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(191);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(191);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0096
     * @tc.name      testSafeFileIo0096
     * @tc.desc      Write 385 bytes, truncate to 192, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0096', 0, () => {
      const path: string = `${context.filesDir}/safe_file_96.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(385);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 95) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(385);
        fileIo.truncateSync(file.fd, 192);
        expect(fileIo.statSync(path).size).assertEqual(192);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(192);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(192);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(192);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0097
     * @tc.name      testSafeFileIo0097
     * @tc.desc      Write 388 bytes, truncate to 194, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0097', 0, () => {
      const path: string = `${context.filesDir}/safe_file_97.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(388);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 96) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(388);
        fileIo.truncateSync(file.fd, 194);
        expect(fileIo.statSync(path).size).assertEqual(194);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(194);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(194);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(194);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0098
     * @tc.name      testSafeFileIo0098
     * @tc.desc      Write 391 bytes, truncate to 195, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0098', 0, () => {
      const path: string = `${context.filesDir}/safe_file_98.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(391);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 97) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(391);
        fileIo.truncateSync(file.fd, 195);
        expect(fileIo.statSync(path).size).assertEqual(195);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(195);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(195);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(195);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0099
     * @tc.name      testSafeFileIo0099
     * @tc.desc      Write 394 bytes, truncate to 197, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0099', 0, () => {
      const path: string = `${context.filesDir}/safe_file_99.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(394);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 98) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(394);
        fileIo.truncateSync(file.fd, 197);
        expect(fileIo.statSync(path).size).assertEqual(197);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(197);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(197);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(197);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0100
     * @tc.name      testSafeFileIo0100
     * @tc.desc      Write 397 bytes, truncate to 198, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0100', 0, () => {
      const path: string = `${context.filesDir}/safe_file_100.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(397);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 99) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(397);
        fileIo.truncateSync(file.fd, 198);
        expect(fileIo.statSync(path).size).assertEqual(198);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(198);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(198);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(198);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0101
     * @tc.name      testSafeFileIo0101
     * @tc.desc      Write 400 bytes, truncate to 200, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0101', 0, () => {
      const path: string = `${context.filesDir}/safe_file_101.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(400);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 100) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(400);
        fileIo.truncateSync(file.fd, 200);
        expect(fileIo.statSync(path).size).assertEqual(200);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(200);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(200);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(200);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0102
     * @tc.name      testSafeFileIo0102
     * @tc.desc      Write 403 bytes, truncate to 201, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0102', 0, () => {
      const path: string = `${context.filesDir}/safe_file_102.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(403);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 101) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(403);
        fileIo.truncateSync(file.fd, 201);
        expect(fileIo.statSync(path).size).assertEqual(201);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(201);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(201);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(201);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0103
     * @tc.name      testSafeFileIo0103
     * @tc.desc      Write 406 bytes, truncate to 203, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0103', 0, () => {
      const path: string = `${context.filesDir}/safe_file_103.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(406);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 102) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(406);
        fileIo.truncateSync(file.fd, 203);
        expect(fileIo.statSync(path).size).assertEqual(203);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(203);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(203);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(203);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0104
     * @tc.name      testSafeFileIo0104
     * @tc.desc      Write 409 bytes, truncate to 204, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0104', 0, () => {
      const path: string = `${context.filesDir}/safe_file_104.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(409);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 103) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(409);
        fileIo.truncateSync(file.fd, 204);
        expect(fileIo.statSync(path).size).assertEqual(204);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(204);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(204);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(204);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0105
     * @tc.name      testSafeFileIo0105
     * @tc.desc      Write 412 bytes, truncate to 206, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0105', 0, () => {
      const path: string = `${context.filesDir}/safe_file_105.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(412);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 104) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(412);
        fileIo.truncateSync(file.fd, 206);
        expect(fileIo.statSync(path).size).assertEqual(206);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(206);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(206);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(206);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0106
     * @tc.name      testSafeFileIo0106
     * @tc.desc      Write 415 bytes, truncate to 207, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0106', 0, () => {
      const path: string = `${context.filesDir}/safe_file_106.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(415);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 105) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(415);
        fileIo.truncateSync(file.fd, 207);
        expect(fileIo.statSync(path).size).assertEqual(207);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(207);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(207);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(207);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0107
     * @tc.name      testSafeFileIo0107
     * @tc.desc      Write 418 bytes, truncate to 209, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0107', 0, () => {
      const path: string = `${context.filesDir}/safe_file_107.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(418);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 106) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(418);
        fileIo.truncateSync(file.fd, 209);
        expect(fileIo.statSync(path).size).assertEqual(209);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(209);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(209);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(209);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0108
     * @tc.name      testSafeFileIo0108
     * @tc.desc      Write 421 bytes, truncate to 210, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0108', 0, () => {
      const path: string = `${context.filesDir}/safe_file_108.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(421);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 107) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(421);
        fileIo.truncateSync(file.fd, 210);
        expect(fileIo.statSync(path).size).assertEqual(210);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(210);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(210);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(210);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0109
     * @tc.name      testSafeFileIo0109
     * @tc.desc      Write 424 bytes, truncate to 212, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0109', 0, () => {
      const path: string = `${context.filesDir}/safe_file_109.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(424);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 108) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(424);
        fileIo.truncateSync(file.fd, 212);
        expect(fileIo.statSync(path).size).assertEqual(212);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(212);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(212);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(212);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0110
     * @tc.name      testSafeFileIo0110
     * @tc.desc      Write 427 bytes, truncate to 213, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0110', 0, () => {
      const path: string = `${context.filesDir}/safe_file_110.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(427);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 109) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(427);
        fileIo.truncateSync(file.fd, 213);
        expect(fileIo.statSync(path).size).assertEqual(213);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(213);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(213);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(213);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0111
     * @tc.name      testSafeFileIo0111
     * @tc.desc      Write 430 bytes, truncate to 215, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0111', 0, () => {
      const path: string = `${context.filesDir}/safe_file_111.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(430);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 110) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(430);
        fileIo.truncateSync(file.fd, 215);
        expect(fileIo.statSync(path).size).assertEqual(215);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(215);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(215);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(215);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0112
     * @tc.name      testSafeFileIo0112
     * @tc.desc      Write 433 bytes, truncate to 216, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0112', 0, () => {
      const path: string = `${context.filesDir}/safe_file_112.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(433);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 111) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(433);
        fileIo.truncateSync(file.fd, 216);
        expect(fileIo.statSync(path).size).assertEqual(216);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(216);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(216);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(216);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0113
     * @tc.name      testSafeFileIo0113
     * @tc.desc      Write 436 bytes, truncate to 218, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0113', 0, () => {
      const path: string = `${context.filesDir}/safe_file_113.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(436);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 112) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(436);
        fileIo.truncateSync(file.fd, 218);
        expect(fileIo.statSync(path).size).assertEqual(218);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(218);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(218);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(218);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0114
     * @tc.name      testSafeFileIo0114
     * @tc.desc      Write 439 bytes, truncate to 219, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0114', 0, () => {
      const path: string = `${context.filesDir}/safe_file_114.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(439);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 113) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(439);
        fileIo.truncateSync(file.fd, 219);
        expect(fileIo.statSync(path).size).assertEqual(219);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(219);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(219);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(219);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0115
     * @tc.name      testSafeFileIo0115
     * @tc.desc      Write 442 bytes, truncate to 221, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0115', 0, () => {
      const path: string = `${context.filesDir}/safe_file_115.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(442);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 114) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(442);
        fileIo.truncateSync(file.fd, 221);
        expect(fileIo.statSync(path).size).assertEqual(221);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(221);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(221);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(221);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0116
     * @tc.name      testSafeFileIo0116
     * @tc.desc      Write 445 bytes, truncate to 222, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0116', 0, () => {
      const path: string = `${context.filesDir}/safe_file_116.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(445);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 115) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(445);
        fileIo.truncateSync(file.fd, 222);
        expect(fileIo.statSync(path).size).assertEqual(222);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(222);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(222);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(222);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0117
     * @tc.name      testSafeFileIo0117
     * @tc.desc      Write 448 bytes, truncate to 224, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0117', 0, () => {
      const path: string = `${context.filesDir}/safe_file_117.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(448);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 116) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(448);
        fileIo.truncateSync(file.fd, 224);
        expect(fileIo.statSync(path).size).assertEqual(224);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(224);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(224);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(224);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0118
     * @tc.name      testSafeFileIo0118
     * @tc.desc      Write 451 bytes, truncate to 225, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0118', 0, () => {
      const path: string = `${context.filesDir}/safe_file_118.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(451);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 117) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(451);
        fileIo.truncateSync(file.fd, 225);
        expect(fileIo.statSync(path).size).assertEqual(225);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(225);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(225);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(225);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0119
     * @tc.name      testSafeFileIo0119
     * @tc.desc      Write 454 bytes, truncate to 227, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0119', 0, () => {
      const path: string = `${context.filesDir}/safe_file_119.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(454);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 118) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(454);
        fileIo.truncateSync(file.fd, 227);
        expect(fileIo.statSync(path).size).assertEqual(227);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(227);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(227);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(227);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0120
     * @tc.name      testSafeFileIo0120
     * @tc.desc      Write 457 bytes, truncate to 228, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0120', 0, () => {
      const path: string = `${context.filesDir}/safe_file_120.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(457);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 119) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(457);
        fileIo.truncateSync(file.fd, 228);
        expect(fileIo.statSync(path).size).assertEqual(228);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(228);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(228);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(228);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0121
     * @tc.name      testSafeFileIo0121
     * @tc.desc      Write 460 bytes, truncate to 230, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0121', 0, () => {
      const path: string = `${context.filesDir}/safe_file_121.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(460);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 120) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(460);
        fileIo.truncateSync(file.fd, 230);
        expect(fileIo.statSync(path).size).assertEqual(230);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(230);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(230);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(230);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0122
     * @tc.name      testSafeFileIo0122
     * @tc.desc      Write 463 bytes, truncate to 231, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0122', 0, () => {
      const path: string = `${context.filesDir}/safe_file_122.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(463);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 121) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(463);
        fileIo.truncateSync(file.fd, 231);
        expect(fileIo.statSync(path).size).assertEqual(231);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(231);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(231);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(231);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0123
     * @tc.name      testSafeFileIo0123
     * @tc.desc      Write 466 bytes, truncate to 233, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0123', 0, () => {
      const path: string = `${context.filesDir}/safe_file_123.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(466);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 122) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(466);
        fileIo.truncateSync(file.fd, 233);
        expect(fileIo.statSync(path).size).assertEqual(233);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(233);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(233);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(233);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0124
     * @tc.name      testSafeFileIo0124
     * @tc.desc      Write 469 bytes, truncate to 234, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0124', 0, () => {
      const path: string = `${context.filesDir}/safe_file_124.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(469);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 123) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(469);
        fileIo.truncateSync(file.fd, 234);
        expect(fileIo.statSync(path).size).assertEqual(234);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(234);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(234);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(234);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0125
     * @tc.name      testSafeFileIo0125
     * @tc.desc      Write 472 bytes, truncate to 236, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0125', 0, () => {
      const path: string = `${context.filesDir}/safe_file_125.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(472);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 124) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(472);
        fileIo.truncateSync(file.fd, 236);
        expect(fileIo.statSync(path).size).assertEqual(236);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(236);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(236);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(236);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_SAFE_IO_0126
     * @tc.name      testSafeFileIo0126
     * @tc.desc      Write 475 bytes, truncate to 237, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0126', 0, () => {
      const path: string = `${context.filesDir}/safe_file_126.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(475);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 125) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(475);
        fileIo.truncateSync(file.fd, 237);
        expect(fileIo.statSync(path).size).assertEqual(237);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(237);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(237);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(237);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
  })
}
