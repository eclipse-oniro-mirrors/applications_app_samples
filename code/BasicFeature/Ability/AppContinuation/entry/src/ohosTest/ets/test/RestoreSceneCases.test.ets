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

import { describe } from '@ohos/hypium';
import { loggedExpect } from '../support/LoggedExpect';
import { BUNDLE, loggedCase as it } from '../support/BoundedCase';
import { SceneWorkbench } from '../../../main/ets/learning/scene/SceneWorkbench';
import {
  clearSceneWorkbench, getSceneWorkbench, publishSceneWorkbench
} from '../../../main/ets/learning/scene/SceneContext';

function fakeWorkbench(tag: string): SceneWorkbench {
  const raw: string = `{"tag":"${tag}"}`;
  return JSON.parse(raw) as Object as SceneWorkbench;
}

function tagOf(workbench: SceneWorkbench): string {
  return (workbench as Object as Record<string, Object>)['tag'] as string;
}

export default function restoreSceneCasesTest(): void {

  describe('SceneContextCases', (): void => {
    /**
     * @tc.number    SUB_CONTINUATION_SCENECONTEXTCASES_0100
     * @tc.name      com.samples.appcontinuation_SceneContextCases_0001
     * @tc.desc      Verify initial value is undefined
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_SceneContextCases_0001', 0, (): void => {
      clearSceneWorkbench();
      loggedExpect(getSceneWorkbench() === undefined, 'RestoreSceneCases.test.ets:A0001', BUNDLE + '_SceneContextCases_0001').assertTrue();
      clearSceneWorkbench();
      loggedExpect(getSceneWorkbench() === undefined, 'RestoreSceneCases.test.ets:A0002', BUNDLE + '_SceneContextCases_0001').assertTrue();
      publishSceneWorkbench(fakeWorkbench('probe'));
      loggedExpect(getSceneWorkbench() === undefined, 'RestoreSceneCases.test.ets:A0003', BUNDLE + '_SceneContextCases_0001').assertFalse();
      clearSceneWorkbench();
      loggedExpect(getSceneWorkbench() === undefined, 'RestoreSceneCases.test.ets:A0004', BUNDLE + '_SceneContextCases_0001').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENECONTEXTCASES_0200
     * @tc.name      com.samples.appcontinuation_SceneContextCases_0002
     * @tc.desc      Verify publish returns same reference
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_SceneContextCases_0002', 0, (): void => {
      const workbench: SceneWorkbench = fakeWorkbench('alpha');
      publishSceneWorkbench(workbench);
      const current: SceneWorkbench | undefined = getSceneWorkbench();
      loggedExpect(current === workbench, 'RestoreSceneCases.test.ets:A0005', BUNDLE + '_SceneContextCases_0002').assertTrue();
      loggedExpect(current !== undefined, 'RestoreSceneCases.test.ets:A0006', BUNDLE + '_SceneContextCases_0002').assertTrue();
      loggedExpect(tagOf(current as SceneWorkbench), 'RestoreSceneCases.test.ets:A0007', BUNDLE + '_SceneContextCases_0002').assertEqual('alpha');
      clearSceneWorkbench();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENECONTEXTCASES_0300
     * @tc.name      com.samples.appcontinuation_SceneContextCases_0003
     * @tc.desc      Verify publish overwrites previous
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_SceneContextCases_0003', 0, (): void => {
      publishSceneWorkbench(fakeWorkbench('first'));
      const second: SceneWorkbench = fakeWorkbench('second');
      publishSceneWorkbench(second);
      const current: SceneWorkbench | undefined = getSceneWorkbench();
      loggedExpect(current === second, 'RestoreSceneCases.test.ets:A0008', BUNDLE + '_SceneContextCases_0003').assertTrue();
      loggedExpect(tagOf(current as SceneWorkbench), 'RestoreSceneCases.test.ets:A0009', BUNDLE + '_SceneContextCases_0003').assertEqual('second');
      loggedExpect(tagOf(current as SceneWorkbench) === 'first', 'RestoreSceneCases.test.ets:A0010', BUNDLE + '_SceneContextCases_0003').assertFalse();
      clearSceneWorkbench();
      loggedExpect(getSceneWorkbench() === undefined, 'RestoreSceneCases.test.ets:A0011', BUNDLE + '_SceneContextCases_0003').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENECONTEXTCASES_0400
     * @tc.name      com.samples.appcontinuation_SceneContextCases_0004
     * @tc.desc      Verify clear resets to undefined
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_SceneContextCases_0004', 0, (): void => {
      publishSceneWorkbench(fakeWorkbench('pending'));
      loggedExpect(getSceneWorkbench() !== undefined, 'RestoreSceneCases.test.ets:A0012', BUNDLE + '_SceneContextCases_0004').assertTrue();
      clearSceneWorkbench();
      loggedExpect(getSceneWorkbench() === undefined, 'RestoreSceneCases.test.ets:A0013', BUNDLE + '_SceneContextCases_0004').assertTrue();
      loggedExpect(getSceneWorkbench() === undefined, 'RestoreSceneCases.test.ets:A0014', BUNDLE + '_SceneContextCases_0004').assertTrue();
    });

    /**
     * @tc.number    SUB_CONTINUATION_SCENECONTEXTCASES_0500
     * @tc.name      com.samples.appcontinuation_SceneContextCases_0005
     * @tc.desc      Verify state is module singleton
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(BUNDLE + '_SceneContextCases_0005', 0, (): void => {
      const workbench: SceneWorkbench = fakeWorkbench('shared');
      publishSceneWorkbench(workbench);
      const first: SceneWorkbench | undefined = getSceneWorkbench();
      const second: SceneWorkbench | undefined = getSceneWorkbench();
      loggedExpect(first === second, 'RestoreSceneCases.test.ets:A0015', BUNDLE + '_SceneContextCases_0005').assertTrue();
      loggedExpect(first === workbench, 'RestoreSceneCases.test.ets:A0016', BUNDLE + '_SceneContextCases_0005').assertTrue();
      loggedExpect(tagOf(first as SceneWorkbench), 'RestoreSceneCases.test.ets:A0017', BUNDLE + '_SceneContextCases_0005').assertEqual('shared');
      clearSceneWorkbench();
    });
  });
}
