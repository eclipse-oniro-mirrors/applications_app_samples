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

interface ScriptCase {
  label: string;
  payload: string;
  expectedBytes: number;
}

const SCRIPT_CASES: ScriptCase[] = [
  { label: 'cjk-simplified', payload: '你好世界', expectedBytes: 12 },
  { label: 'japanese', payload: 'こんにちは', expectedBytes: 15 },
  { label: 'korean', payload: '안녕하세요', expectedBytes: 15 },
  { label: 'arabic', payload: 'مرحبا', expectedBytes: 10 },
  { label: 'hebrew', payload: 'שלום', expectedBytes: 8 },
  { label: 'cyrillic', payload: 'привет', expectedBytes: 12 },
  { label: 'greek', payload: 'γειά', expectedBytes: 8 },
  { label: 'thai', payload: 'สวัสดี', expectedBytes: 18 },
  { label: 'emoji', payload: '😀😃', expectedBytes: 8 },
  { label: 'mixed', payload: 'a中😀é', expectedBytes: 10 }
];

function targetFor(label: string): string {
  return pathInFiles(uniqueName(`avs_unicode_${label}`, '.txt'));
}


const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AudioToVideoSync_FileIo_FileUnicodeMatrix]';

function logBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

function logEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

export default function fileUnicodeMatrixTest() {
  describe('fileUnicodeMatrixTest', () => {
    beforeAll(() => {
      console.info('fileUnicodeMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('fileUnicodeMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_FILE_UNICODE_0100
     * @tc.name      testFileUnicode0001
     * @tc.desc      Verify a simplified-Chinese payload occupies three bytes per character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileUnicode0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileUnicode0001');
      const path: string = targetFor('cjk');
      try {
        expect(writeTextFile(path, '你好世界')).assertEqual(12);
        expect(fileIo.statSync(path).size).assertEqual(12);
        expect(readTextFile(path, 12)).assertEqual('你好世界');
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileUnicode0001');
    })

    /**
     * @tc.number    SUB_AVS_FILE_UNICODE_0200
     * @tc.name      testFileUnicode0002
     * @tc.desc      Verify a Japanese hiragana payload occupies three bytes per character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileUnicode0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileUnicode0002');
      const path: string = targetFor('japanese');
      try {
        expect(writeTextFile(path, 'こんにちは')).assertEqual(15);
        expect(readTextFile(path, 15)).assertEqual('こんにちは');
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileUnicode0002');
    })

    /**
     * @tc.number    SUB_AVS_FILE_UNICODE_0300
     * @tc.name      testFileUnicode0003
     * @tc.desc      Verify a Korean hangul payload occupies three bytes per character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileUnicode0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileUnicode0003');
      const path: string = targetFor('korean');
      try {
        expect(writeTextFile(path, '안녕하세요')).assertEqual(15);
        expect(readTextFile(path, 15)).assertEqual('안녕하세요');
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileUnicode0003');
    })

    /**
     * @tc.number    SUB_AVS_FILE_UNICODE_0400
     * @tc.name      testFileUnicode0004
     * @tc.desc      Verify an Arabic payload occupies two bytes per character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileUnicode0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileUnicode0004');
      const path: string = targetFor('arabic');
      try {
        expect(writeTextFile(path, 'مرحبا')).assertEqual(10);
        expect(readTextFile(path, 10)).assertEqual('مرحبا');
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileUnicode0004');
    })

    /**
     * @tc.number    SUB_AVS_FILE_UNICODE_0500
     * @tc.name      testFileUnicode0005
     * @tc.desc      Verify a Hebrew payload occupies two bytes per character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileUnicode0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileUnicode0005');
      const path: string = targetFor('hebrew');
      try {
        expect(writeTextFile(path, 'שלום')).assertEqual(8);
        expect(readTextFile(path, 8)).assertEqual('שלום');
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileUnicode0005');
    })

    /**
     * @tc.number    SUB_AVS_FILE_UNICODE_0600
     * @tc.name      testFileUnicode0006
     * @tc.desc      Verify a Cyrillic payload occupies two bytes per character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileUnicode0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileUnicode0006');
      const path: string = targetFor('cyrillic');
      try {
        expect(writeTextFile(path, 'привет')).assertEqual(12);
        expect(readTextFile(path, 12)).assertEqual('привет');
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileUnicode0006');
    })

    /**
     * @tc.number    SUB_AVS_FILE_UNICODE_0700
     * @tc.name      testFileUnicode0007
     * @tc.desc      Verify a Greek payload with an accented vowel keeps two bytes per character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileUnicode0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileUnicode0007');
      const path: string = targetFor('greek');
      try {
        expect(writeTextFile(path, 'γειά')).assertEqual(8);
        expect(readTextFile(path, 8)).assertEqual('γειά');
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileUnicode0007');
    })

    /**
     * @tc.number    SUB_AVS_FILE_UNICODE_0800
     * @tc.name      testFileUnicode0008
     * @tc.desc      Verify a Thai payload occupies three bytes per character
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileUnicode0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileUnicode0008');
      const path: string = targetFor('thai');
      try {
        expect(writeTextFile(path, 'สวัสดี')).assertEqual(18);
        expect(readTextFile(path, 18)).assertEqual('สวัสดี');
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileUnicode0008');
    })

    /**
     * @tc.number    SUB_AVS_FILE_UNICODE_0900
     * @tc.name      testFileUnicode0009
     * @tc.desc      Verify an emoji payload occupies four bytes per code point
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileUnicode0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileUnicode0009');
      const path: string = targetFor('emoji');
      try {
        expect(writeTextFile(path, '😀😃')).assertEqual(8);
        expect(readTextFile(path, 8)).assertEqual('😀😃');
        expect('😀😃'.length).assertEqual(4);
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileUnicode0009');
    })

    /**
     * @tc.number    SUB_AVS_FILE_UNICODE_1000
     * @tc.name      testFileUnicode0010
     * @tc.desc      Verify a mixed ASCII, CJK and emoji payload keeps its exact encoded byte length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileUnicode0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileUnicode0010');
      const path: string = targetFor('mixed');
      try {
        const payload: string = 'a中😀é';
        expect(writeTextFile(path, payload)).assertEqual(10);
        expect(fileIo.statSync(path).size).assertEqual(10);
        expect(readTextFile(path, 10)).assertEqual(payload);
        expect(encodeText(payload).byteLength).assertEqual(10);
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileUnicode0010');
    })

    /**
     * @tc.number    SUB_AVS_FILE_UNICODE_1100
     * @tc.name      testFileUnicode0011
     * @tc.desc      Verify every sampled script round-trips with its expected byte length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileUnicode0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileUnicode0011');
      for (let i = 0; i < SCRIPT_CASES.length; i++) {
        const sample: ScriptCase = SCRIPT_CASES[i];
        const path: string = targetFor(`matrix_${sample.label}`);
        try {
          const written: number = writeTextFile(path, sample.payload);
          expect(written).assertEqual(sample.expectedBytes);
          expect(encodeText(sample.payload).byteLength).assertEqual(sample.expectedBytes);
          expect(fileIo.statSync(path).size).assertEqual(sample.expectedBytes);
          expect(readTextFile(path, sample.expectedBytes)).assertEqual(sample.payload);
        } finally {
          removeQuietly(path);
        }
      }
    
      logEnd('testFileUnicode0011');
    })

    /**
     * @tc.number    SUB_AVS_FILE_UNICODE_1200
     * @tc.name      testFileUnicode0012
     * @tc.desc      Verify a repeated multi-script payload keeps a byte length that is a multiple of three
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileUnicode0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testFileUnicode0012');
      const path: string = targetFor('repeated');
      try {
        const payload: string = repeatPayload(60, '音画');
        const bytes: number = writeTextFile(path, payload);
        expect(bytes % 3).assertEqual(0);
        expect(bytes).assertEqual(encodeText(payload).byteLength);
        expect(readTextFile(path, bytes)).assertEqual(payload);
      } finally {
        removeQuietly(path);
      }
    
      logEnd('testFileUnicode0012');
    })
  });
}
