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
import { TestType, Size, Level } from '@ohos/hypium';

import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { fileIo } from '@kit.CoreFileKit';
import { paceTurn } from '../Shared/TestPace';
import {
  encodeText,
  pathExists,
  pathInFiles,
  readTextFile,
  removeQuietly,
  repeatPayload,
  uniqueName,
  writeTextFile
} from '../Shared/TestSupport';

interface PayloadCase {
  label: string;
  payload: string;
  expectedBytes: number;
}

const PAYLOAD_CASES: PayloadCase[] = [
  { label: 'empty', payload: '', expectedBytes: 0 },
  { label: 'single-ascii', payload: 'a', expectedBytes: 1 },
  { label: 'short-ascii', payload: 'ab', expectedBytes: 2 },
  { label: 'word', payload: 'video', expectedBytes: 5 },
  { label: 'spaces', payload: '   ', expectedBytes: 3 },
  { label: 'newline', payload: '\n', expectedBytes: 1 },
  { label: 'crlf', payload: '\r\n', expectedBytes: 2 },
  { label: 'tab', payload: '\t', expectedBytes: 1 },
  { label: 'digits', payload: '0123456789', expectedBytes: 10 },
  { label: 'json', payload: '{"fps":30,"speed":2}', expectedBytes: 20 },
  { label: 'path-like', payload: 'a/b/c.mp4', expectedBytes: 9 },
  { label: 'chinese-two', payload: '中文', expectedBytes: 6 },
  { label: 'chinese-three', payload: '音画同步', expectedBytes: 12 },
  { label: 'mixed', payload: '音画sync同步1', expectedBytes: 17 },
  { label: 'emoji', payload: '🎬', expectedBytes: 4 },
  { label: 'bmp', payload: '\u4e2d', expectedBytes: 3 },
  { label: 'combining', payload: 'e\u0301', expectedBytes: 3 },
  { label: 'accent', payload: 'café', expectedBytes: 5 },
  { label: 'cyrillic', payload: 'тест', expectedBytes: 8 },
  { label: 'arabic', payload: 'اختبار', expectedBytes: 12 },
  { label: 'line-block', payload: repeatPayload(100, 'line\n'), expectedBytes: 100 },
  { label: 'pattern-255', payload: repeatPayload(255, 'abc123'), expectedBytes: 255 },
  { label: 'pattern-1024', payload: repeatPayload(1024, 'x'), expectedBytes: 1024 },
  { label: 'pattern-4096', payload: repeatPayload(4096, 'sync'), expectedBytes: 4096 }
];

function createTarget(label: string): string {
  return pathInFiles(uniqueName(`avs_${label}`, '.txt'));
}

