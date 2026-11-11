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
  uniqueName,
  writeTextFile
} from '../Shared/TestSupport';
import { hilog } from '@kit.PerformanceAnalysisKit';

function targetFor(label: string): string {
  return pathInFiles(uniqueName(`avs_mode_${label}`, '.txt'));
}

function throws(action: () => void): boolean {
  try {
    action();
    return false;
  } catch (error) {
    return true;
  }
}


const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AudioToVideoSync_FileIo_FileModeMatrix]';

function logBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

function logEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

export default function fileModeMatrixTest() {
  describe('fileModeMatrixTest', () => {
    beforeAll(() => {
      console.info('fileModeMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('fileModeMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_FILE_MODE_0100
     * @tc.name      testFileMode0001
     * @tc.desc      Verify CREATE on a missing path yields an existing empty file
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileMode0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileMode0001');
      const path: string = targetFor('create');
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
        fileIo.closeSync(file);
        expect(fileIo.statSync(path).size).assertEqual(0);
        expect(fileIo.accessSync(path)).assertTrue();
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileMode0001');
    })

    /**
     * @tc.number    SUB_AVS_FILE_MODE_0200
     * @tc.name      testFileMode0002
     * @tc.desc      Verify CREATE on an existing file preserves its content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileMode0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileMode0002');
      const path: string = targetFor('create_existing');
      try {
        writeTextFile(path, 'preserved');
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
        fileIo.closeSync(file);
        expect(fileIo.statSync(path).size).assertEqual(9);
        expect(readTextFile(path, 9)).assertEqual('preserved');
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileMode0002');
    })

    /**
     * @tc.number    SUB_AVS_FILE_MODE_0300
     * @tc.name      testFileMode0003
     * @tc.desc      Verify TRUNC empties an existing file on open
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileMode0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileMode0003');
      const path: string = targetFor('trunc');
      try {
        writeTextFile(path, 'will-be-cleared');
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.TRUNC | fileIo.OpenMode.READ_WRITE);
        fileIo.closeSync(file);
        expect(fileIo.statSync(path).size).assertEqual(0);
        expect(readTextFile(path, 0)).assertEqual('');
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileMode0003');
    })

    /**
     * @tc.number    SUB_AVS_FILE_MODE_0400
     * @tc.name      testFileMode0004
     * @tc.desc      Verify TRUNC combined with CREATE creates and truncates in one call
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileMode0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileMode0004');
      const path: string = targetFor('create_trunc');
      try {
        const file: fileIo.File = fileIo.openSync(path,
          fileIo.OpenMode.CREATE | fileIo.OpenMode.TRUNC | fileIo.OpenMode.READ_WRITE);
        expect(fileIo.writeSync(file.fd, encodeText('new'))).assertEqual(3);
        fileIo.closeSync(file);
        expect(fileIo.statSync(path).size).assertEqual(3);
        expect(readTextFile(path, 3)).assertEqual('new');
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileMode0004');
    })

    /**
     * @tc.number    SUB_AVS_FILE_MODE_0500
     * @tc.name      testFileMode0005
     * @tc.desc      Verify APPEND writes after existing content without an explicit seek
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileMode0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileMode0005');
      const path: string = targetFor('append');
      try {
        writeTextFile(path, 'head');
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.APPEND);
        expect(fileIo.writeSync(file.fd, encodeText('tail'))).assertEqual(4);
        fileIo.closeSync(file);
        expect(fileIo.statSync(path).size).assertEqual(8);
        expect(readTextFile(path, 8)).assertEqual('headtail');
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileMode0005');
    })

    /**
     * @tc.number    SUB_AVS_FILE_MODE_0600
     * @tc.name      testFileMode0006
     * @tc.desc      Verify two APPEND writes stack in order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileMode0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileMode0006');
      const path: string = targetFor('append_twice');
      try {
        writeTextFile(path, 'a');
        const first: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.APPEND);
        fileIo.writeSync(first.fd, encodeText('b'));
        fileIo.closeSync(first);
        const second: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.APPEND);
        fileIo.writeSync(second.fd, encodeText('c'));
        fileIo.closeSync(second);
        expect(readTextFile(path, 3)).assertEqual('abc');
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileMode0006');
    })

    /**
     * @tc.number    SUB_AVS_FILE_MODE_0700
     * @tc.name      testFileMode0007
     * @tc.desc      Verify READ_WRITE can write and then read back after seeking
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileMode0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileMode0007');
      const path: string = targetFor('read_write');
      try {
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
        expect(fileIo.writeSync(file.fd, encodeText('rw'))).assertEqual(2);
        fileIo.lseek(file.fd, 0, fileIo.WhenceType.SEEK_SET);
        const buffer: ArrayBuffer = new ArrayBuffer(2);
        const readLength: number = fileIo.readSync(file.fd, buffer);
        expect(readLength).assertEqual(2);
        fileIo.closeSync(file);
        expect(readTextFile(path, 2)).assertEqual('rw');
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileMode0007');
    })

    /**
     * @tc.number    SUB_AVS_FILE_MODE_0800
     * @tc.name      testFileMode0008
     * @tc.desc      Verify a READ_WRITE handle can overwrite in place without changing file size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileMode0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileMode0008');
      const path: string = targetFor('in_place');
      try {
        writeTextFile(path, 'ABCDEF');
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_WRITE);
        fileIo.lseek(file.fd, 2, fileIo.WhenceType.SEEK_SET);
        expect(fileIo.writeSync(file.fd, encodeText('XY'))).assertEqual(2);
        fileIo.closeSync(file);
        expect(fileIo.statSync(path).size).assertEqual(6);
        expect(readTextFile(path, 6)).assertEqual('ABXYEF');
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileMode0008');
    })

    /**
     * @tc.number    SUB_AVS_FILE_MODE_0900
     * @tc.name      testFileMode0009
     * @tc.desc      Verify writing through a READ_ONLY handle fails and leaves content unchanged
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileMode0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileMode0009');
      const path: string = targetFor('read_only_write');
      try {
        writeTextFile(path, 'readonly');
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const failed: boolean = throws(() => {
          fileIo.writeSync(file.fd, encodeText('X'));
        });
        fileIo.closeSync(file);
        expect(failed).assertTrue();
        expect(fileIo.statSync(path).size).assertEqual(8);
        expect(readTextFile(path, 8)).assertEqual('readonly');
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileMode0009');
    })

    /**
     * @tc.number    SUB_AVS_FILE_MODE_1000
     * @tc.name      testFileMode0010
     * @tc.desc      Verify reading through a WRITE_ONLY handle fails without altering content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileMode0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileMode0010');
      const path: string = targetFor('write_only_read');
      try {
        writeTextFile(path, 'writeonly');
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.WRITE_ONLY);
        const failed: boolean = throws(() => {
          fileIo.readSync(file.fd, new ArrayBuffer(4));
        });
        fileIo.closeSync(file);
        expect(failed).assertTrue();
        expect(fileIo.statSync(path).size).assertEqual(9);
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileMode0010');
    })

    /**
     * @tc.number    SUB_AVS_FILE_MODE_1100
     * @tc.name      testFileMode0011
     * @tc.desc      Verify a WRITE_ONLY handle can still grow the file
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileMode0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileMode0011');
      const path: string = targetFor('write_only_grow');
      try {
        writeTextFile(path, 'start');
        const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.WRITE_ONLY | fileIo.OpenMode.APPEND);
        expect(fileIo.writeSync(file.fd, encodeText('-end'))).assertEqual(4);
        fileIo.closeSync(file);
        expect(fileIo.statSync(path).size).assertEqual(9);
        expect(readTextFile(path, 9)).assertEqual('start-end');
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileMode0011');
    })

    /**
     * @tc.number    SUB_AVS_FILE_MODE_1200
     * @tc.name      testFileMode0012
     * @tc.desc      Verify TRUNC and APPEND together truncate first and then append
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileMode0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileMode0012');
      const path: string = targetFor('trunc_append');
      try {
        writeTextFile(path, 'old-content');
        const file: fileIo.File = fileIo.openSync(path,
          fileIo.OpenMode.TRUNC | fileIo.OpenMode.APPEND | fileIo.OpenMode.WRITE_ONLY);
        expect(fileIo.writeSync(file.fd, encodeText('fresh'))).assertEqual(5);
        fileIo.closeSync(file);
        expect(fileIo.statSync(path).size).assertEqual(5);
        expect(readTextFile(path, 5)).assertEqual('fresh');
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileMode0012');
    })

    /**
     * @tc.number    SUB_AVS_FILE_MODE_1300
     * @tc.name      testFileMode0013
     * @tc.desc      Verify READ_ONLY handles of the same file see the same content after a rewrite
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileMode0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileMode0013');
      const path: string = targetFor('shared_read');
      try {
        writeTextFile(path, 'first');
        const first: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        const second: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
        try {
          expect(fileIo.lseek(first.fd, 0, fileIo.WhenceType.SEEK_SET)).assertEqual(0);
          expect(fileIo.lseek(second.fd, 0, fileIo.WhenceType.SEEK_SET)).assertEqual(0);
          expect(fileIo.statSync(path).size).assertEqual(5);
        } finally {
          fileIo.closeSync(first);
          fileIo.closeSync(second);
        }
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileMode0013');
    })

    /**
     * @tc.number    SUB_AVS_FILE_MODE_1400
     * @tc.name      testFileMode0014
     * @tc.desc      Verify a create-write-read-close cycle leaves the exact final size for every mode pair
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileMode0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileMode0014');
      const path: string = targetFor('cycle');
      try {
        const file: fileIo.File = fileIo.openSync(path,
          fileIo.OpenMode.CREATE | fileIo.OpenMode.TRUNC | fileIo.OpenMode.READ_WRITE);
        const payload: string = 'cycle-payload';
        expect(fileIo.writeSync(file.fd, encodeText(payload))).assertEqual(payload.length);
        fileIo.fsyncSync(file.fd);
        fileIo.closeSync(file);
        expect(fileIo.statSync(path).size).assertEqual(payload.length);
        expect(readTextFile(path, payload.length)).assertEqual(payload);
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileMode0014');
    })
  });
}
