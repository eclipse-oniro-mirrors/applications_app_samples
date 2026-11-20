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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { TitleExpansionState } from '../model/TitleExpansionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandTitle]';
const BUNDLE: string = 'ExpandTitle_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new TitleExpansionState (1 cases). */
export default function titleExpansionStateCtorTest(): void {
  describe('TitleExpansionStateCtorTest', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_TITLE_EXPANSION_STATE_CTOR_0001
     * @tc.name      ExpandTitle_TitleExpansionStateCtor_0001
     * @tc.desc      new TitleExpansionState() initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ExpandTitle_TitleExpansionStateCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TitleExpansionStateCtor_0001 begin`);
      const subject: TitleExpansionState = new TitleExpansionState();
      logInfo(`new TitleExpansionState(): subject.heightValue=${subject.heightValue}`);
      expect(subject.heightValue).assertEqual(80);
      logInfo(`new TitleExpansionState(): subject.curOffset=${subject.curOffset}`);
      expect(subject.curOffset).assertEqual(0);
      logInfo(`new TitleExpansionState(): subject.normalTitleHeight=${subject.normalTitleHeight}`);
      expect(subject.normalTitleHeight).assertEqual(80);
      logInfo(`new TitleExpansionState(): subject.expandTitleHeight=${subject.expandTitleHeight}`);
      expect(subject.expandTitleHeight).assertEqual(100);
      logInfo(`new TitleExpansionState(): subject.titleScale=${subject.titleScale}`);
      expect(subject.titleScale).assertClose(1.2, PRECISION);
      logInfo(`new TitleExpansionState(): subject.continuePullThreshold=${subject.continuePullThreshold}`);
      expect(subject.continuePullThreshold).assertEqual(90);
      logInfo(`${BUNDLE}TitleExpansionStateCtor_0001 end`);
    });
  });
}
