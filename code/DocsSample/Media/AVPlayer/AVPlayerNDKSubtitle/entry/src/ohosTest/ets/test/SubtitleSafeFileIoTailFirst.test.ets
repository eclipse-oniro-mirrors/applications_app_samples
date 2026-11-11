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
import { describe, it as hypiumIt, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { fileIo } from '@kit.CoreFileKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';

const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();


const TAG: string = '[Sample_SubtitleSafeFileIoTailFirst]';
const DOMAIN: number = 0xF811;

function it(name: string, filter: number, func: () => void): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

export default function SubtitleSafeFileIoTailFirstTest(): void {
  describe('SubtitleSafeFileIoTailFirstTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0169
     * @tc.name      testSafeFileIo0169
     * @tc.desc      Write 604 bytes, truncate to 302, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_169.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(604);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 168) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(604);
        fileIo.truncateSync(file.fd, 302);
        expect(fileIo.statSync(path).size).assertEqual(302);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(302);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(302);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(302);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0170
     * @tc.name      testSafeFileIo0170
     * @tc.desc      Write 607 bytes, truncate to 303, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_170.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(607);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 169) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(607);
        fileIo.truncateSync(file.fd, 303);
        expect(fileIo.statSync(path).size).assertEqual(303);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(303);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(303);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(303);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0171
     * @tc.name      testSafeFileIo0171
     * @tc.desc      Write 610 bytes, truncate to 305, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_171.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(610);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 170) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(610);
        fileIo.truncateSync(file.fd, 305);
        expect(fileIo.statSync(path).size).assertEqual(305);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(305);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(305);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(305);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0172
     * @tc.name      testSafeFileIo0172
     * @tc.desc      Write 613 bytes, truncate to 306, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_172.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(613);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 171) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(613);
        fileIo.truncateSync(file.fd, 306);
        expect(fileIo.statSync(path).size).assertEqual(306);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(306);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(306);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(306);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0173
     * @tc.name      testSafeFileIo0173
     * @tc.desc      Write 616 bytes, truncate to 308, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_173.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(616);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 172) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(616);
        fileIo.truncateSync(file.fd, 308);
        expect(fileIo.statSync(path).size).assertEqual(308);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(308);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(308);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(308);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0174
     * @tc.name      testSafeFileIo0174
     * @tc.desc      Write 619 bytes, truncate to 309, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_174.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(619);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 173) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(619);
        fileIo.truncateSync(file.fd, 309);
        expect(fileIo.statSync(path).size).assertEqual(309);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(309);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(309);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(309);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0175
     * @tc.name      testSafeFileIo0175
     * @tc.desc      Write 622 bytes, truncate to 311, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_175.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(622);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 174) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(622);
        fileIo.truncateSync(file.fd, 311);
        expect(fileIo.statSync(path).size).assertEqual(311);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(311);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(311);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(311);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0176
     * @tc.name      testSafeFileIo0176
     * @tc.desc      Write 625 bytes, truncate to 312, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_176.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(625);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 175) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(625);
        fileIo.truncateSync(file.fd, 312);
        expect(fileIo.statSync(path).size).assertEqual(312);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(312);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(312);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(312);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0177
     * @tc.name      testSafeFileIo0177
     * @tc.desc      Write 628 bytes, truncate to 314, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_177.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(628);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 176) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(628);
        fileIo.truncateSync(file.fd, 314);
        expect(fileIo.statSync(path).size).assertEqual(314);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(314);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(314);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(314);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0178
     * @tc.name      testSafeFileIo0178
     * @tc.desc      Write 631 bytes, truncate to 315, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_178.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(631);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 177) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(631);
        fileIo.truncateSync(file.fd, 315);
        expect(fileIo.statSync(path).size).assertEqual(315);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(315);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(315);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(315);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0179
     * @tc.name      testSafeFileIo0179
     * @tc.desc      Write 634 bytes, truncate to 317, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_179.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(634);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 178) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(634);
        fileIo.truncateSync(file.fd, 317);
        expect(fileIo.statSync(path).size).assertEqual(317);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(317);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(317);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(317);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0180
     * @tc.name      testSafeFileIo0180
     * @tc.desc      Write 637 bytes, truncate to 318, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_180.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(637);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 179) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(637);
        fileIo.truncateSync(file.fd, 318);
        expect(fileIo.statSync(path).size).assertEqual(318);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(318);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(318);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(318);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0181
     * @tc.name      testSafeFileIo0181
     * @tc.desc      Write 640 bytes, truncate to 320, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_181.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(640);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 180) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(640);
        fileIo.truncateSync(file.fd, 320);
        expect(fileIo.statSync(path).size).assertEqual(320);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(320);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(320);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(320);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0182
     * @tc.name      testSafeFileIo0182
     * @tc.desc      Write 643 bytes, truncate to 321, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_182.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(643);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 181) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(643);
        fileIo.truncateSync(file.fd, 321);
        expect(fileIo.statSync(path).size).assertEqual(321);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(321);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(321);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(321);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0183
     * @tc.name      testSafeFileIo0183
     * @tc.desc      Write 646 bytes, truncate to 323, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_183.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(646);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 182) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(646);
        fileIo.truncateSync(file.fd, 323);
        expect(fileIo.statSync(path).size).assertEqual(323);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(323);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(323);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(323);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0184
     * @tc.name      testSafeFileIo0184
     * @tc.desc      Write 649 bytes, truncate to 324, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_184.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(649);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 183) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(649);
        fileIo.truncateSync(file.fd, 324);
        expect(fileIo.statSync(path).size).assertEqual(324);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(324);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(324);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(324);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0185
     * @tc.name      testSafeFileIo0185
     * @tc.desc      Write 652 bytes, truncate to 326, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_185.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(652);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 184) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(652);
        fileIo.truncateSync(file.fd, 326);
        expect(fileIo.statSync(path).size).assertEqual(326);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(326);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(326);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(326);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0186
     * @tc.name      testSafeFileIo0186
     * @tc.desc      Write 655 bytes, truncate to 327, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_186.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(655);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 185) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(655);
        fileIo.truncateSync(file.fd, 327);
        expect(fileIo.statSync(path).size).assertEqual(327);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(327);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(327);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(327);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0187
     * @tc.name      testSafeFileIo0187
     * @tc.desc      Write 658 bytes, truncate to 329, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_187.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(658);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 186) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(658);
        fileIo.truncateSync(file.fd, 329);
        expect(fileIo.statSync(path).size).assertEqual(329);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(329);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(329);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(329);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0188
     * @tc.name      testSafeFileIo0188
     * @tc.desc      Write 661 bytes, truncate to 330, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_188.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(661);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 187) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(661);
        fileIo.truncateSync(file.fd, 330);
        expect(fileIo.statSync(path).size).assertEqual(330);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(330);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(330);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(330);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0189
     * @tc.name      testSafeFileIo0189
     * @tc.desc      Write 664 bytes, truncate to 332, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_189.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(664);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 188) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(664);
        fileIo.truncateSync(file.fd, 332);
        expect(fileIo.statSync(path).size).assertEqual(332);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(332);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(332);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(332);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0190
     * @tc.name      testSafeFileIo0190
     * @tc.desc      Write 667 bytes, truncate to 333, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_190.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(667);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 189) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(667);
        fileIo.truncateSync(file.fd, 333);
        expect(fileIo.statSync(path).size).assertEqual(333);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(333);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(333);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(333);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0191
     * @tc.name      testSafeFileIo0191
     * @tc.desc      Write 670 bytes, truncate to 335, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_191.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(670);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 190) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(670);
        fileIo.truncateSync(file.fd, 335);
        expect(fileIo.statSync(path).size).assertEqual(335);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(335);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(335);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(335);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0192
     * @tc.name      testSafeFileIo0192
     * @tc.desc      Write 673 bytes, truncate to 336, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_192.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(673);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 191) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(673);
        fileIo.truncateSync(file.fd, 336);
        expect(fileIo.statSync(path).size).assertEqual(336);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(336);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(336);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(336);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0193
     * @tc.name      testSafeFileIo0193
     * @tc.desc      Write 676 bytes, truncate to 338, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_193.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(676);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 192) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(676);
        fileIo.truncateSync(file.fd, 338);
        expect(fileIo.statSync(path).size).assertEqual(338);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(338);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(338);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(338);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0194
     * @tc.name      testSafeFileIo0194
     * @tc.desc      Write 679 bytes, truncate to 339, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_194.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(679);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 193) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(679);
        fileIo.truncateSync(file.fd, 339);
        expect(fileIo.statSync(path).size).assertEqual(339);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(339);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(339);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(339);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0195
     * @tc.name      testSafeFileIo0195
     * @tc.desc      Write 682 bytes, truncate to 341, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_195.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(682);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 194) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(682);
        fileIo.truncateSync(file.fd, 341);
        expect(fileIo.statSync(path).size).assertEqual(341);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(341);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(341);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(341);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0196
     * @tc.name      testSafeFileIo0196
     * @tc.desc      Write 685 bytes, truncate to 342, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_196.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(685);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 195) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(685);
        fileIo.truncateSync(file.fd, 342);
        expect(fileIo.statSync(path).size).assertEqual(342);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(342);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(342);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(342);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0197
     * @tc.name      testSafeFileIo0197
     * @tc.desc      Write 688 bytes, truncate to 344, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_197.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(688);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 196) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(688);
        fileIo.truncateSync(file.fd, 344);
        expect(fileIo.statSync(path).size).assertEqual(344);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(344);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(344);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(344);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0198
     * @tc.name      testSafeFileIo0198
     * @tc.desc      Write 691 bytes, truncate to 345, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_198.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(691);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 197) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(691);
        fileIo.truncateSync(file.fd, 345);
        expect(fileIo.statSync(path).size).assertEqual(345);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(345);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(345);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(345);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0199
     * @tc.name      testSafeFileIo0199
     * @tc.desc      Write 694 bytes, truncate to 347, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_199.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(694);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 198) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(694);
        fileIo.truncateSync(file.fd, 347);
        expect(fileIo.statSync(path).size).assertEqual(347);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(347);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(347);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(347);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0200
     * @tc.name      testSafeFileIo0200
     * @tc.desc      Write 697 bytes, truncate to 348, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_200.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(697);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 199) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(697);
        fileIo.truncateSync(file.fd, 348);
        expect(fileIo.statSync(path).size).assertEqual(348);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(348);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(348);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(348);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0201
     * @tc.name      testSafeFileIo0201
     * @tc.desc      Write 700 bytes, truncate to 350, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_201.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(700);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 200) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(700);
        fileIo.truncateSync(file.fd, 350);
        expect(fileIo.statSync(path).size).assertEqual(350);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(350);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(350);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(350);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0202
     * @tc.name      testSafeFileIo0202
     * @tc.desc      Write 703 bytes, truncate to 351, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_202.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(703);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 201) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(703);
        fileIo.truncateSync(file.fd, 351);
        expect(fileIo.statSync(path).size).assertEqual(351);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(351);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(351);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(351);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0203
     * @tc.name      testSafeFileIo0203
     * @tc.desc      Write 706 bytes, truncate to 353, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_203.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(706);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 202) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(706);
        fileIo.truncateSync(file.fd, 353);
        expect(fileIo.statSync(path).size).assertEqual(353);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(353);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(353);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(353);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0204
     * @tc.name      testSafeFileIo0204
     * @tc.desc      Write 709 bytes, truncate to 354, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_204.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(709);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 203) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(709);
        fileIo.truncateSync(file.fd, 354);
        expect(fileIo.statSync(path).size).assertEqual(354);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(354);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(354);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(354);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0205
     * @tc.name      testSafeFileIo0205
     * @tc.desc      Write 712 bytes, truncate to 356, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_205.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(712);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 204) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(712);
        fileIo.truncateSync(file.fd, 356);
        expect(fileIo.statSync(path).size).assertEqual(356);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(356);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(356);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(356);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0206
     * @tc.name      testSafeFileIo0206
     * @tc.desc      Write 715 bytes, truncate to 357, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_206.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(715);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 205) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(715);
        fileIo.truncateSync(file.fd, 357);
        expect(fileIo.statSync(path).size).assertEqual(357);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(357);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(357);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(357);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0207
     * @tc.name      testSafeFileIo0207
     * @tc.desc      Write 718 bytes, truncate to 359, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_207.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(718);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 206) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(718);
        fileIo.truncateSync(file.fd, 359);
        expect(fileIo.statSync(path).size).assertEqual(359);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(359);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(359);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(359);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0208
     * @tc.name      testSafeFileIo0208
     * @tc.desc      Write 721 bytes, truncate to 360, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_208.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(721);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 207) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(721);
        fileIo.truncateSync(file.fd, 360);
        expect(fileIo.statSync(path).size).assertEqual(360);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(360);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(360);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(360);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0209
     * @tc.name      testSafeFileIo0209
     * @tc.desc      Write 724 bytes, truncate to 362, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_209.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(724);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 208) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(724);
        fileIo.truncateSync(file.fd, 362);
        expect(fileIo.statSync(path).size).assertEqual(362);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(362);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(362);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(362);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_IO_0210
     * @tc.name      testSafeFileIo0210
     * @tc.desc      Write 727 bytes, truncate to 363, read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeFileIo0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const path: string = `${context.filesDir}/safe_file_210.dat`;
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
        const buffer: ArrayBuffer = new ArrayBuffer(727);
        const view: Uint8Array = new Uint8Array(buffer);
        for (let k: number = 0; k < view.length; k++) {
          view[k] = (k + 209) % 256;
        }
        expect(fileIo.writeSync(file.fd, buffer)).assertEqual(727);
        fileIo.truncateSync(file.fd, 363);
        expect(fileIo.statSync(path).size).assertEqual(363);
        fileIo.closeSync(file);
        const readBuffer: ArrayBuffer = new ArrayBuffer(363);
        const readFile: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.readSync(readFile.fd, readBuffer)).assertEqual(363);
        fileIo.closeSync(readFile);
        expect(fileIo.statSync(path).size).assertEqual(363);
      } finally {
        try { fileIo.unlinkSync(path); } catch (error) {}
      }
    })
  })
}
