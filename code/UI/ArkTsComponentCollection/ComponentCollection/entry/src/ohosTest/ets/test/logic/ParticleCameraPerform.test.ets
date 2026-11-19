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
import { ParticleCamera } from '../model/ComponentSampleLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentCollection]';
const BUNDLE: string = 'ComponentCollection_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ParticleCamera.perform (1 cases). */
export default function particleCameraPerformTest(): void {
  describe('ParticleCameraPerformTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_PERFORM_0001
     * @tc.name      ComponentCollection_ParticleCameraPerform_0001
     * @tc.desc      ParticleCamera.perform() yields 3.147653259650399
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_ParticleCameraPerform_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ParticleCameraPerform_0001 begin`);
      const subject: ParticleCamera = new ParticleCamera(0, 0);
      const actual: number = subject.perform();
      logInfo(`perform(): actual=${actual}`);
      expect(actual).assertClose(3.147653259650399, PRECISION);
      logInfo(`perform() state: subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(1);
      logInfo(`perform() state: subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertClose(3.147653259650399, PRECISION);
      logInfo(`perform() state: subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertClose(-1.5707963167948966, PRECISION);
      logInfo(`${BUNDLE}ParticleCameraPerform_0001 end`);
    });
  });
}
