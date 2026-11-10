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
  appContext,
  pathExists,
  pathInFiles,
  readTextFile,
  removeQuietly,
  repeatPayload,
  uniqueName,
  writeTextFile
} from '../Shared/TestSupport';

interface NameCase {
  label: string;
  suffix: string;
  payload: string;
}

const NAME_CASES: NameCase[] = [
  { label: 'plain', suffix: '_plain.txt', payload: 'plain' },
  { label: 'digits', suffix: '_123456.txt', payload: 'digits' },
  { label: 'underscores', suffix: '_a_b_c.txt', payload: 'underscores' },
  { label: 'dashes', suffix: '_a-b-c.txt', payload: 'dashes' },
  { label: 'dots', suffix: '_a.b.c.txt', payload: 'dots' },
  { label: 'spaces', suffix: '_with space.txt', payload: 'spaces' },
  { label: 'mixedcase', suffix: '_MixedCase.TXT', payload: 'mixedcase' },
  { label: 'leading-dot', suffix: '_.hidden', payload: 'hidden' },
  { label: 'double-ext', suffix: '_clip.mp4.txt', payload: 'double' },
  { label: 'brackets', suffix: '_[bracket].txt', payload: 'brackets' },
  { label: 'plus', suffix: '_a+b.txt', payload: 'plus' },
  { label: 'hash', suffix: '_a#b.txt', payload: 'hash' }
];

function namedTarget(label: string, suffix: string): string {
  return pathInFiles(uniqueName(`avs_name_${label}`, suffix));
}

