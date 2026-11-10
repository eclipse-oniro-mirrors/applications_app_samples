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
  pathInFiles,
  readTextFile,
  removeQuietly,
  repeatPayload,
  uniqueName,
  writeTextFile
} from '../Shared/TestSupport';

const BOUNDARY_SIZES: number[] = [0, 1, 2, 3, 4, 7, 8, 15, 16, 31, 32, 63, 64, 127, 128, 255, 256,
  511, 512, 1023, 1024, 2047, 2048, 4095, 4096, 8191, 8192];

function targetFor(label: string): string {
  return pathInFiles(uniqueName(`avs_size_${label}`, '.txt'));
}

function fillPayload(size: number): string {
  return repeatPayload(size, 'abc123');
}

export default function fileSizeBoundaryMatrixTest() {
  describe('fileSizeBoundaryMatrixTest', () => {
    beforeAll(() => {
      console.info('fileSizeBoundaryMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('fileSizeBoundaryMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_FILE_SIZE_0100
     * @tc.name      testFileSize0001
     * @tc.desc      Verify a zero-byte file is created with size zero and readable as an empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSize0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('0');
      try {
        expect(writeTextFile(path, '')).assertEqual(0);
        const stat: fileIo.Stat = fileIo.statSync(path);
        expect(stat.size).assertEqual(0);
        expect(stat.isFile()).assertTrue();
        expect(readTextFile(path, 0)).assertEqual('');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_SIZE_0200
     * @tc.name      testFileSize0002
     * @tc.desc      Verify a one-byte file keeps exactly one byte and the same character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSize0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('1');
      try {
        expect(writeTextFile(path, 'a')).assertEqual(1);
        expect(fileIo.statSync(path).size).assertEqual(1);
        expect(readTextFile(path, 1)).assertEqual('a');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_SIZE_0300
     * @tc.name      testFileSize0003
     * @tc.desc      Verify a two-byte file preserves both characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSize0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('2');
      try {
        expect(writeTextFile(path, 'ab')).assertEqual(2);
        expect(fileIo.statSync(path).size).assertEqual(2);
        expect(readTextFile(path, 2)).assertEqual('ab');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_SIZE_0400
     * @tc.name      testFileSize0004
     * @tc.desc      Verify the 3-byte and 4-byte boundaries round-trip without truncation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSize0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('3_4');
      try {
        expect(writeTextFile(path, 'abc')).assertEqual(3);
        expect(readTextFile(path, 3)).assertEqual('abc');
        expect(writeTextFile(path, 'abcd')).assertEqual(4);
        expect(readTextFile(path, 4)).assertEqual('abcd');
        expect(fileIo.statSync(path).size).assertEqual(4);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_SIZE_0500
     * @tc.name      testFileSize0005
     * @tc.desc      Verify the 7-byte and 8-byte boundaries keep exact lengths
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSize0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('7_8');
      try {
        expect(writeTextFile(path, fillPayload(7))).assertEqual(7);
        expect(readTextFile(path, 7).length).assertEqual(7);
        expect(writeTextFile(path, fillPayload(8))).assertEqual(8);
        expect(readTextFile(path, 8)).assertEqual(fillPayload(8));
        expect(fileIo.statSync(path).size).assertEqual(8);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_SIZE_0600
     * @tc.name      testFileSize0006
     * @tc.desc      Verify the 15-byte and 16-byte boundaries keep exact lengths
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSize0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('15_16');
      try {
        expect(writeTextFile(path, fillPayload(15))).assertEqual(15);
        expect(fileIo.statSync(path).size).assertEqual(15);
        expect(writeTextFile(path, fillPayload(16))).assertEqual(16);
        expect(fileIo.statSync(path).size).assertEqual(16);
        expect(readTextFile(path, 16).length).assertEqual(16);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_SIZE_0700
     * @tc.name      testFileSize0007
     * @tc.desc      Verify the 31-byte and 32-byte boundaries keep exact lengths
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSize0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('31_32');
      try {
        expect(writeTextFile(path, fillPayload(31))).assertEqual(31);
        expect(readTextFile(path, 31)).assertEqual(fillPayload(31));
        expect(writeTextFile(path, fillPayload(32))).assertEqual(32);
        expect(readTextFile(path, 32)).assertEqual(fillPayload(32));
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_SIZE_0800
     * @tc.name      testFileSize0008
     * @tc.desc      Verify the 63-byte and 64-byte boundaries keep exact lengths
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSize0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('63_64');
      try {
        expect(writeTextFile(path, fillPayload(63))).assertEqual(63);
        expect(fileIo.statSync(path).size).assertEqual(63);
        expect(writeTextFile(path, fillPayload(64))).assertEqual(64);
        expect(fileIo.statSync(path).size).assertEqual(64);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_SIZE_0900
     * @tc.name      testFileSize0009
     * @tc.desc      Verify the 127-byte and 128-byte boundaries keep exact lengths
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSize0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('127_128');
      try {
        expect(writeTextFile(path, fillPayload(127))).assertEqual(127);
        expect(readTextFile(path, 127).length).assertEqual(127);
        expect(writeTextFile(path, fillPayload(128))).assertEqual(128);
        expect(readTextFile(path, 128).length).assertEqual(128);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_SIZE_1000
     * @tc.name      testFileSize0010
     * @tc.desc      Verify the 255-byte and 256-byte boundaries keep exact lengths
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSize0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('255_256');
      try {
        expect(writeTextFile(path, fillPayload(255))).assertEqual(255);
        expect(fileIo.statSync(path).size).assertEqual(255);
        expect(writeTextFile(path, fillPayload(256))).assertEqual(256);
        expect(fileIo.statSync(path).size).assertEqual(256);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_SIZE_1100
     * @tc.name      testFileSize0011
     * @tc.desc      Verify the 511-byte and 512-byte boundaries keep exact lengths
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSize0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('511_512');
      try {
        expect(writeTextFile(path, fillPayload(511))).assertEqual(511);
        expect(readTextFile(path, 511)).assertEqual(fillPayload(511));
        expect(writeTextFile(path, fillPayload(512))).assertEqual(512);
        expect(readTextFile(path, 512)).assertEqual(fillPayload(512));
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_SIZE_1200
     * @tc.name      testFileSize0012
     * @tc.desc      Verify the 1023-byte and 1024-byte boundaries keep exact lengths
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSize0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('1023_1024');
      try {
        expect(writeTextFile(path, fillPayload(1023))).assertEqual(1023);
        expect(fileIo.statSync(path).size).assertEqual(1023);
        expect(writeTextFile(path, fillPayload(1024))).assertEqual(1024);
        expect(fileIo.statSync(path).size).assertEqual(1024);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_SIZE_1300
     * @tc.name      testFileSize0013
     * @tc.desc      Verify the 2047-byte and 2048-byte boundaries keep exact lengths
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSize0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('2047_2048');
      try {
        expect(writeTextFile(path, fillPayload(2047))).assertEqual(2047);
        expect(readTextFile(path, 2047).length).assertEqual(2047);
        expect(writeTextFile(path, fillPayload(2048))).assertEqual(2048);
        expect(readTextFile(path, 2048).length).assertEqual(2048);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_SIZE_1400
     * @tc.name      testFileSize0014
     * @tc.desc      Verify the 4095-byte and 4096-byte boundaries keep exact lengths
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSize0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('4095_4096');
      try {
        expect(writeTextFile(path, fillPayload(4095))).assertEqual(4095);
        expect(fileIo.statSync(path).size).assertEqual(4095);
        expect(writeTextFile(path, fillPayload(4096))).assertEqual(4096);
        expect(fileIo.statSync(path).size).assertEqual(4096);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_SIZE_1500
     * @tc.name      testFileSize0015
     * @tc.desc      Verify the 8191-byte and 8192-byte boundaries keep exact lengths
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSize0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('8191_8192');
      try {
        expect(writeTextFile(path, fillPayload(8191))).assertEqual(8191);
        expect(readTextFile(path, 8191).length).assertEqual(8191);
        expect(writeTextFile(path, fillPayload(8192))).assertEqual(8192);
        expect(readTextFile(path, 8192).length).assertEqual(8192);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_SIZE_1600
     * @tc.name      testFileSize0016
     * @tc.desc      Verify every sampled boundary size reports the same byte count from write, stat and read
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSize0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      for (let i = 0; i < BOUNDARY_SIZES.length; i++) {
        const size: number = BOUNDARY_SIZES[i];
        const path: string = targetFor(`matrix_${size}`);
        try {
          const payload: string = fillPayload(size);
          const written: number = writeTextFile(path, payload);
          const statSize: number = fileIo.statSync(path).size;
          const readLength: number = readTextFile(path, size).length;
          expect(written).assertEqual(size);
          expect(statSize).assertEqual(size);
          expect(readLength).assertEqual(size);
          expect(encodeText(payload).byteLength).assertEqual(size);
        } finally {
          removeQuietly(path);
        }
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_SIZE_1700
     * @tc.name      testFileSize0017
     * @tc.desc      Verify truncation to every sampled boundary leaves the exact requested size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSize0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('truncate_matrix');
      try {
        writeTextFile(path, fillPayload(8192));
        for (let i = 0; i < BOUNDARY_SIZES.length; i++) {
          const size: number = BOUNDARY_SIZES[i];
          writeTextFile(path, fillPayload(8192));
          fileIo.truncateSync(path, size);
          expect(fileIo.statSync(path).size).assertEqual(size);
          if (size > 0) {
            expect(readTextFile(path, size).length).assertEqual(size);
          }
        }
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_SIZE_1800
     * @tc.name      testFileSize0018
     * @tc.desc      Verify appending two boundary-sized chunks yields their exact sum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSize0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('append_sum');
      try {
        const first: string = fillPayload(256);
        const second: string = fillPayload(512);
        writeTextFile(path, first);
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.APPEND);
        const appended: number = fileIo.writeSync(file.fd, encodeText(second));
        fileIo.closeSync(file);
        expect(appended).assertEqual(512);
        expect(fileIo.statSync(path).size).assertEqual(768);
        expect(readTextFile(path, 768)).assertEqual(first + second);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_SIZE_1900
     * @tc.name      testFileSize0019
     * @tc.desc      Verify a partial read of a large file returns only the requested prefix length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSize0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('partial_large');
      try {
        writeTextFile(path, fillPayload(4096));
        const prefixes: number[] = [1, 7, 63, 255, 1023, 2047];
        for (let i = 0; i < prefixes.length; i++) {
          expect(readTextFile(path, prefixes[i]).length).assertEqual(prefixes[i]);
        }
        expect(fileIo.statSync(path).size).assertEqual(4096);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_SIZE_2000
     * @tc.name      testFileSize0020
     * @tc.desc      Verify overwriting a large file with a smaller payload shrinks the stat size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSize0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('shrink');
      try {
        writeTextFile(path, fillPayload(4096));
        expect(fileIo.statSync(path).size).assertEqual(4096);
        writeTextFile(path, fillPayload(64));
        expect(fileIo.statSync(path).size).assertEqual(64);
        expect(readTextFile(path, 64)).assertEqual(fillPayload(64));
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_SIZE_2100
     * @tc.name      testFileSize0021
     * @tc.desc      Verify overwriting a small file with a larger payload grows the stat size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSize0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('grow');
      try {
        writeTextFile(path, fillPayload(64));
        expect(fileIo.statSync(path).size).assertEqual(64);
        writeTextFile(path, fillPayload(4096));
        expect(fileIo.statSync(path).size).assertEqual(4096);
        expect(readTextFile(path, 4096).length).assertEqual(4096);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_SIZE_2200
     * @tc.name      testFileSize0022
     * @tc.desc      Verify the first and last bytes of a repeated payload are the expected sentinels
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSize0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('sentinels');
      try {
        const payload: string = repeatPayload(1000, 'XYZ');
        writeTextFile(path, payload);
        const restored: string = readTextFile(path, 1000);
        expect(restored.charAt(0)).assertEqual('X');
        expect(restored.charAt(999)).assertEqual(payload.charAt(999));
        expect(restored.indexOf('XYZ')).assertEqual(0);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_SIZE_2300
     * @tc.name      testFileSize0023
     * @tc.desc      Verify a UTF-8 CJK payload's byte boundary does not split a code point on read
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSize0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('cjk_boundary');
      try {
        const payload: string = repeatPayload(100, '音画');
        const bytes: number = writeTextFile(path, payload);
        expect(bytes).assertEqual(encodeText(payload).byteLength);
        expect(bytes % 3).assertEqual(0);
        expect(readTextFile(path, bytes)).assertEqual(payload);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_SIZE_2400
     * @tc.name      testFileSize0024
     * @tc.desc      Verify the reported size is identical across repeated stat calls for a middle boundary
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileSize0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = targetFor('stable_stat');
      try {
        writeTextFile(path, fillPayload(1024));
        for (let i = 0; i < 50; i++) {
          expect(fileIo.statSync(path).size).assertEqual(1024);
        }
      } finally {
        removeQuietly(path);
      }
    })
  });
}
