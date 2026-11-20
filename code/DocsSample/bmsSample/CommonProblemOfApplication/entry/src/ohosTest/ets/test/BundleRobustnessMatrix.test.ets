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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { paceTurn } from './shared/TestPace';
import {
  NON_EXIST_BUNDLE_NAME,
  ERR_BUNDLE_NOT_FOUND,
  ERR_PERMISSION_DENIED,
  FLAGS_FOR_APP,
  queryByNamePromise,
  isKnownBusinessCode
} from './shared/BundleProbe';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CommonProblem_RobustMatrix]';

function buildLongName(): string {
  let name: string = 'com.example.';
  for (let i: number = 0; i < 200; i++) {
    name += 'x';
  }
  return name;
}

export default function bundleRobustnessMatrixTest() {
  describe('bundleRobustnessMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ROBUST_0100
     * @tc.name testBadNameEmptyRejects
     * @tc.desc Verify empty bundle name query rejects with known business code
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBadNameEmptyRejects', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBadNameEmptyRejects begin');
      try {
        await queryByNamePromise('', FLAGS_FOR_APP);
        expect(false).assertTrue();
      } catch (e) {
        const err: BusinessError = e as BusinessError;
        expect(isKnownBusinessCode(err.code)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBadNameEmptyRejects end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ROBUST_0200
     * @tc.name testBadNameBlankRejects
     * @tc.desc Verify blank bundle name query rejects with known business code
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBadNameBlankRejects', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBadNameBlankRejects begin');
      try {
        await queryByNamePromise(' ', FLAGS_FOR_APP);
        expect(false).assertTrue();
      } catch (e) {
        const err: BusinessError = e as BusinessError;
        expect(isKnownBusinessCode(err.code)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBadNameBlankRejects end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ROBUST_0300
     * @tc.name testBadNameNotExistRejects
     * @tc.desc Verify non-existent bundle query rejects with known business code
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBadNameNotExistRejects', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBadNameNotExistRejects begin');
      try {
        await queryByNamePromise(NON_EXIST_BUNDLE_NAME, FLAGS_FOR_APP);
        expect(false).assertTrue();
      } catch (e) {
        const err: BusinessError = e as BusinessError;
        expect(isKnownBusinessCode(err.code)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBadNameNotExistRejects end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ROBUST_0400
     * @tc.name testBadNameOtherNotExistRejects
     * @tc.desc Verify another non-existent bundle query rejects with known business code
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBadNameOtherNotExistRejects', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBadNameOtherNotExistRejects begin');
      try {
        await queryByNamePromise('com.example.notexist', FLAGS_FOR_APP);
        expect(false).assertTrue();
      } catch (e) {
        const err: BusinessError = e as BusinessError;
        expect(isKnownBusinessCode(err.code)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBadNameOtherNotExistRejects end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ROBUST_0500
     * @tc.name testBadNameOverlongRejects
     * @tc.desc Verify overlong bundle name query rejects with known business code
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBadNameOverlongRejects', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBadNameOverlongRejects begin');
      try {
        await queryByNamePromise(buildLongName(), FLAGS_FOR_APP);
        expect(false).assertTrue();
      } catch (e) {
        const err: BusinessError = e as BusinessError;
        expect(isKnownBusinessCode(err.code)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBadNameOverlongRejects end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ROBUST_0900
     * @tc.name testNotExistReturnsKnownError
     * @tc.desc Verify non-existent bundle returns 17700001 or 201
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testNotExistReturnsKnownError', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotExistReturnsKnownError begin');
      try {
        await queryByNamePromise(NON_EXIST_BUNDLE_NAME, FLAGS_FOR_APP);
        expect(false).assertTrue();
      } catch (e) {
        const err: BusinessError = e as BusinessError;
        expect(err.code === ERR_BUNDLE_NOT_FOUND || err.code === ERR_PERMISSION_DENIED).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testNotExistReturnsKnownError end');
    });
  })
}