export default function fileContentMatrixTest() {
  describe('fileContentMatrixTest', () => {
    beforeAll(() => {
      console.info('fileContentMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('fileContentMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_FILE_CONTENT_0100
     * @tc.name      testFileContent0001
     * @tc.desc      Verify an empty payload creates an existing empty regular file
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileContent0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = createTarget('empty');
      try {
        const written: number = writeTextFile(path, '');
        expect(written).assertEqual(0);
        const stat: fileIo.Stat = fileIo.statSync(path);
        expect(stat.isFile()).assertTrue();
        expect(stat.size).assertEqual(0);
        expect(fileIo.accessSync(path)).assertTrue();
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_CONTENT_0200
     * @tc.name      testFileContent0002
     * @tc.desc      Verify a single ASCII byte is written with an exact one-byte file size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileContent0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = createTarget('single');
      try {
        expect(writeTextFile(path, 'a')).assertEqual(1);
        expect(fileIo.statSync(path).size).assertEqual(1);
        expect(readTextFile(path, 1)).assertEqual('a');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_CONTENT_0300
     * @tc.name      testFileContent0003
     * @tc.desc      Verify whitespace payloads round-trip without being trimmed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileContent0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = createTarget('spaces');
      try {
        const payload: string = '   ';
        expect(writeTextFile(path, payload)).assertEqual(3);
        expect(fileIo.statSync(path).size).assertEqual(3);
        expect(readTextFile(path, 3)).assertEqual(payload);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_CONTENT_0400
     * @tc.name      testFileContent0004
     * @tc.desc      Verify a newline payload keeps the byte count and content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileContent0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = createTarget('newline');
      try {
        const payload: string = '\n';
        expect(writeTextFile(path, payload)).assertEqual(1);
        expect(fileIo.statSync(path).size).assertEqual(1);
        expect(readTextFile(path, 1)).assertEqual('\n');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_CONTENT_0500
     * @tc.name      testFileContent0005
     * @tc.desc      Verify a CRLF payload is stored as two distinct bytes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileContent0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = createTarget('crlf');
      try {
        const payload: string = '\r\n';
        expect(writeTextFile(path, payload)).assertEqual(2);
        expect(fileIo.statSync(path).size).assertEqual(2);
        expect(readTextFile(path, 2)).assertEqual(payload);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_CONTENT_0600
     * @tc.name      testFileContent0006
     * @tc.desc      Verify a JSON payload round-trips byte for byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileContent0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = createTarget('json');
      try {
        const payload: string = '{"fps":30,"speed":2}';
        expect(writeTextFile(path, payload)).assertEqual(20);
        expect(fileIo.statSync(path).size).assertEqual(20);
        expect(readTextFile(path, 20)).assertEqual(payload);
        expect(readTextFile(path, 20).indexOf('"fps":30') >= 0).assertTrue();
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_CONTENT_0700
     * @tc.name      testFileContent0007
     * @tc.desc      Verify a two-character CJK payload occupies six UTF-8 bytes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileContent0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = createTarget('cjk');
      try {
        const payload: string = '中文';
        expect(writeTextFile(path, payload)).assertEqual(6);
        expect(fileIo.statSync(path).size).assertEqual(6);
        expect(readTextFile(path, 6)).assertEqual(payload);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_CONTENT_0800
     * @tc.name      testFileContent0008
     * @tc.desc      Verify a four-character CJK payload occupies twelve UTF-8 bytes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileContent0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = createTarget('cjk4');
      try {
        const payload: string = '音画同步';
        expect(writeTextFile(path, payload)).assertEqual(12);
        expect(fileIo.statSync(path).size).assertEqual(12);
        expect(readTextFile(path, 12)).assertEqual(payload);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_CONTENT_0900
     * @tc.name      testFileContent0009
     * @tc.desc      Verify a mixed ASCII and CJK payload keeps a byte count above its character count
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileContent0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = createTarget('mixed');
      try {
        const payload: string = '音画sync同步1';
        const bytes: number = writeTextFile(path, payload);
        expect(payload.length).assertEqual(9);
        expect(bytes).assertEqual(17);
        expect(bytes).assertLarger(payload.length);
        expect(fileIo.statSync(path).size).assertEqual(17);
        expect(readTextFile(path, 17)).assertEqual(payload);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_CONTENT_1000
     * @tc.name      testFileContent0010
     * @tc.desc      Verify an emoji payload is stored as a four-byte code point
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileContent0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = createTarget('emoji');
      try {
        const payload: string = '🎬';
        expect(writeTextFile(path, payload)).assertEqual(4);
        expect(fileIo.statSync(path).size).assertEqual(4);
        expect(readTextFile(path, 4)).assertEqual(payload);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_CONTENT_1100
     * @tc.name      testFileContent0011
     * @tc.desc      Verify a Latin accent payload keeps a byte count equal to its encoded form
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileContent0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = createTarget('accent');
      try {
        const payload: string = 'café';
        expect(writeTextFile(path, payload)).assertEqual(5);
        expect(fileIo.statSync(path).size).assertEqual(5);
        expect(readTextFile(path, 5)).assertEqual(payload);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_CONTENT_1200
     * @tc.name      testFileContent0012
     * @tc.desc      Verify a Cyrillic payload is stored with two bytes per character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileContent0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = createTarget('cyrillic');
      try {
        const payload: string = 'тест';
        expect(writeTextFile(path, payload)).assertEqual(8);
        expect(fileIo.statSync(path).size).assertEqual(8);
        expect(readTextFile(path, 8)).assertEqual(payload);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_CONTENT_1300
     * @tc.name      testFileContent0013
     * @tc.desc      Verify the stat size matches the encoded byte length for every payload sample
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileContent0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      for (let i = 0; i < PAYLOAD_CASES.length; i++) {
        const sample: PayloadCase = PAYLOAD_CASES[i];
        const path: string = createTarget(sample.label);
        try {
          const written: number = writeTextFile(path, sample.payload);
          const encoded: number = encodeText(sample.payload).byteLength;
          expect(written).assertEqual(sample.expectedBytes);
          expect(encoded).assertEqual(sample.expectedBytes);
          expect(fileIo.statSync(path).size).assertEqual(sample.expectedBytes);
        } finally {
          removeQuietly(path);
        }
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_CONTENT_1400
     * @tc.name      testFileContent0014
     * @tc.desc      Verify every payload sample round-trips through the filesystem unchanged
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileContent0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      for (let i = 0; i < PAYLOAD_CASES.length; i++) {
        const sample: PayloadCase = PAYLOAD_CASES[i];
        const path: string = createTarget(`rt_${sample.label}`);
        try {
          writeTextFile(path, sample.payload);
          const restored: string = readTextFile(path, sample.expectedBytes);
          expect(restored).assertEqual(sample.payload);
          expect(restored.length).assertEqual(sample.payload.length);
        } finally {
          removeQuietly(path);
        }
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_CONTENT_1500
     * @tc.name      testFileContent0015
     * @tc.desc      Verify overwriting with TRUNC drops the previous longer content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileContent0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = createTarget('overwrite');
      try {
        writeTextFile(path, 'first-payload');
        expect(fileIo.statSync(path).size).assertEqual(13);
        writeTextFile(path, 'second');
        expect(fileIo.statSync(path).size).assertEqual(6);
        expect(readTextFile(path, 6)).assertEqual('second');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_CONTENT_1600
     * @tc.name      testFileContent0016
     * @tc.desc      Verify appending extends the file and preserves the original prefix
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileContent0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = createTarget('append');
      try {
        writeTextFile(path, 'head');
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.APPEND);
        const appended: number = fileIo.writeSync(file.fd, encodeText('tail'));
        fileIo.closeSync(file);
        expect(appended).assertEqual(4);
        expect(fileIo.statSync(path).size).assertEqual(8);
        expect(readTextFile(path, 8)).assertEqual('headtail');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_CONTENT_1700
     * @tc.name      testFileContent0017
     * @tc.desc      Verify truncating a file to a smaller length updates the stat size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileContent0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = createTarget('truncate');
      try {
        writeTextFile(path, 'abcdefghij');
        expect(fileIo.statSync(path).size).assertEqual(10);
        fileIo.truncateSync(path, 4);
        expect(fileIo.statSync(path).size).assertEqual(4);
        expect(readTextFile(path, 4)).assertEqual('abcd');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_CONTENT_1800
     * @tc.name      testFileContent0018
     * @tc.desc      Verify truncating to zero keeps the file present with an empty body
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileContent0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = createTarget('truncate0');
      try {
        writeTextFile(path, 'payload');
        fileIo.truncateSync(path, 0);
        expect(fileIo.statSync(path).size).assertEqual(0);
        expect(fileIo.accessSync(path)).assertTrue();
        expect(readTextFile(path, 0)).assertEqual('');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_CONTENT_1900
     * @tc.name      testFileContent0019
     * @tc.desc      Verify a partial read returns exactly the requested prefix
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileContent0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = createTarget('partial');
      try {
        writeTextFile(path, '0123456789');
        expect(readTextFile(path, 3)).assertEqual('012');
        expect(readTextFile(path, 7)).assertEqual('0123456');
        expect(readTextFile(path, 10)).assertEqual('0123456789');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_CONTENT_2000
     * @tc.name      testFileContent0020
     * @tc.desc      Verify the file descriptor stays open until the caller closes it
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileContent0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = createTarget('fd');
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
        expect(file.fd).assertLarger(0);
        fileIo.writeSync(file.fd, encodeText('abc'));
        expect(fileIo.statSync(path).size).assertEqual(3);
        fileIo.closeSync(file);
        expect(readTextFile(path, 3)).assertEqual('abc');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_CONTENT_2100
     * @tc.name      testFileContent0021
     * @tc.desc      Verify writing a large repeated pattern produces the exact requested byte count
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileContent0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = createTarget('large');
      try {
        const payload: string = repeatPayload(8192, 'sync');
        expect(writeTextFile(path, payload)).assertEqual(8192);
        expect(fileIo.statSync(path).size).assertEqual(8192);
        const restored: string = readTextFile(path, 8192);
        expect(restored.length).assertEqual(8192);
        expect(restored.startsWith('sync')).assertTrue();
        expect(restored.endsWith('sync')).assertTrue();
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_CONTENT_2200
     * @tc.name      testFileContent0022
     * @tc.desc      Verify two independently written files keep separate contents
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileContent0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const firstPath: string = createTarget('pairA');
      const secondPath: string = createTarget('pairB');
      try {
        writeTextFile(firstPath, 'alpha');
        writeTextFile(secondPath, 'bravo');
        expect(readTextFile(firstPath, 5)).assertEqual('alpha');
        expect(readTextFile(secondPath, 5)).assertEqual('bravo');
        expect(fileIo.statSync(firstPath).size).assertEqual(5);
        expect(fileIo.statSync(secondPath).size).assertEqual(5);
      } finally {
        removeQuietly(firstPath);
        removeQuietly(secondPath);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_CONTENT_2300
     * @tc.name      testFileContent0023
     * @tc.desc      Verify copy preserves the source content and byte length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileContent0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = createTarget('copySrc');
      const target: string = createTarget('copyDst');
      try {
        writeTextFile(source, 'copy-payload');
        fileIo.copyFileSync(source, target);
        expect(fileIo.statSync(target).size).assertEqual(12);
        expect(readTextFile(target, 12)).assertEqual('copy-payload');
        expect(readTextFile(source, 12)).assertEqual('copy-payload');
      } finally {
        removeQuietly(source);
        removeQuietly(target);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_CONTENT_2400
     * @tc.name      testFileContent0024
     * @tc.desc      Verify rename keeps the content and removes the old path
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileContent0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const source: string = createTarget('renameSrc');
      const target: string = createTarget('renameDst');
      try {
        writeTextFile(source, 'rename-payload');
        fileIo.renameSync(source, target);
        expect(pathExists(source)).assertFalse();
        expect(pathExists(target)).assertTrue();
        expect(fileIo.statSync(target).size).assertEqual(14);
        expect(readTextFile(target, 14)).assertEqual('rename-payload');
      } finally {
        removeQuietly(source);
        removeQuietly(target);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_CONTENT_2500
     * @tc.name      testFileContent0025
     * @tc.desc      Verify unlinking removes the file so a later stat fails
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileContent0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = createTarget('unlink');
      writeTextFile(path, 'to-delete');
      fileIo.unlinkSync(path);
      expect(pathExists(path)).assertFalse();
      let statFailed: boolean = false;
      try {
        fileIo.statSync(path);
      } catch (error) {
        statFailed = true;
      }
      expect(statFailed).assertTrue();
    })

    /**
     * @tc.number    SUB_AVS_FILE_CONTENT_2600
     * @tc.name      testFileContent0026
     * @tc.desc      Verify every payload sample is independent when written back to back
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileContent0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const paths: string[] = [];
      try {
        for (let i = 0; i < PAYLOAD_CASES.length; i++) {
          const sample: PayloadCase = PAYLOAD_CASES[i];
          const path: string = createTarget(`batch_${sample.label}`);
          paths.push(path);
          writeTextFile(path, sample.payload);
        }
        expect(paths.length).assertEqual(PAYLOAD_CASES.length);
        for (let i = 0; i < PAYLOAD_CASES.length; i++) {
          const restored: string = readTextFile(paths[i], PAYLOAD_CASES[i].expectedBytes);
          expect(restored).assertEqual(PAYLOAD_CASES[i].payload);
        }
      } finally {
        for (let i = 0; i < paths.length; i++) {
          removeQuietly(paths[i]);
        }
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_CONTENT_2700
     * @tc.name      testFileContent0027
     * @tc.desc      Verify a UTF-8 payload can be read back and validated by its code point count
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileContent0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = createTarget('codepoints');
      try {
        const payload: string = '同步sync🎬';
        const bytes: number = writeTextFile(path, payload);
        const restored: string = readTextFile(path, bytes);
        expect(restored).assertEqual(payload);
        expect(restored.length).assertEqual(payload.length);
        expect(restored.charAt(0)).assertEqual('同');
        expect(restored.endsWith('🎬')).assertTrue();
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_CONTENT_2800
     * @tc.name      testFileContent0028
     * @tc.desc      Verify reading with a buffer smaller than the file returns only the buffer size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileContent0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = createTarget('smallbuf');
      try {
        writeTextFile(path, 'abcdefghijklmnop');
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const readLength: number = fileIo.readSync(file.fd, buffer);
        fileIo.closeSync(file);
        expect(readLength).assertEqual(4);
        expect(buffer.byteLength).assertEqual(4);
        expect(fileIo.statSync(path).size).assertEqual(16);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_CONTENT_2900
     * @tc.name      testFileContent0029
     * @tc.desc      Verify rewriting the same path is idempotent for identical content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileContent0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = createTarget('idempotent');
      try {
        const payload: string = repeatPayload(512, 'ab');
        for (let i = 0; i < 5; i++) {
          expect(writeTextFile(path, payload)).assertEqual(512);
          expect(fileIo.statSync(path).size).assertEqual(512);
          expect(readTextFile(path, 512)).assertEqual(payload);
        }
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_CONTENT_3000
     * @tc.name      testFileContent0030
     * @tc.desc      Verify the file size equals the sum of two separately written chunks
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileContent0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = createTarget('chunks');
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.WRITE_ONLY |
          fileIo.OpenMode.APPEND);
        const first: number = fileIo.writeSync(file.fd, encodeText('12345'));
        const second: number = fileIo.writeSync(file.fd, encodeText('67890'));
        fileIo.closeSync(file);
        expect(first).assertEqual(5);
        expect(second).assertEqual(5);
        expect(fileIo.statSync(path).size).assertEqual(first + second);
        expect(readTextFile(path, 10)).assertEqual('1234567890');
      } finally {
        removeQuietly(path);
      }
    })
  });
}
