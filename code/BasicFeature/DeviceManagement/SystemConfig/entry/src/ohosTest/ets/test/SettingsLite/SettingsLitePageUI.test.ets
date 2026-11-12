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
import {
  ClickResult,
  SettingsItemModelJson,
  SettingsItemType,
  SettingsOperationStatus,
  SystemConfigConstants
} from 'library';
import { UiTestSession } from '../Utils/UiTestSupport';

async function openSettingsLitePage(session: UiTestSession): Promise<void> {
  await session.start();
  await session.openHomeEntry('设置信息', '查询双击应用');
}

/**
 * The total number of entries rendered in the log panel title bar, which is the single authoritative count of the page log array.
 */
function logCountLabel(count: number): string {
  return `共 ${count} 条`;
}

async function readSettingsDetail(session: UiTestSession): Promise<SettingsItemModelJson[]> {
  const detailText: string = await session.scrollTextOf('"operationStatus"', true);
  return JSON.parse(detailText) as SettingsItemModelJson[];
}

function modelOf(details: SettingsItemModelJson[], itemType: SettingsItemType): SettingsItemModelJson {
  const model: SettingsItemModelJson | undefined = details.find((item: SettingsItemModelJson) =>
    item.itemType === itemType);
  if (model === undefined) {
    throw new Error(`Settings model not found: ${itemType}`);
  }
  return model;
}

/**
 * Settings page state orchestration tests.
 * The system settings pages opened by the PIN/NFC/double-click jumps are provided by the device-side settings app, and this
 * mirror has no matching Want handler; the Want content built by the app side is validated by the SettingsLiteService suite.
 */
export default function settingsLitePageUITest(): void {
  describe('SettingsLitePageUITest', () => {
    /**
     * @tc.number SUB_SETTINGS_LITE_PAGE_UI_0100
     * @tc.name testSettingsLitePageUI0001
     * @tc.desc Verify initial setting cards statuses result and detail models.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsLitePageUI0001', 0, async () => {
      const session: UiTestSession = new UiTestSession();
      try {
        await openSettingsLitePage(session);
        expect(await session.scrollTextOf('PIN 码设置')).assertEqual('PIN 码设置');
        expect(await session.scrollTextOf('NFC 设置')).assertEqual('NFC 设置');
        expect(await session.scrollTextOf('双击设置')).assertEqual('双击设置');
        expect(await session.textCount('空闲')).assertEqual(3);
        expect(await session.scrollTextOf('未查询')).assertEqual('未查询');
        // aboutToAppear writes only one initialization log entry, so the page log count must equal it
        expect(await session.scrollTextOf(logCountLabel(1))).assertEqual(logCountLabel(1));
        expect(await session.scrollTextOf('视图模型初始化完成', true)).assertContain('视图模型初始化完成');
        const details: SettingsItemModelJson[] = await readSettingsDetail(session);
        expect(details.length).assertEqual(3);
        expect(modelOf(details, SettingsItemType.PIN_SETTING).operationStatus)
          .assertEqual(SettingsOperationStatus.IDLE);
        expect(modelOf(details, SettingsItemType.NFC_SETTING).operationStatus)
          .assertEqual(SettingsOperationStatus.IDLE);
        expect(modelOf(details, SettingsItemType.DOUBLE_CLICK_SETTING).operationStatus)
          .assertEqual(SettingsOperationStatus.IDLE);
      } finally {
        await session.cleanup();
      }
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_PAGE_UI_0200
     * @tc.name testSettingsLitePageUI0002
     * @tc.desc Verify double click query reports FA-only unsupported error in Stage model.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsLitePageUI0002', 0, async () => {
      const session: UiTestSession = new UiTestSession();
      try {
        await openSettingsLitePage(session);
        await session.scrollClickText('查询双击应用');
        // settingsLite is an FA-only interface; in a Stage environment the query honestly returns an unsupported error
        expect(await session.scrollTextOf('查询出错')).assertEqual('查询出错');
        expect(await session.scrollTextOf('操作失败')).assertEqual('操作失败');
        expect(await session.scrollTextOf('双击查询失败', true)).assertContain('双击查询失败');
        // one init entry, one query-in-progress entry, one query-failed entry
        expect(await session.scrollTextOf(logCountLabel(3))).assertEqual(logCountLabel(3));
        const details: SettingsItemModelJson[] = await readSettingsDetail(session);
        const doubleClick: SettingsItemModelJson = modelOf(details, SettingsItemType.DOUBLE_CLICK_SETTING);
        expect(doubleClick.operationStatus).assertEqual(SettingsOperationStatus.FAILED);
        expect(doubleClick.clickResult).assertEqual(ClickResult.ERROR);
        expect(doubleClick.operationCount).assertEqual(1);
        expect(doubleClick.lastOperationTime).assertLarger(0);
        expect(doubleClick.errorCode).assertEqual(SystemConfigConstants.ERROR_INTERNAL);
        expect(modelOf(details, SettingsItemType.PIN_SETTING).operationCount).assertEqual(0);
        expect(modelOf(details, SettingsItemType.NFC_SETTING).operationCount).assertEqual(0);
      } finally {
        await session.cleanup();
      }
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_PAGE_UI_0300
     * @tc.name testSettingsLitePageUI0003
     * @tc.desc Verify reset restores all states result details and logs.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsLitePageUI0003', 0, async () => {
      const session: UiTestSession = new UiTestSession();
      try {
        await openSettingsLitePage(session);
        await session.scrollClickText('查询双击应用');
        expect(await session.scrollTextOf('查询出错')).assertEqual('查询出错');
        await session.scrollClickText('重置');
        expect(await session.textCount('空闲')).assertEqual(3);
        expect(await session.textCount('操作失败')).assertEqual(0);
        expect(await session.scrollTextOf('未查询')).assertEqual('未查询');
        // the query result field is the same node as before the reset; here it has been scrolled into view, so a count of 0 proves the stale value was cleared
        expect(await session.textCount('查询出错')).assertEqual(0);
        // resetState first clears the log array then writes the "status reset" entry; the panel count falling back to one proves all history logs were cleared
        expect(await session.scrollTextOf(logCountLabel(1))).assertEqual(logCountLabel(1));
        expect(await session.scrollTextOf('状态已重置', true)).assertContain('状态已重置');
        const details: SettingsItemModelJson[] = await readSettingsDetail(session);
        expect(details.length).assertEqual(3);
        for (const model of details) {
          expect(model.operationStatus).assertEqual(SettingsOperationStatus.IDLE);
          expect(model.operationCount).assertEqual(0);
          expect(model.lastOperationTime).assertEqual(0);
          expect(model.errorMessage).assertEqual('');
          expect(model.errorCode).assertEqual(0);
        }
        expect(modelOf(details, SettingsItemType.DOUBLE_CLICK_SETTING).clickResult).assertEqual(ClickResult.NOT_SELF);
      } finally {
        await session.cleanup();
      }
    });
  });
}
