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
import { LottieOptions } from '../model/PageLoadingLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PageLoading]';
const BUNDLE: string = 'PageLoading_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new LottieOptions (1 cases). */
export default function lottieOptionsCtorTest(): void {
  describe('LottieOptionsCtorTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_LOTTIE_OPTIONS_CTOR_0001
     * @tc.name      PageLoading_LottieOptionsCtor_0001
     * @tc.desc      new LottieOptions() initialises 5 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('PageLoading_LottieOptionsCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LottieOptionsCtor_0001 begin`);
      const subject: LottieOptions = new LottieOptions();
      logInfo(`new LottieOptions(): subject.renderer=${subject.renderer}`);
      expect(subject.renderer).assertEqual('canvas');
      logInfo(`new LottieOptions(): subject.loop=${subject.loop}`);
      expect(subject.loop).assertTrue();
      logInfo(`new LottieOptions(): subject.autoplay=${subject.autoplay}`);
      expect(subject.autoplay).assertTrue();
      logInfo(`new LottieOptions(): subject.name=${subject.name}`);
      expect(subject.name).assertEqual('pageLoading');
      logInfo(`new LottieOptions(): subject.path=${subject.path}`);
      expect(subject.path).assertEqual('common/lottie/pageLoading.json');
      logInfo(`${BUNDLE}LottieOptionsCtor_0001 end`);
    });
  });
}
