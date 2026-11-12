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
import { describe, expect, it } from '@ohos/hypium';
import { DoNotDisturbModelJson, DoNotDisturbStatus } from 'library';
import { UiTestSession } from '../Utils/UiTestSupport';
import { TestRes } from '../Utils/TestRes';

async function openIntelligentScenePage(session: UiTestSession): Promise<void> {
  await session.start();
  await session.openHomeEntry(TestRes.str('page_intelligent_scene'), TestRes.str('btn_query_all'));
}

async function readDndDetail(session: UiTestSession): Promise<DoNotDisturbModelJson> {
  const detailText: string = await session.scrollTextOf('"queryCount"', true);
  return JSON.parse(detailText) as DoNotDisturbModelJson;
}

/**
 * Intelligent scene page loading and initial state test.
 * The page result of the do-not-disturb query button depends on the system notification management service and is covered separately by the service-layer suite.
 */
export default function intelligentScenePageUITest(): void {
  describe('IntelligentScenePageUITest', () => {
    /**
     * @tc.number SUB_INTELLIGENT_SCENE_PAGE_UI_0100
     * @tc.name testIntelligentScenePageUI0001
     * @tc.desc Verify initial scene values and initialization log.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testIntelligentScenePageUI0001', 0, async () => {
      const session: UiTestSession = new UiTestSession();
      try {
        await openIntelligentScenePage(session);
        expect(await session.scrollTextOf(TestRes.str('value_disabled'))).assertEqual(TestRes.str('value_disabled'));
        expect(await session.scrollTextOf(TestRes.str('value_allowed'))).assertEqual(TestRes.str('value_allowed'));
        expect(await session.scrollTextOf(TestRes.str('status_idle'))).assertEqual(TestRes.str('status_idle'));
        expect(await session.scrollTextOf(TestRes.str('log_vm_initialized'), true))
          .assertContain(TestRes.str('log_vm_initialized'));
        const detail: DoNotDisturbModelJson = await readDndDetail(session);
        expect(detail.status).assertEqual(DoNotDisturbStatus.IDLE);
        expect(detail.queryCount).assertEqual(0);
        expect(detail.lastQueryTime).assertEqual(0);
      } finally {
        await session.cleanup();
      }
    });
  });
}
