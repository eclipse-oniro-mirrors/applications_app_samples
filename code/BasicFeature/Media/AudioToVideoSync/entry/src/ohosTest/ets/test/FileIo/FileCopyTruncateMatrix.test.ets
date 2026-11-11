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
import { hilog } from '@kit.PerformanceAnalysisKit';

function sourceFor(label: string): string {
  return pathInFiles(uniqueName(`avs_copy_src_${label}`, '.txt'));
}

function targetFor(label: string): string {
  return pathInFiles(uniqueName(`avs_copy_dst_${label}`, '.txt'));
}


const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AudioToVideoSync_FileIo_FileCopyTruncateMatrix]';

function logBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

function logEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

export default function fileCopyTruncateMatrixTest() {
  describe('fileCopyTruncateMatrixTest', () => {
    beforeAll(() => {
      console.info('fileCopyTruncateMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('fileCopyTruncateMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_FILE_COPY_0100
     * @tc.name      testFileCopy0001
     * @tc.desc      Verify copying a one-byte file preserves the exact content and size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileCopy0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileCopy0001');
      const source: string = sourceFor('one');
      const target: string = targetFor('one');
      try {
        writeTextFile(source, 'a');
        fileIo.copyFileSync(source, target);
        expect(fileIo.statSync(target).size).assertEqual(1);
        expect(readTextFile(target, 1)).assertEqual('a');
      } finally {
        removeQuietly(source);
        removeQuietly(target);
      }
    
      logEnd('testFileCopy0001');
    })

    /**
     * @tc.number    SUB_AVS_FILE_COPY_0200
     * @tc.name      testFileCopy0002
     * @tc.desc      Verify copying a sixty-four-byte file preserves the exact content and size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileCopy0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileCopy0002');
      const source: string = sourceFor('64');
      const target: string = targetFor('64');
      const payload: string = repeatPayload(64, 'copy');
      try {
        writeTextFile(source, payload);
        fileIo.copyFileSync(source, target);
        expect(fileIo.statSync(target).size).assertEqual(64);
        expect(readTextFile(target, 64)).assertEqual(payload);
      } finally {
        removeQuietly(source);
        removeQuietly(target);
      }
    
      logEnd('testFileCopy0002');
    })

    /**
     * @tc.number    SUB_AVS_FILE_COPY_0300
     * @tc.name      testFileCopy0003
     * @tc.desc      Verify copying a one-kilobyte file preserves the exact content and size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileCopy0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileCopy0003');
      const source: string = sourceFor('1024');
      const target: string = targetFor('1024');
      const payload: string = repeatPayload(1024, 'abcdef');
      try {
        writeTextFile(source, payload);
        fileIo.copyFileSync(source, target);
        expect(fileIo.statSync(target).size).assertEqual(1024);
        expect(readTextFile(target, 1024)).assertEqual(payload);
      } finally {
        removeQuietly(source);
        removeQuietly(target);
      }
    
      logEnd('testFileCopy0003');
    })

    /**
     * @tc.number    SUB_AVS_FILE_COPY_0400
     * @tc.name      testFileCopy0004
     * @tc.desc      Verify copying a four-kilobyte file preserves the exact content and size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileCopy0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileCopy0004');
      const source: string = sourceFor('4096');
      const target: string = targetFor('4096');
      const payload: string = repeatPayload(4096, '0123456789');
      try {
        writeTextFile(source, payload);
        fileIo.copyFileSync(source, target);
        expect(fileIo.statSync(target).size).assertEqual(4096);
        expect(readTextFile(target, 4096)).assertEqual(payload);
      } finally {
        removeQuietly(source);
        removeQuietly(target);
      }
    
      logEnd('testFileCopy0004');
    })

    /**
     * @tc.number    SUB_AVS_FILE_COPY_0500
     * @tc.name      testFileCopy0005
     * @tc.desc      Verify copying does not modify the source file content
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileCopy0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileCopy0005');
      const source: string = sourceFor('immutable');
      const target: string = targetFor('immutable');
      try {
        writeTextFile(source, 'source-content');
        fileIo.copyFileSync(source, target);
        expect(readTextFile(source, 14)).assertEqual('source-content');
        expect(fileIo.statSync(source).size).assertEqual(14);
        expect(readTextFile(target, 14)).assertEqual('source-content');
      } finally {
        removeQuietly(source);
        removeQuietly(target);
      }
    
      logEnd('testFileCopy0005');
    })

    /**
     * @tc.number    SUB_AVS_FILE_COPY_0600
     * @tc.name      testFileCopy0006
     * @tc.desc      Verify copying over an existing target replaces its content with the source
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileCopy0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileCopy0006');
      const source: string = sourceFor('overwrite');
      const target: string = targetFor('overwrite');
      try {
        writeTextFile(source, 'new');
        writeTextFile(target, 'very-old-target');
        fileIo.copyFileSync(source, target);
        expect(fileIo.statSync(target).size).assertEqual(3);
        expect(readTextFile(target, 3)).assertEqual('new');
        expect(readTextFile(source, 3)).assertEqual('new');
      } finally {
        removeQuietly(source);
        removeQuietly(target);
      }
    
      logEnd('testFileCopy0006');
    })

    /**
     * @tc.number    SUB_AVS_FILE_COPY_0700
     * @tc.name      testFileCopy0007
     * @tc.desc      Verify modifying the copy does not mutate the source
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileCopy0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileCopy0007');
      const source: string = sourceFor('divergence');
      const target: string = targetFor('divergence');
      try {
        writeTextFile(source, 'original');
        fileIo.copyFileSync(source, target);
        writeTextFile(target, 'modified');
        expect(readTextFile(source, 8)).assertEqual('original');
        expect(readTextFile(target, 8)).assertEqual('modified');
        expect(fileIo.statSync(source).size).assertEqual(8);
        expect(fileIo.statSync(target).size).assertEqual(8);
      } finally {
        removeQuietly(source);
        removeQuietly(target);
      }
    
      logEnd('testFileCopy0007');
    })

    /**
     * @tc.number    SUB_AVS_FILE_COPY_0800
     * @tc.name      testFileCopy0008
     * @tc.desc      Verify truncating the copy does not mutate the source
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileCopy0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileCopy0008');
      const source: string = sourceFor('truncate_copy');
      const target: string = targetFor('truncate_copy');
      try {
        writeTextFile(source, 'abcdefghij');
        fileIo.copyFileSync(source, target);
        fileIo.truncateSync(target, 4);
        expect(fileIo.statSync(source).size).assertEqual(10);
        expect(readTextFile(source, 10)).assertEqual('abcdefghij');
        expect(fileIo.statSync(target).size).assertEqual(4);
        expect(readTextFile(target, 4)).assertEqual('abcd');
      } finally {
        removeQuietly(source);
        removeQuietly(target);
      }
    
      logEnd('testFileCopy0008');
    })

    /**
     * @tc.number    SUB_AVS_FILE_COPY_0900
     * @tc.name      testFileCopy0009
     * @tc.desc      Verify truncating to zero keeps the file present with an empty body
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileCopy0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileCopy0009');
      const path: string = targetFor('zero');
      try {
        writeTextFile(path, 'truncate-me');
        fileIo.truncateSync(path, 0);
        expect(fileIo.statSync(path).size).assertEqual(0);
        expect(fileIo.accessSync(path)).assertTrue();
        expect(readTextFile(path, 0)).assertEqual('');
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileCopy0009');
    })

    /**
     * @tc.number    SUB_AVS_FILE_COPY_1000
     * @tc.name      testFileCopy0010
     * @tc.desc      Verify truncating to the current size leaves the content unchanged
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileCopy0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileCopy0010');
      const path: string = targetFor('same_size');
      try {
        writeTextFile(path, 'same-size');
        fileIo.truncateSync(path, 9);
        expect(fileIo.statSync(path).size).assertEqual(9);
        expect(readTextFile(path, 9)).assertEqual('same-size');
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileCopy0010');
    })

    /**
     * @tc.number    SUB_AVS_FILE_COPY_1100
     * @tc.name      testFileCopy0011
     * @tc.desc      Verify truncating to half the size keeps exactly the leading half
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileCopy0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileCopy0011');
      const path: string = targetFor('half');
      try {
        writeTextFile(path, '0123456789');
        fileIo.truncateSync(path, 5);
        expect(fileIo.statSync(path).size).assertEqual(5);
        expect(readTextFile(path, 5)).assertEqual('01234');
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileCopy0011');
    })

    /**
     * @tc.number    SUB_AVS_FILE_COPY_1200
     * @tc.name      testFileCopy0012
     * @tc.desc      Verify a sequence of decreasing truncations keeps each requested size
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileCopy0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileCopy0012');
      const path: string = targetFor('decreasing');
      try {
        writeTextFile(path, repeatPayload(1024, 'z'));
        const sizes: number[] = [1024, 512, 256, 128, 64, 32, 16, 8, 4, 2, 1, 0];
        for (let i = 0; i < sizes.length; i++) {
          fileIo.truncateSync(path, sizes[i]);
          expect(fileIo.statSync(path).size).assertEqual(sizes[i]);
        }
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileCopy0012');
    })

    /**
     * @tc.number    SUB_AVS_FILE_COPY_1300
     * @tc.name      testFileCopy0013
     * @tc.desc      Verify copying a UTF-8 payload preserves its exact byte length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileCopy0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileCopy0013');
      const source: string = sourceFor('utf8');
      const target: string = targetFor('utf8');
      const payload: string = repeatPayload(30, '音画sync');
      const bytes: number = encodeText(payload).byteLength;
      try {
        writeTextFile(source, payload);
        fileIo.copyFileSync(source, target);
        expect(fileIo.statSync(source).size).assertEqual(bytes);
        expect(fileIo.statSync(target).size).assertEqual(bytes);
        expect(readTextFile(target, bytes)).assertEqual(payload);
      } finally {
        removeQuietly(source);
        removeQuietly(target);
      }
    
      logEnd('testFileCopy0013');
    })

    /**
     * @tc.number    SUB_AVS_FILE_COPY_1400
     * @tc.name      testFileCopy0014
     * @tc.desc      Verify copy then truncate then rewrite leaves both paths independent
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileCopy0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileCopy0014');
      const source: string = sourceFor('pipeline');
      const target: string = targetFor('pipeline');
      try {
        writeTextFile(source, 'pipeline-source');
        fileIo.copyFileSync(source, target);
        fileIo.truncateSync(target, 8);
        expect(readTextFile(target, 8)).assertEqual('pipeline');
        writeTextFile(target, 'rewritten');
        expect(readTextFile(target, 9)).assertEqual('rewritten');
        expect(readTextFile(source, 15)).assertEqual('pipeline-source');
      } finally {
        removeQuietly(source);
        removeQuietly(target);
      }
    
      logEnd('testFileCopy0014');
    })

    /**
     * @tc.number    SUB_AVS_FILE_COPY_1500
     * @tc.name      testFileCopy0015
     * @tc.desc      Verify copying a boundary-sized file and truncating the copy to a sub-boundary
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileCopy0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileCopy0015');
      const source: string = sourceFor('boundary');
      const target: string = targetFor('boundary');
      try {
        writeTextFile(source, repeatPayload(8192, 'x'));
        fileIo.copyFileSync(source, target);
        expect(fileIo.statSync(target).size).assertEqual(8192);
        fileIo.truncateSync(target, 4096);
        expect(fileIo.statSync(target).size).assertEqual(4096);
        expect(readTextFile(target, 4096).length).assertEqual(4096);
        expect(fileIo.statSync(source).size).assertEqual(8192);
      } finally {
        removeQuietly(source);
        removeQuietly(target);
      }
    
      logEnd('testFileCopy0015');
    })

    /**
     * @tc.number    SUB_AVS_FILE_COPY_1600
     * @tc.name      testFileCopy0016
     * @tc.desc      Verify repeated truncate to the same size is idempotent
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileCopy0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileCopy0016');
      const path: string = targetFor('idempotent');
      try {
        writeTextFile(path, repeatPayload(100, 'idem'));
        for (let i = 0; i < 5; i++) {
          fileIo.truncateSync(path, 50);
          expect(fileIo.statSync(path).size).assertEqual(50);
          expect(readTextFile(path, 50).length).assertEqual(50);
        }
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileCopy0016');
    })
  });
}
