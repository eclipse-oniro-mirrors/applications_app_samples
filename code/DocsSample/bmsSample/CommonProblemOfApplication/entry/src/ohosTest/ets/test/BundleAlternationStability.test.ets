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
import { bundleManager } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { paceTurn } from './shared/TestPace';
import { SELF_BUNDLE_NAME, FLAGS_FOR_APP, querySelf, querySelfSync } from './shared/BundleProbe';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CommonProblem_Alternation]';

function runAlternation(rounds: number): void {
  let expectedVersion: number = -1;
  for (let i: number = 0; i < rounds; i++) {
    const syncInfo: bundleManager.BundleInfo = querySelfSync(FLAGS_FOR_APP);
    expect(syncInfo.name).assertEqual(SELF_BUNDLE_NAME);
    if (expectedVersion < 0) {
      expectedVersion = syncInfo.versionCode;
    } else {
      expect(syncInfo.versionCode).assertEqual(expectedVersion);
    }
    expectedVersion = syncInfo.versionCode;
  }
}

async function runAlternationAsync(rounds: number): Promise<void> {
  let expectedVersion: number = -1;
  for (let i: number = 0; i < rounds; i++) {
    const syncInfo: bundleManager.BundleInfo = querySelfSync(FLAGS_FOR_APP);
    const asyncInfo: bundleManager.BundleInfo = await querySelf(FLAGS_FOR_APP);
    expect(syncInfo.name).assertEqual(SELF_BUNDLE_NAME);
    expect(asyncInfo.name).assertEqual(SELF_BUNDLE_NAME);
    expect(asyncInfo.versionCode).assertEqual(syncInfo.versionCode);
    if (expectedVersion < 0) {
      expectedVersion = syncInfo.versionCode;
    } else {
      expect(syncInfo.versionCode).assertEqual(expectedVersion);
    }
    expectedVersion = syncInfo.versionCode;
  }
}

export default function bundleAlternationStabilityTest() {
  describe('bundleAlternationStabilityTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ALTERNATE_0100
     * @tc.name testAlternateRounds10
     * @tc.desc Verify 10 rounds of sync/async alternation keep a single stable versionCode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAlternateRounds10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAlternateRounds10 begin');
      await runAlternationAsync(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAlternateRounds10 end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ALTERNATE_0200
     * @tc.name testAlternateRounds25
     * @tc.desc Verify 25 rounds of sync/async alternation keep a single stable versionCode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAlternateRounds25', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAlternateRounds25 begin');
      await runAlternationAsync(25);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAlternateRounds25 end');
    });

    /**
     * @tc.number SUB_COMMON_PROBLEM_ALTERNATE_0300
     * @tc.name testSyncOnlyRounds30
     * @tc.desc Verify 30 consecutive sync queries keep a single stable versionCode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSyncOnlyRounds30', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncOnlyRounds30 begin');
      runAlternation(30);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSyncOnlyRounds30 end');
    });
  })
}
