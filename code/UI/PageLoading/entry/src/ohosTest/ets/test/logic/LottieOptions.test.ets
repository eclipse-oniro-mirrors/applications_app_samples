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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../../utils/YieldHook';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { LottieOptions, lottieOptions } from '../model/PageLoadingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PageLoading]';
const BUNDLE: string = 'PageLoading_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for lottieOptions (1 cases). */
export default function lottieOptionsTest(): void {
  describe('LottieOptionsTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_LOTTIE_OPTIONS_0001
     * @tc.name      PageLoading_LottieOptions_0001
     * @tc.desc      lottieOptions() returns "common/lottie/pageLoading.json"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_LottieOptions_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LottieOptions_0001 begin`);
      const actual: LottieOptions = lottieOptions();
      logInfo(`lottieOptions(): actual.renderer=${actual.renderer}`);
      expect(actual.renderer).assertEqual('canvas');
      logInfo(`lottieOptions(): actual.loop=${actual.loop}`);
      expect(actual.loop).assertTrue();
      logInfo(`lottieOptions(): actual.autoplay=${actual.autoplay}`);
      expect(actual.autoplay).assertTrue();
      logInfo(`lottieOptions(): actual.name=${actual.name}`);
      expect(actual.name).assertEqual('pageLoading');
      logInfo(`lottieOptions(): actual.path=${actual.path}`);
      expect(actual.path).assertEqual('common/lottie/pageLoading.json');
      logInfo(`${BUNDLE}LottieOptions_0001 end`);
    });
  });
}
