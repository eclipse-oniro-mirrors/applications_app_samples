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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  SAMPLING_RATE_KEY_MAP, CHANNEL_KEY_MAP, SOURCE_TYPE_KEY_MAP, SAMPLE_FORMAT_KEY_MAP,
  SAMPLING_RATE_OPTIONS, CHANNEL_OPTIONS, SOURCE_TYPE_OPTIONS, SAMPLE_FORMAT_OPTIONS
} from '../../../main/ets/common/constants/SelectConstants';

const TAG: string = '[Sample_selectMapConsistencyCore]';
const DOMAIN: number = 0xF811;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function selectMapConsistencyCoreTest(): void {
  describe('selectMapConsistencyCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_0100
     * @tc.name      testSelectMapConsistency0001
     * @tc.desc      Verify selectMapConsistencyCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_0200
     * @tc.name      testSelectMapConsistency0002
     * @tc.desc      Verify selectMapConsistencyCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_0300
     * @tc.name      testSelectMapConsistency0003
     * @tc.desc      Verify selectMapConsistencyCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[2].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[2].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_0400
     * @tc.name      testSelectMapConsistency0004
     * @tc.desc      Verify selectMapConsistencyCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[3].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[3].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_0500
     * @tc.name      testSelectMapConsistency0005
     * @tc.desc      Verify selectMapConsistencyCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[4].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[4].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_0600
     * @tc.name      testSelectMapConsistency0006
     * @tc.desc      Verify selectMapConsistencyCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[5].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[5].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_0700
     * @tc.name      testSelectMapConsistency0007
     * @tc.desc      Verify selectMapConsistencyCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[6].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[6].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_0800
     * @tc.name      testSelectMapConsistency0008
     * @tc.desc      Verify selectMapConsistencyCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[7].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[7].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_0900
     * @tc.name      testSelectMapConsistency0009
     * @tc.desc      Verify selectMapConsistencyCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[8].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_1000
     * @tc.name      testSelectMapConsistency0010
     * @tc.desc      Verify selectMapConsistencyCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_1100
     * @tc.name      testSelectMapConsistency0011
     * @tc.desc      Verify selectMapConsistencyCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[2].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_1200
     * @tc.name      testSelectMapConsistency0012
     * @tc.desc      Verify selectMapConsistencyCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[2].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[3].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_1300
     * @tc.name      testSelectMapConsistency0013
     * @tc.desc      Verify selectMapConsistencyCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[3].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[4].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_1400
     * @tc.name      testSelectMapConsistency0014
     * @tc.desc      Verify selectMapConsistencyCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[4].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[5].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_1500
     * @tc.name      testSelectMapConsistency0015
     * @tc.desc      Verify selectMapConsistencyCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[5].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[6].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_1600
     * @tc.name      testSelectMapConsistency0016
     * @tc.desc      Verify selectMapConsistencyCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[6].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[7].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_1700
     * @tc.name      testSelectMapConsistency0017
     * @tc.desc      Verify selectMapConsistencyCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[7].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_1800
     * @tc.name      testSelectMapConsistency0018
     * @tc.desc      Verify selectMapConsistencyCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[8].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_1900
     * @tc.name      testSelectMapConsistency0019
     * @tc.desc      Verify selectMapConsistencyCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[2].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_2000
     * @tc.name      testSelectMapConsistency0020
     * @tc.desc      Verify selectMapConsistencyCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[3].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_2100
     * @tc.name      testSelectMapConsistency0021
     * @tc.desc      Verify selectMapConsistencyCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[2].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[4].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_2200
     * @tc.name      testSelectMapConsistency0022
     * @tc.desc      Verify selectMapConsistencyCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[3].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[5].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_2300
     * @tc.name      testSelectMapConsistency0023
     * @tc.desc      Verify selectMapConsistencyCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[4].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[6].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_2400
     * @tc.name      testSelectMapConsistency0024
     * @tc.desc      Verify selectMapConsistencyCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[5].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[7].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_2500
     * @tc.name      testSelectMapConsistency0025
     * @tc.desc      Verify selectMapConsistencyCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[6].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_2600
     * @tc.name      testSelectMapConsistency0026
     * @tc.desc      Verify selectMapConsistencyCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[7].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_2700
     * @tc.name      testSelectMapConsistency0027
     * @tc.desc      Verify selectMapConsistencyCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[8].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[2].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_2800
     * @tc.name      testSelectMapConsistency0028
     * @tc.desc      Verify selectMapConsistencyCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[3].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_2900
     * @tc.name      testSelectMapConsistency0029
     * @tc.desc      Verify selectMapConsistencyCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[4].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_3000
     * @tc.name      testSelectMapConsistency0030
     * @tc.desc      Verify selectMapConsistencyCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[2].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[5].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_3100
     * @tc.name      testSelectMapConsistency0031
     * @tc.desc      Verify selectMapConsistencyCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[3].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[6].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_3200
     * @tc.name      testSelectMapConsistency0032
     * @tc.desc      Verify selectMapConsistencyCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[4].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[7].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_3300
     * @tc.name      testSelectMapConsistency0033
     * @tc.desc      Verify selectMapConsistencyCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[5].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_3400
     * @tc.name      testSelectMapConsistency0034
     * @tc.desc      Verify selectMapConsistencyCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[6].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_3500
     * @tc.name      testSelectMapConsistency0035
     * @tc.desc      Verify selectMapConsistencyCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[7].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[2].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_3600
     * @tc.name      testSelectMapConsistency0036
     * @tc.desc      Verify selectMapConsistencyCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[8].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[3].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_3700
     * @tc.name      testSelectMapConsistency0037
     * @tc.desc      Verify selectMapConsistencyCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[4].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_3800
     * @tc.name      testSelectMapConsistency0038
     * @tc.desc      Verify selectMapConsistencyCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[5].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_3900
     * @tc.name      testSelectMapConsistency0039
     * @tc.desc      Verify selectMapConsistencyCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[2].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[6].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_4000
     * @tc.name      testSelectMapConsistency0040
     * @tc.desc      Verify selectMapConsistencyCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[3].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[7].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_4100
     * @tc.name      testSelectMapConsistency0041
     * @tc.desc      Verify selectMapConsistencyCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[4].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_4200
     * @tc.name      testSelectMapConsistency0042
     * @tc.desc      Verify selectMapConsistencyCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[5].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_4300
     * @tc.name      testSelectMapConsistency0043
     * @tc.desc      Verify selectMapConsistencyCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[6].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[2].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_4400
     * @tc.name      testSelectMapConsistency0044
     * @tc.desc      Verify selectMapConsistencyCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[7].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[3].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_4500
     * @tc.name      testSelectMapConsistency0045
     * @tc.desc      Verify selectMapConsistencyCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[8].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[4].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_4600
     * @tc.name      testSelectMapConsistency0046
     * @tc.desc      Verify selectMapConsistencyCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[5].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_4700
     * @tc.name      testSelectMapConsistency0047
     * @tc.desc      Verify selectMapConsistencyCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[6].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_4800
     * @tc.name      testSelectMapConsistency0048
     * @tc.desc      Verify selectMapConsistencyCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[2].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[7].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_4900
     * @tc.name      testSelectMapConsistency0049
     * @tc.desc      Verify selectMapConsistencyCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[3].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_5000
     * @tc.name      testSelectMapConsistency0050
     * @tc.desc      Verify selectMapConsistencyCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[4].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_5100
     * @tc.name      testSelectMapConsistency0051
     * @tc.desc      Verify selectMapConsistencyCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[5].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[2].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_5200
     * @tc.name      testSelectMapConsistency0052
     * @tc.desc      Verify selectMapConsistencyCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[6].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[3].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_5300
     * @tc.name      testSelectMapConsistency0053
     * @tc.desc      Verify selectMapConsistencyCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[7].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[4].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_5400
     * @tc.name      testSelectMapConsistency0054
     * @tc.desc      Verify selectMapConsistencyCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[8].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[5].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_5500
     * @tc.name      testSelectMapConsistency0055
     * @tc.desc      Verify selectMapConsistencyCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[6].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_5600
     * @tc.name      testSelectMapConsistency0056
     * @tc.desc      Verify selectMapConsistencyCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[7].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_5700
     * @tc.name      testSelectMapConsistency0057
     * @tc.desc      Verify selectMapConsistencyCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[2].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_5800
     * @tc.name      testSelectMapConsistency0058
     * @tc.desc      Verify selectMapConsistencyCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[3].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_5900
     * @tc.name      testSelectMapConsistency0059
     * @tc.desc      Verify selectMapConsistencyCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[4].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[2].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_6000
     * @tc.name      testSelectMapConsistency0060
     * @tc.desc      Verify selectMapConsistencyCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[5].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[3].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_6100
     * @tc.name      testSelectMapConsistency0061
     * @tc.desc      Verify selectMapConsistencyCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[6].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[4].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_6200
     * @tc.name      testSelectMapConsistency0062
     * @tc.desc      Verify selectMapConsistencyCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[7].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[5].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_6300
     * @tc.name      testSelectMapConsistency0063
     * @tc.desc      Verify selectMapConsistencyCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[8].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[6].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_6400
     * @tc.name      testSelectMapConsistency0064
     * @tc.desc      Verify selectMapConsistencyCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[7].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_6500
     * @tc.name      testSelectMapConsistency0065
     * @tc.desc      Verify selectMapConsistencyCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_6600
     * @tc.name      testSelectMapConsistency0066
     * @tc.desc      Verify selectMapConsistencyCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[2].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_6700
     * @tc.name      testSelectMapConsistency0067
     * @tc.desc      Verify selectMapConsistencyCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[3].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[2].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_6800
     * @tc.name      testSelectMapConsistency0068
     * @tc.desc      Verify selectMapConsistencyCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[4].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[3].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_6900
     * @tc.name      testSelectMapConsistency0069
     * @tc.desc      Verify selectMapConsistencyCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[5].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[4].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_7000
     * @tc.name      testSelectMapConsistency0070
     * @tc.desc      Verify selectMapConsistencyCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[6].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[5].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_7100
     * @tc.name      testSelectMapConsistency0071
     * @tc.desc      Verify selectMapConsistencyCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[7].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[6].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_7200
     * @tc.name      testSelectMapConsistency0072
     * @tc.desc      Verify selectMapConsistencyCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[8].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[7].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_7300
     * @tc.name      testSelectMapConsistency0073
     * @tc.desc      Verify selectMapConsistencyCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_7400
     * @tc.name      testSelectMapConsistency0074
     * @tc.desc      Verify selectMapConsistencyCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_7500
     * @tc.name      testSelectMapConsistency0075
     * @tc.desc      Verify selectMapConsistencyCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[2].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[2].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_7600
     * @tc.name      testSelectMapConsistency0076
     * @tc.desc      Verify selectMapConsistencyCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[3].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[3].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_7700
     * @tc.name      testSelectMapConsistency0077
     * @tc.desc      Verify selectMapConsistencyCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[4].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[4].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[1].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_7800
     * @tc.name      testSelectMapConsistency0078
     * @tc.desc      Verify selectMapConsistencyCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[5].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[5].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[2].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_7900
     * @tc.name      testSelectMapConsistency0079
     * @tc.desc      Verify selectMapConsistencyCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 2;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[6].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[6].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[3].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_8000
     * @tc.name      testSelectMapConsistency0080
     * @tc.desc      Verify selectMapConsistencyCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 3;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[7].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[7].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[4].value as string] !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_CONSISTENCY_8100
     * @tc.name      testSelectMapConsistency0081
     * @tc.desc      Verify selectMapConsistencyCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSelectMapConsistency0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(Object.keys(SAMPLING_RATE_KEY_MAP).length).assertEqual(SAMPLING_RATE_OPTIONS.length);
        expect(SAMPLING_RATE_KEY_MAP[SAMPLING_RATE_OPTIONS[8].value as string] !== undefined).assertTrue();
      } else if (variant === 1) {
        expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(CHANNEL_OPTIONS.length);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else if (variant === 2) {
        expect(Object.keys(SOURCE_TYPE_KEY_MAP).length).assertEqual(SOURCE_TYPE_OPTIONS.length);
        expect(SOURCE_TYPE_KEY_MAP[SOURCE_TYPE_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        expect(Object.keys(SAMPLE_FORMAT_KEY_MAP).length).assertEqual(SAMPLE_FORMAT_OPTIONS.length);
        expect(SAMPLE_FORMAT_KEY_MAP[SAMPLE_FORMAT_OPTIONS[0].value as string] !== undefined).assertTrue();
      }
    });

  });
}
