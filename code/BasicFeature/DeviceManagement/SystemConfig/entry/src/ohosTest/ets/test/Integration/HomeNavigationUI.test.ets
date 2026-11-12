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
        expect(await session.textOf('SystemConfig 示例')).assertEqual('SystemConfig 示例');
        expect(await session.textOf('本示例演示 Basic Services Kit 中的定制配置、情景模式和设置信息接口。'))
          .assertEqual('本示例演示 Basic Services Kit 中的定制配置、情景模式和设置信息接口。');
        expect(await session.textOf('定制配置')).assertEqual('定制配置');
        expect(await session.textOf('情景模式')).assertEqual('情景模式');
        expect(await session.textOf('设置信息')).assertEqual('设置信息');
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
        await session.openHomeEntry('定制配置', '获取渠道号');
        expect(await session.textOf('定制配置')).assertEqual('定制配置');
        expect(await session.textOf('获取渠道号')).assertEqual('获取渠道号');
        await session.pressBack();
        expect(await session.textOf('定制配置')).assertEqual('定制配置');
        expect(await session.textOf('情景模式')).assertEqual('情景模式');
        expect(await session.textOf('设置信息')).assertEqual('设置信息');
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
        await session.openHomeEntry('情景模式', '查询全部状态');
        expect(await session.textOf('情景模式')).assertEqual('情景模式');
        expect(await session.textOf('查询全部状态')).assertEqual('查询全部状态');
        await session.pressBack();
        expect(await session.textOf('定制配置')).assertEqual('定制配置');
        expect(await session.textOf('情景模式')).assertEqual('情景模式');
        expect(await session.textOf('设置信息')).assertEqual('设置信息');
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
        await session.openHomeEntry('设置信息', '查询双击应用');
        expect(await session.textOf('设置信息')).assertEqual('设置信息');
        expect(await session.textOf('查询双击应用')).assertEqual('查询双击应用');
        await session.pressBack();
        expect(await session.textOf('定制配置')).assertEqual('定制配置');
        expect(await session.textOf('情景模式')).assertEqual('情景模式');
        expect(await session.textOf('设置信息')).assertEqual('设置信息');
      } finally {
        await session.cleanup();
      }
    });
  });
}
