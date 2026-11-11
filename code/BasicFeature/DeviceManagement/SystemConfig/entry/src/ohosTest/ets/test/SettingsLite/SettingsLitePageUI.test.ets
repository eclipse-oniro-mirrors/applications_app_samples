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
 * 日志面板标题栏渲染的条目总数，是页面日志数组的唯一权威计数。
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
 * 设置信息页面状态编排测试。
 * PIN/NFC/双击跳转的系统设置页由设备侧设置应用提供，本镜像无对应 Want handler，
 * 应用侧构造的 Want 内容由 SettingsLiteService 套件校验。
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
        // aboutToAppear 只写入初始化一条日志，页面日志数必须与之相等
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
        // settingsLite 为 FA 专用接口，Stage 环境查询如实返回不支持错误
        expect(await session.scrollTextOf('查询出错')).assertEqual('查询出错');
        expect(await session.scrollTextOf('操作失败')).assertEqual('操作失败');
        expect(await session.scrollTextOf('双击查询失败', true)).assertContain('双击查询失败');
        // 初始化一条、查询进行中一条、查询失败一条
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
        // 查询结果字段与重置前是同一个节点，此处已把它滚入视口，计数为 0 才能证明旧值被清除
        expect(await session.textCount('查询出错')).assertEqual(0);
        // resetState 先清空日志数组再写入“状态已重置”，面板计数回落为一条即证明历史日志全部清除
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