export default function fileNameMatrixTest() {
  describe('fileNameMatrixTest', () => {
    beforeAll(() => {
      console.info('fileNameMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('fileNameMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_FILE_NAME_0100
     * @tc.name      testFileName0001
     * @tc.desc      Verify a plain name with a single extension round-trips
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = namedTarget('plain', '_plain.txt');
      try {
        expect(writeTextFile(path, 'plain')).assertEqual(5);
        expect(readTextFile(path, 5)).assertEqual('plain');
        expect(pathExists(path)).assertTrue();
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_NAME_0200
     * @tc.name      testFileName0002
     * @tc.desc      Verify a name composed only of digits round-trips
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = namedTarget('digits', '_123456.txt');
      try {
        expect(writeTextFile(path, 'digits')).assertEqual(6);
        expect(readTextFile(path, 6)).assertEqual('digits');
        expect(pathExists(path)).assertTrue();
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_NAME_0300
     * @tc.name      testFileName0003
     * @tc.desc      Verify a name with multiple underscores round-trips
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileName0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = namedTarget('underscores', '_a_b_c.txt');
      try {
        expect(writeTextFile(path, 'underscores')).assertEqual(11);
        expect(readTextFile(path, 11)).assertEqual('underscores');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_NAME_0400
     * @tc.name      testFileName0004
     * @tc.desc      Verify a name with dashes round-trips
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileName0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = namedTarget('dashes', '_a-b-c.txt');
      try {
        expect(writeTextFile(path, 'dashes')).assertEqual(6);
        expect(readTextFile(path, 6)).assertEqual('dashes');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_NAME_0500
     * @tc.name      testFileName0005
     * @tc.desc      Verify a name with a dotted stem keeps the full string addressable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileName0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = namedTarget('dots', '_a.b.c.txt');
      try {
        writeTextFile(path, 'dots');
        expect(readTextFile(path, 4)).assertEqual('dots');
        expect(path.indexOf('_a.b.c.txt') >= 0).assertTrue();
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_NAME_0600
     * @tc.name      testFileName0006
     * @tc.desc      Verify a name containing a space round-trips
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileName0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = namedTarget('spaces', '_with space.txt');
      try {
        writeTextFile(path, 'spaces');
        expect(readTextFile(path, 6)).assertEqual('spaces');
        expect(path.indexOf(' ')).assertLarger(0);
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_NAME_0700
     * @tc.name      testFileName0007
     * @tc.desc      Verify a mixed-case name with an upper-case extension round-trips
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileName0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = namedTarget('mixedcase', '_MixedCase.TXT');
      try {
        writeTextFile(path, 'mixedcase');
        expect(readTextFile(path, 9)).assertEqual('mixedcase');
        expect(path.endsWith('.TXT')).assertTrue();
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_NAME_0800
     * @tc.name      testFileName0008
     * @tc.desc      Verify a leading-dot hidden name round-trips
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileName0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = namedTarget('hidden', '_.hidden');
      try {
        writeTextFile(path, 'hidden');
        expect(readTextFile(path, 6)).assertEqual('hidden');
        expect(pathExists(path)).assertTrue();
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_NAME_0900
     * @tc.name      testFileName0009
     * @tc.desc      Verify a double-extension name round-trips
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileName0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = namedTarget('double', '_clip.mp4.txt');
      try {
        writeTextFile(path, 'double');
        expect(readTextFile(path, 6)).assertEqual('double');
        expect(path.endsWith('.mp4.txt')).assertTrue();
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_NAME_1000
     * @tc.name      testFileName0010
     * @tc.desc      Verify a name with bracket characters round-trips
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileName0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = namedTarget('brackets', '_[bracket].txt');
      try {
        writeTextFile(path, 'brackets');
        expect(readTextFile(path, 8)).assertEqual('brackets');
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_NAME_1100
     * @tc.name      testFileName0011
     * @tc.desc      Verify a name with a plus sign round-trips
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileName0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = namedTarget('plus', '_a+b.txt');
      try {
        writeTextFile(path, 'plus');
        expect(readTextFile(path, 4)).assertEqual('plus');
        expect(path.indexOf('+') >= 0).assertTrue();
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_NAME_1200
     * @tc.name      testFileName0012
     * @tc.desc      Verify a name with a hash sign round-trips
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileName0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const path: string = namedTarget('hash', '_a#b.txt');
      try {
        writeTextFile(path, 'hash');
        expect(readTextFile(path, 4)).assertEqual('hash');
        expect(path.indexOf('#') >= 0).assertTrue();
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_NAME_1300
     * @tc.name      testFileName0013
     * @tc.desc      Verify every sampled name can be created, read back and removed independently
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileName0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      for (let i = 0; i < NAME_CASES.length; i++) {
        const sample: NameCase = NAME_CASES[i];
        const path: string = namedTarget(sample.label, sample.suffix);
        try {
          const written: number = writeTextFile(path, sample.payload);
          expect(written).assertEqual(sample.payload.length);
          expect(readTextFile(path, written)).assertEqual(sample.payload);
          expect(fileIo.statSync(path).size).assertEqual(sample.payload.length);
        } finally {
          removeQuietly(path);
        }
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_NAME_1400
     * @tc.name      testFileName0014
     * @tc.desc      Verify a long but legal name below the platform limit round-trips
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileName0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const longStem: string = repeatPayload(120, 'n');
      const path: string = pathInFiles(`${longStem}.txt`);
      try {
        writeTextFile(path, 'long-name');
        expect(fileIo.statSync(path).size).assertEqual(9);
        expect(readTextFile(path, 9)).assertEqual('long-name');
        expect(pathExists(path)).assertTrue();
      } finally {
        removeQuietly(path);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_NAME_1500
     * @tc.name      testFileName0015
     * @tc.desc      Verify names differ only by case are treated per the platform case rule
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileName0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const lowerName: string = `${uniqueName('avs_case_lower', '')}_lower.txt`;
      const upperName: string = `${uniqueName('avs_case_upper', '')}_UPPER.txt`;
      const lowerPath: string = pathInFiles(lowerName);
      const upperPath: string = pathInFiles(upperName);
      try {
        writeTextFile(lowerPath, 'lower');
        writeTextFile(upperPath, 'upper');
        expect(readTextFile(lowerPath, 5)).assertEqual('lower');
        expect(readTextFile(upperPath, 5)).assertEqual('upper');
        expect(lowerName === upperName).assertFalse();
      } finally {
        removeQuietly(lowerPath);
        removeQuietly(upperPath);
      }
    })

    /**
     * @tc.number    SUB_AVS_FILE_NAME_1600
     * @tc.name      testFileName0016
     * @tc.desc      Verify every sampled name is unique inside the sandbox files directory
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFileName0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const paths: string[] = [];
      try {
        for (let i = 0; i < NAME_CASES.length; i++) {
          const path: string = namedTarget(NAME_CASES[i].label, NAME_CASES[i].suffix);
          paths.push(path);
          writeTextFile(path, NAME_CASES[i].payload);
        }
        const distinct: Set<string> = new Set<string>();
        for (let i = 0; i < paths.length; i++) {
          distinct.add(paths[i]);
          expect(fileIo.statSync(paths[i]).size).assertLarger(0);
        }
        expect(distinct.size).assertEqual(NAME_CASES.length);
        const listed: string[] = fileIo.listFileSync(appContext().filesDir);
        expect(listed.length).assertLargerOrEqual(NAME_CASES.length);
      } finally {
        for (let i = 0; i < paths.length; i++) {
          removeQuietly(paths[i]);
        }
      }
    })
  });
}
