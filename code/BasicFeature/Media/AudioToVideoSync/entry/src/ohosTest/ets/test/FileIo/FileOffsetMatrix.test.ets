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
  decodeBuffer,
  encodeText,
  pathInFiles,
  readTextFile,
  removeQuietly,
  uniqueName,
  writeTextFile
} from '../Shared/TestSupport';

function targetFor(label: string): string {
  return pathInFiles(uniqueName(`avs_offset_${label}`, '.txt'));
}

function readFromOffset(fd: number, offset: number, length: number): string {
  fileIo.lseek(fd, offset, fileIo.WhenceType.SEEK_SET);
  const buffer: ArrayBuffer = new ArrayBuffer(length);
  const readLength: number = fileIo.readSync(fd, buffer);
  expect(readLength).assertEqual(length);
  return decodeBuffer(buffer, readLength);
}

export default function fileOffsetMatrixTest() {
  describe('fileOffsetMatrixTest', () => {
    beforeAll(() => {
      console.info('fileOffsetMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('fileOffsetMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_FILE_OFFSET_0100
     * @tc.name      testFileOffset0001
     * @tc.desc      Verify seeking to the start reports offset zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileOffset0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('start');
      writeTextFile(path, '0123456789');
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE);
        expect(fileIo.lseek(file.fd, 0, fileIo.WhenceType.SEEK_SET)).assertEqual(0);
        fileIo.closeSync(file);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_OFFSET_0200
     * @tc.name      testFileOffset0002
     * @tc.desc      Verify seeking to the end reports the exact file size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileOffset0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('end');
      writeTextFile(path, '0123456789');
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE);
        expect(fileIo.lseek(file.fd, 0, fileIo.WhenceType.SEEK_END)).assertEqual(10);
        fileIo.closeSync(file);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_OFFSET_0300
     * @tc.name      testFileOffset0003
     * @tc.desc      Verify a write advances the current offset by the written byte count
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileOffset0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('advance');
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
        expect(fileIo.lseek(file.fd, 0, fileIo.WhenceType.SEEK_END)).assertEqual(0);
        expect(fileIo.writeSync(file.fd, encodeText('abc'))).assertEqual(3);
        expect(fileIo.lseek(file.fd, 0, fileIo.WhenceType.SEEK_CUR)).assertEqual(3);
        expect(fileIo.writeSync(file.fd, encodeText('de'))).assertEqual(2);
        expect(fileIo.lseek(file.fd, 0, fileIo.WhenceType.SEEK_CUR)).assertEqual(5);
        fileIo.closeSync(file);
        expect(fileIo.statSync(path).size).assertEqual(5);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_OFFSET_0400
     * @tc.name      testFileOffset0004
     * @tc.desc      Verify seeking to a middle offset overwrites only the targeted bytes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileOffset0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('middle');
      writeTextFile(path, '0123456789');
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE);
        expect(fileIo.lseek(file.fd, 5, fileIo.WhenceType.SEEK_SET)).assertEqual(5);
        expect(fileIo.writeSync(file.fd, encodeText('XYZ'))).assertEqual(3);
        fileIo.closeSync(file);
        expect(fileIo.statSync(path).size).assertEqual(10);
        expect(readTextFile(path, 10)).assertEqual('01234XYZ89');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_OFFSET_0500
     * @tc.name      testFileOffset0005
     * @tc.desc      Verify seeking to zero overwrites the prefix without changing the tail
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileOffset0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('prefix');
      writeTextFile(path, 'abcdefghij');
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE);
        expect(fileIo.lseek(file.fd, 0, fileIo.WhenceType.SEEK_SET)).assertEqual(0);
        expect(fileIo.writeSync(file.fd, encodeText('12'))).assertEqual(2);
        fileIo.closeSync(file);
        expect(readTextFile(path, 10)).assertEqual('12cdefghij');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_OFFSET_0600
     * @tc.name      testFileOffset0006
     * @tc.desc      Verify seeking to the end then writing appends to the file
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileOffset0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('append');
      writeTextFile(path, 'head');
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE);
        expect(fileIo.lseek(file.fd, 0, fileIo.WhenceType.SEEK_END)).assertEqual(4);
        expect(fileIo.writeSync(file.fd, encodeText('tail'))).assertEqual(4);
        fileIo.closeSync(file);
        expect(fileIo.statSync(path).size).assertEqual(8);
        expect(readTextFile(path, 8)).assertEqual('headtail');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_OFFSET_0700
     * @tc.name      testFileOffset0007
     * @tc.desc      Verify reading from a middle offset returns the exact slice
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileOffset0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('slice');
      writeTextFile(path, '0123456789');
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(readFromOffset(file.fd, 3, 4)).assertEqual('3456');
        expect(readFromOffset(file.fd, 7, 3)).assertEqual('789');
        fileIo.closeSync(file);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_OFFSET_0800
     * @tc.name      testFileOffset0008
     * @tc.desc      Verify seeking a negative offset from the end returns the expected position
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileOffset0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('from_end');
      writeTextFile(path, 'abcdefghij');
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.lseek(file.fd, -3, fileIo.WhenceType.SEEK_END)).assertEqual(7);
        const buffer: ArrayBuffer = new ArrayBuffer(3);
        const readLength: number = fileIo.readSync(file.fd, buffer);
        expect(readLength).assertEqual(3);
        fileIo.closeSync(file);
        expect(readTextFile(path, 10)).assertEqual('abcdefghij');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_OFFSET_0900
     * @tc.name      testFileOffset0009
     * @tc.desc      Verify the offset does not persist across reopens
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileOffset0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('reopen');
      writeTextFile(path, 'abcdef');
      try {
        const first: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE);
        fileIo.lseek(first.fd, 4, fileIo.WhenceType.SEEK_SET);
        fileIo.closeSync(first);
        const second: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE);
        expect(fileIo.lseek(second.fd, 0, fileIo.WhenceType.SEEK_CUR)).assertEqual(0);
        fileIo.closeSync(second);
        expect(readTextFile(path, 6)).assertEqual('abcdef');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_OFFSET_1000
     * @tc.name      testFileOffset0010
     * @tc.desc      Verify repeated seeks to the same position return the same offset
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileOffset0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('repeat');
      writeTextFile(path, '0123456789');
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        for (let i = 0; i < 5; i++) {
          expect(fileIo.lseek(file.fd, 6, fileIo.WhenceType.SEEK_SET)).assertEqual(6);
        }
        fileIo.closeSync(file);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_OFFSET_1100
     * @tc.name      testFileOffset0011
     * @tc.desc      Verify a sequence of overwrites at different offsets yields the expected final content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileOffset0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('sequence');
      writeTextFile(path, 'AAAAAAAAAA');
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE);
        fileIo.lseek(file.fd, 0, fileIo.WhenceType.SEEK_SET);
        fileIo.writeSync(file.fd, encodeText('BB'));
        fileIo.lseek(file.fd, 5, fileIo.WhenceType.SEEK_SET);
        fileIo.writeSync(file.fd, encodeText('CC'));
        fileIo.lseek(file.fd, 9, fileIo.WhenceType.SEEK_SET);
        fileIo.writeSync(file.fd, encodeText('D'));
        fileIo.closeSync(file);
        expect(readTextFile(path, 10)).assertEqual('BBAAACCAAD');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_OFFSET_1200
     * @tc.name      testFileOffset0012
     * @tc.desc      Verify writing to a zero-length file starts at offset zero and grows it
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileOffset0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('empty_grow');
      try {
        writeTextFile(path, '');
        expect(fileIo.statSync(path).size).assertEqual(0);
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE);
        expect(fileIo.lseek(file.fd, 0, fileIo.WhenceType.SEEK_END)).assertEqual(0);
        expect(fileIo.writeSync(file.fd, encodeText('grow'))).assertEqual(4);
        fileIo.closeSync(file);
        expect(fileIo.statSync(path).size).assertEqual(4);
        expect(readTextFile(path, 4)).assertEqual('grow');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_OFFSET_1300
     * @tc.name      testFileOffset0013
     * @tc.desc      Verify reading at the end returns zero bytes without mutating content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileOffset0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('eof');
      writeTextFile(path, 'abcdef');
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(fileIo.lseek(file.fd, 0, fileIo.WhenceType.SEEK_END)).assertEqual(6);
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        const readLength: number = fileIo.readSync(file.fd, buffer);
        expect(readLength).assertEqual(0);
        fileIo.closeSync(file);
        expect(readTextFile(path, 6)).assertEqual('abcdef');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_OFFSET_1400
     * @tc.name      testFileOffset0014
     * @tc.desc      Verify every sampled seek position matches the requested offset and file size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileOffset0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('matrix');
      writeTextFile(path, '0123456789abcdef');
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const offsets: number[] = [0, 1, 5, 9, 15, 16];
        for (let i = 0; i < offsets.length; i++) {
          expect(fileIo.lseek(file.fd, offsets[i], fileIo.WhenceType.SEEK_SET)).assertEqual(offsets[i]);
          expect(fileIo.lseek(file.fd, 0, fileIo.WhenceType.SEEK_CUR)).assertEqual(offsets[i]);
        }
        fileIo.closeSync(file);
        expect(fileIo.statSync(path).size).assertEqual(16);
      } finally {
        removeQuietly(path);
      }
    })
  });
}
