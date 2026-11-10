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
  return pathInFiles(uniqueName(`avs_handle_${label}`, '.txt'));
}

function readAt(fd: number, offset: number, length: number): string {
  fileIo.lseek(fd, offset, fileIo.WhenceType.SEEK_SET);
  const buffer: ArrayBuffer = new ArrayBuffer(length);
  const readLength: number = fileIo.readSync(fd, buffer);
  expect(readLength).assertEqual(length);
  return decodeBuffer(buffer, readLength);
}

export default function fileHandleMatrixTest() {
  describe('fileHandleMatrixTest', () => {
    beforeAll(() => {
      console.info('fileHandleMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('fileHandleMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_FILE_HANDLE_0100
     * @tc.name      testFileHandle0001
     * @tc.desc      Verify two simultaneous opens of the same file receive distinct positive descriptors
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileHandle0001', 0, () => {
      const path: string = targetFor('distinct');
      writeTextFile(path, 'abcdef');
      try {
        const first: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const second: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        try {
          expect(first.fd).assertLarger(0);
          expect(second.fd).assertLarger(0);
          expect(first.fd === second.fd).assertFalse();
        } finally {
          fileIo.closeSync(first);
          fileIo.closeSync(second);
        }
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_HANDLE_0200
     * @tc.name      testFileHandle0002
     * @tc.desc      Verify data written through one handle is visible through a second read handle
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileHandle0002', 0, () => {
      const path: string = targetFor('visible');
      writeTextFile(path, 'initial');
      try {
        const writer: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE);
        const reader: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        try {
          fileIo.lseek(writer.fd, 0, fileIo.WhenceType.SEEK_SET);
          expect(fileIo.writeSync(writer.fd, encodeText('changed'))).assertEqual(7);
          expect(readAt(reader.fd, 0, 7)).assertEqual('changed');
        } finally {
          fileIo.closeSync(writer);
          fileIo.closeSync(reader);
        }
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_HANDLE_0300
     * @tc.name      testFileHandle0003
     * @tc.desc      Verify two read handles keep independent offsets
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileHandle0003', 0, () => {
      const path: string = targetFor('independent');
      writeTextFile(path, '0123456789');
      try {
        const first: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const second: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        try {
          expect(readAt(first.fd, 0, 3)).assertEqual('012');
          expect(readAt(second.fd, 5, 3)).assertEqual('567');
          expect(fileIo.lseek(first.fd, 0, fileIo.WhenceType.SEEK_CUR)).assertEqual(3);
          expect(fileIo.lseek(second.fd, 0, fileIo.WhenceType.SEEK_CUR)).assertEqual(8);
        } finally {
          fileIo.closeSync(first);
          fileIo.closeSync(second);
        }
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_HANDLE_0400
     * @tc.name      testFileHandle0004
     * @tc.desc      Verify closing one handle leaves the other handle readable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileHandle0004', 0, () => {
      const path: string = targetFor('close_one');
      writeTextFile(path, 'abcdefgh');
      try {
        const first: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const second: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        fileIo.closeSync(first);
        try {
          expect(readAt(second.fd, 0, 4)).assertEqual('abcd');
          expect(readAt(second.fd, 4, 4)).assertEqual('efgh');
        } finally {
          fileIo.closeSync(second);
        }
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_HANDLE_0500
     * @tc.name      testFileHandle0005
     * @tc.desc      Verify eight handles can write distinct bytes at distinct offsets
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileHandle0005', 0, () => {
      const path: string = targetFor('many');
      writeTextFile(path, '........');
      const handles: fileIo.File[] = [];
      try {
        for (let i = 0; i < 8; i++) {
          handles.push(fileIo.openSync(path, fileIo.OpenMode.READ_WRITE));
        }
        for (let i = 0; i < handles.length; i++) {
          fileIo.lseek(handles[i].fd, i, fileIo.WhenceType.SEEK_SET);
          expect(fileIo.writeSync(handles[i].fd, encodeText(`${i}`))).assertEqual(1);
        }
        for (let i = 0; i < handles.length; i++) {
          fileIo.closeSync(handles[i]);
        }
        expect(readTextFile(path, 8)).assertEqual('01234567');
      } finally {
        for (let i = 0; i < handles.length; i++) {
          try {
            fileIo.closeSync(handles[i]);
          } catch (error) {
            console.info('handle already closed');
          }
        }
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_HANDLE_0600
     * @tc.name      testFileHandle0006
     * @tc.desc      Verify a reopened handle starts reading from the beginning
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileHandle0006', 0, () => {
      const path: string = targetFor('reopen');
      writeTextFile(path, 'reopen-content');
      try {
        const first: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        expect(readAt(first.fd, 7, 7)).assertEqual('content');
        fileIo.closeSync(first);
        const second: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        try {
          expect(fileIo.lseek(second.fd, 0, fileIo.WhenceType.SEEK_CUR)).assertEqual(0);
          expect(readAt(second.fd, 0, 6)).assertEqual('reopen');
        } finally {
          fileIo.closeSync(second);
        }
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_HANDLE_0700
     * @tc.name      testFileHandle0007
     * @tc.desc      Verify a write through a second handle does not disturb the first handle offset
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileHandle0007', 0, () => {
      const path: string = targetFor('offset_isolation');
      writeTextFile(path, 'AAAAAAAAAA');
      try {
        const stable: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const writer: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE);
        try {
          expect(readAt(stable.fd, 0, 2)).assertEqual('AA');
          fileIo.lseek(writer.fd, 8, fileIo.WhenceType.SEEK_SET);
          fileIo.writeSync(writer.fd, encodeText('ZZ'));
          expect(fileIo.lseek(stable.fd, 0, fileIo.WhenceType.SEEK_CUR)).assertEqual(2);
          expect(readAt(stable.fd, 8, 2)).assertEqual('ZZ');
        } finally {
          fileIo.closeSync(stable);
          fileIo.closeSync(writer);
        }
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_HANDLE_0800
     * @tc.name      testFileHandle0008
     * @tc.desc      Verify writing through one handle then reopening reads the committed content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileHandle0008', 0, () => {
      const path: string = targetFor('commit');
      writeTextFile(path, '');
      try {
        const writer: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE);
        try {
          expect(fileIo.writeSync(writer.fd, encodeText('commit'))).assertEqual(6);
          fileIo.fsyncSync(writer.fd);
        } finally {
          fileIo.closeSync(writer);
        }
        expect(fileIo.statSync(path).size).assertEqual(6);
        expect(readTextFile(path, 6)).assertEqual('commit');
      } finally {
        removeQuietly(path);
      }
    })
  });
}
