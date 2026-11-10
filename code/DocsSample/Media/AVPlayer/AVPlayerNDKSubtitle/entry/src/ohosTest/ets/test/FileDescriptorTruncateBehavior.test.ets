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
import { abilityDelegatorRegistry } from '@kit.TestKit';

const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();



export default function fileDescriptorTruncateBehaviorTest() {
  describe('fileDescriptorTruncateBehaviorTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_FD_0001
     * @tc.name      testFinalFdTruncate0001
     * @tc.desc      File truncation from 200 to 100 bytes is observable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalFdTruncate0001', 0, () => {
      const path: string = `${context.filesDir}/fd_truncate_1.bin`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(200);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let j: number = 0; j < view.length; j++) {
          view[j] = j % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(200);
        fileIo.truncateSync(file.fd, 100);
        expect(fileIo.statSync(path).size).assertEqual(100);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(100);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(100);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(100);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_FD_0002
     * @tc.name      testFinalFdTruncate0002
     * @tc.desc      File truncation from 204 to 102 bytes is observable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalFdTruncate0002', 0, () => {
      const path: string = `${context.filesDir}/fd_truncate_2.bin`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(204);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let j: number = 0; j < view.length; j++) {
          view[j] = j % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(204);
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_FD_0003
     * @tc.name      testFinalFdTruncate0003
     * @tc.desc      File truncation from 208 to 104 bytes is observable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalFdTruncate0003', 0, () => {
      const path: string = `${context.filesDir}/fd_truncate_3.bin`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(208);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let j: number = 0; j < view.length; j++) {
          view[j] = j % 256;
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_FD_0004
     * @tc.name      testFinalFdTruncate0004
     * @tc.desc      File truncation from 212 to 106 bytes is observable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalFdTruncate0004', 0, () => {
      const path: string = `${context.filesDir}/fd_truncate_4.bin`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(212);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let j: number = 0; j < view.length; j++) {
          view[j] = j % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(212);
        fileIo.truncateSync(file.fd, 106);
        expect(fileIo.statSync(path).size).assertEqual(106);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(106);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(106);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(106);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_FD_0005
     * @tc.name      testFinalFdTruncate0005
     * @tc.desc      File truncation from 216 to 108 bytes is observable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalFdTruncate0005', 0, () => {
      const path: string = `${context.filesDir}/fd_truncate_5.bin`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(216);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let j: number = 0; j < view.length; j++) {
          view[j] = j % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(216);
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_FD_0006
     * @tc.name      testFinalFdTruncate0006
     * @tc.desc      File truncation from 220 to 110 bytes is observable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalFdTruncate0006', 0, () => {
      const path: string = `${context.filesDir}/fd_truncate_6.bin`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(220);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let j: number = 0; j < view.length; j++) {
          view[j] = j % 256;
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_FD_0007
     * @tc.name      testFinalFdTruncate0007
     * @tc.desc      File truncation from 224 to 112 bytes is observable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalFdTruncate0007', 0, () => {
      const path: string = `${context.filesDir}/fd_truncate_7.bin`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(224);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let j: number = 0; j < view.length; j++) {
          view[j] = j % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(224);
        fileIo.truncateSync(file.fd, 112);
        expect(fileIo.statSync(path).size).assertEqual(112);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(112);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(112);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(112);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_FD_0008
     * @tc.name      testFinalFdTruncate0008
     * @tc.desc      File truncation from 228 to 114 bytes is observable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalFdTruncate0008', 0, () => {
      const path: string = `${context.filesDir}/fd_truncate_8.bin`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(228);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let j: number = 0; j < view.length; j++) {
          view[j] = j % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(228);
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_FD_0009
     * @tc.name      testFinalFdTruncate0009
     * @tc.desc      File truncation from 232 to 116 bytes is observable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalFdTruncate0009', 0, () => {
      const path: string = `${context.filesDir}/fd_truncate_9.bin`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(232);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let j: number = 0; j < view.length; j++) {
          view[j] = j % 256;
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_FD_0010
     * @tc.name      testFinalFdTruncate0010
     * @tc.desc      File truncation from 236 to 118 bytes is observable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalFdTruncate0010', 0, () => {
      const path: string = `${context.filesDir}/fd_truncate_10.bin`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(236);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let j: number = 0; j < view.length; j++) {
          view[j] = j % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(236);
        fileIo.truncateSync(file.fd, 118);
        expect(fileIo.statSync(path).size).assertEqual(118);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(118);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(118);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(118);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_FD_0011
     * @tc.name      testFinalFdTruncate0011
     * @tc.desc      File truncation from 240 to 120 bytes is observable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalFdTruncate0011', 0, () => {
      const path: string = `${context.filesDir}/fd_truncate_11.bin`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(240);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let j: number = 0; j < view.length; j++) {
          view[j] = j % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(240);
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_FD_0012
     * @tc.name      testFinalFdTruncate0012
     * @tc.desc      File truncation from 244 to 122 bytes is observable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalFdTruncate0012', 0, () => {
      const path: string = `${context.filesDir}/fd_truncate_12.bin`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(244);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let j: number = 0; j < view.length; j++) {
          view[j] = j % 256;
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_FD_0013
     * @tc.name      testFinalFdTruncate0013
     * @tc.desc      File truncation from 248 to 124 bytes is observable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalFdTruncate0013', 0, () => {
      const path: string = `${context.filesDir}/fd_truncate_13.bin`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(248);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let j: number = 0; j < view.length; j++) {
          view[j] = j % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(248);
        fileIo.truncateSync(file.fd, 124);
        expect(fileIo.statSync(path).size).assertEqual(124);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(124);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(124);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(124);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_FD_0014
     * @tc.name      testFinalFdTruncate0014
     * @tc.desc      File truncation from 252 to 126 bytes is observable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalFdTruncate0014', 0, () => {
      const path: string = `${context.filesDir}/fd_truncate_14.bin`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(252);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let j: number = 0; j < view.length; j++) {
          view[j] = j % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(252);
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_FD_0015
     * @tc.name      testFinalFdTruncate0015
     * @tc.desc      File truncation from 256 to 128 bytes is observable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalFdTruncate0015', 0, () => {
      const path: string = `${context.filesDir}/fd_truncate_15.bin`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(256);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let j: number = 0; j < view.length; j++) {
          view[j] = j % 256;
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_FD_0016
     * @tc.name      testFinalFdTruncate0016
     * @tc.desc      File truncation from 260 to 130 bytes is observable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalFdTruncate0016', 0, () => {
      const path: string = `${context.filesDir}/fd_truncate_16.bin`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(260);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let j: number = 0; j < view.length; j++) {
          view[j] = j % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(260);
        fileIo.truncateSync(file.fd, 130);
        expect(fileIo.statSync(path).size).assertEqual(130);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(130);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(130);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(130);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_FD_0017
     * @tc.name      testFinalFdTruncate0017
     * @tc.desc      File truncation from 264 to 132 bytes is observable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalFdTruncate0017', 0, () => {
      const path: string = `${context.filesDir}/fd_truncate_17.bin`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(264);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let j: number = 0; j < view.length; j++) {
          view[j] = j % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(264);
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_FD_0018
     * @tc.name      testFinalFdTruncate0018
     * @tc.desc      File truncation from 268 to 134 bytes is observable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalFdTruncate0018', 0, () => {
      const path: string = `${context.filesDir}/fd_truncate_18.bin`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(268);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let j: number = 0; j < view.length; j++) {
          view[j] = j % 256;
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
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_FD_0019
     * @tc.name      testFinalFdTruncate0019
     * @tc.desc      File truncation from 272 to 136 bytes is observable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalFdTruncate0019', 0, () => {
      const path: string = `${context.filesDir}/fd_truncate_19.bin`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(272);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let j: number = 0; j < view.length; j++) {
          view[j] = j % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(272);
        fileIo.truncateSync(file.fd, 136);
        expect(fileIo.statSync(path).size).assertEqual(136);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(136);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(136);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(136);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_FINAL_FD_0020
     * @tc.name      testFinalFdTruncate0020
     * @tc.desc      File truncation from 276 to 138 bytes is observable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFinalFdTruncate0020', 0, () => {
      const path: string = `${context.filesDir}/fd_truncate_20.bin`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(276);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let j: number = 0; j < view.length; j++) {
          view[j] = j % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(276);
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
  })
}
