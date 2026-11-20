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
import { MultiplexCardState } from '../model/ComponentSampleLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentCollection]';
const BUNDLE: string = 'ComponentCollection_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new MultiplexCardState (1 cases). */
export default function multiplexCardStateCtorTest(): void {
  describe('MultiplexCardStateCtorTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_MULTIPLEX_CARD_STATE_CTOR_0001
     * @tc.name      ComponentCollection_MultiplexCardStateCtor_0001
     * @tc.desc      new MultiplexCardState() initialises 7 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_MultiplexCardStateCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MultiplexCardStateCtor_0001 begin`);
      const subject: MultiplexCardState = new MultiplexCardState();
      logInfo(`new MultiplexCardState(): subject.sx=${subject.sx}`);
      expect(subject.sx).assertEqual(1);
      logInfo(`new MultiplexCardState(): subject.scaleX=${subject.scaleX}`);
      expect(subject.scaleX).assertEqual(1);
      logInfo(`new MultiplexCardState(): subject.angle=${subject.angle}`);
      expect(subject.angle).assertEqual(0);
      logInfo(`new MultiplexCardState(): subject.translateY=${subject.translateY}`);
      expect(subject.translateY).assertEqual(0);
      logInfo(`new MultiplexCardState(): subject.offsetY=${subject.offsetY}`);
      expect(subject.offsetY).assertEqual(0);
      logInfo(`new MultiplexCardState(): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(720);
      logInfo(`new MultiplexCardState(): subject.deleted=${subject.deleted}`);
      expect(subject.deleted).assertFalse();
      logInfo(`${BUNDLE}MultiplexCardStateCtor_0001 end`);
    });
  });
}
