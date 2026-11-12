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
import { UiTestSession } from '../Utils/UiTestSupport';
import { TestRes } from '../Utils/TestRes';

/**
 * Home page real navigation test.
 */
export default function homeNavigationUITest(): void {
  describe('HomeNavigationUITest', () => {
    /**
     * @tc.number SUB_HOME_NAVIGATION_UI_0100
     * @tc.name testHomeNavigationUI0001
     * @tc.desc Verify home application information and three feature entries.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testHomeNavigationUI0001', 0, async () => {
      const session: UiTestSession = new UiTestSession();
      try {
        await session.start();
        expect(await session.textOf(TestRes.str('app_intro_title'))).assertEqual(TestRes.str('app_intro_title'));
        expect(await session.textOf(TestRes.str('app_intro_desc')))
          .assertEqual(TestRes.str('app_intro_desc'));
        expect(await session.textOf(TestRes.str('page_custom_config'))).assertEqual(TestRes.str('page_custom_config'));
        expect(await session.textOf(TestRes.str('page_intelligent_scene')))
          .assertEqual(TestRes.str('page_intelligent_scene'));
        expect(await session.textOf(TestRes.str('page_settings_lite'))).assertEqual(TestRes.str('page_settings_lite'));
      } finally {
        await session.cleanup();
      }
    });

    /**
     * @tc.number SUB_HOME_NAVIGATION_UI_0200
     * @tc.name testHomeNavigationUI0002
     * @tc.desc Verify custom config navigation and home restoration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testHomeNavigationUI0002', 0, async () => {
      const session: UiTestSession = new UiTestSession();
      try {
        await session.start();
        await session.openHomeEntry(TestRes.str('page_custom_config'), TestRes.str('btn_get_channel_id'));
        expect(await session.textOf(TestRes.str('page_custom_config'))).assertEqual(TestRes.str('page_custom_config'));
        expect(await session.textOf(TestRes.str('btn_get_channel_id'))).assertEqual(TestRes.str('btn_get_channel_id'));
        await session.pressBack();
        expect(await session.textOf(TestRes.str('page_custom_config'))).assertEqual(TestRes.str('page_custom_config'));
        expect(await session.textOf(TestRes.str('page_intelligent_scene')))
          .assertEqual(TestRes.str('page_intelligent_scene'));
        expect(await session.textOf(TestRes.str('page_settings_lite'))).assertEqual(TestRes.str('page_settings_lite'));
      } finally {
        await session.cleanup();
      }
    });

    /**
     * @tc.number SUB_HOME_NAVIGATION_UI_0300
     * @tc.name testHomeNavigationUI0003
     * @tc.desc Verify intelligent scene navigation and home restoration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testHomeNavigationUI0003', 0, async () => {
      const session: UiTestSession = new UiTestSession();
      try {
        await session.start();
        await session.openHomeEntry(TestRes.str('page_intelligent_scene'), TestRes.str('btn_query_all'));
        expect(await session.textOf(TestRes.str('page_intelligent_scene')))
          .assertEqual(TestRes.str('page_intelligent_scene'));
        expect(await session.textOf(TestRes.str('btn_query_all'))).assertEqual(TestRes.str('btn_query_all'));
        await session.pressBack();
        expect(await session.textOf(TestRes.str('page_custom_config'))).assertEqual(TestRes.str('page_custom_config'));
        expect(await session.textOf(TestRes.str('page_intelligent_scene')))
          .assertEqual(TestRes.str('page_intelligent_scene'));
        expect(await session.textOf(TestRes.str('page_settings_lite'))).assertEqual(TestRes.str('page_settings_lite'));
      } finally {
        await session.cleanup();
      }
    });

    /**
     * @tc.number SUB_HOME_NAVIGATION_UI_0400
     * @tc.name testHomeNavigationUI0004
     * @tc.desc Verify settings lite navigation and home restoration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testHomeNavigationUI0004', 0, async () => {
      const session: UiTestSession = new UiTestSession();
      try {
        await session.start();
        await session.openHomeEntry(TestRes.str('page_settings_lite'), TestRes.str('btn_query_double_click'));
        expect(await session.textOf(TestRes.str('page_settings_lite'))).assertEqual(TestRes.str('page_settings_lite'));
        expect(await session.textOf(TestRes.str('btn_query_double_click')))
          .assertEqual(TestRes.str('btn_query_double_click'));
        await session.pressBack();
        expect(await session.textOf(TestRes.str('page_custom_config'))).assertEqual(TestRes.str('page_custom_config'));
        expect(await session.textOf(TestRes.str('page_intelligent_scene')))
          .assertEqual(TestRes.str('page_intelligent_scene'));
        expect(await session.textOf(TestRes.str('page_settings_lite'))).assertEqual(TestRes.str('page_settings_lite'));
      } finally {
        await session.cleanup();
      }
    });
  });
}
