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
import { ChannelConfigJson, ChannelConfigStatus } from 'library';
import { UiTestSession } from '../Utils/UiTestSupport';

const SUCCESS_LOG_PREFIX: string = '获取渠道号成功: ';
const FAILURE_LOG_PREFIX: string = '获取渠道号失败: ';

/**
 * 日志面板标题栏渲染的条目总数，是页面日志数组的唯一权威计数。
 */
function logCountLabel(count: number): string {
  return `共 ${count} 条`;
}

/**
 * CustomConfigPage.getStatusText 的期望映射。
 */
function statusTextOf(status: ChannelConfigStatus): string {
  if (status === ChannelConfigStatus.SUCCESS) {
    return '获取成功';
  }
  if (status === ChannelConfigStatus.FAILED) {
    return '获取失败';
  }
  if (status === ChannelConfigStatus.LOADING) {
    return '获取中';
  }
  return '未初始化';
}

function isFetchSuccess(detail: ChannelConfigJson): boolean {
  return detail.status === ChannelConfigStatus.SUCCESS && detail.channelId.length > 0;
}

/**
 * 页面展示值由 viewModel.currentChannelId || '未获取' 决定，
 * 而 ChannelConfigModel 仅在获取成功时写入 channelId，失败与空值一律回落为未获取。
 */
function displayedChannelId(detail: ChannelConfigJson): string {
  return isFetchSuccess(detail) ? detail.channelId : '未获取';
}

function resultLogPrefix(detail: ChannelConfigJson): string {
  return isFetchSuccess(detail) ? SUCCESS_LOG_PREFIX : FAILURE_LOG_PREFIX;
}

function resultLogSuffix(detail: ChannelConfigJson): string {
  return isFetchSuccess(detail) ? detail.channelId : detail.errorMessage;
}

function logResult(log: string, prefix: string): string {
  return log.substring(log.indexOf(prefix) + prefix.length);
}

async function openCustomConfigPage(session: UiTestSession): Promise<void> {
  await session.start();
  await session.openHomeEntry('定制配置', '获取渠道号');
}

/**
 * 定制配置页面真实 ViewModel 编排测试。
 */
export default function customConfigPageUITest(): void {
  describe('CustomConfigPageUITest', () => {
    /**
     * @tc.number SUB_CUSTOM_CONFIG_PAGE_UI_0100
     * @tc.name testCustomConfigPageUI0001
     * @tc.desc Verify initial custom config values actions and initialization log.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCustomConfigPageUI0001', 0, async () => {
      const session: UiTestSession = new UiTestSession();
      try {
        await openCustomConfigPage(session);
        expect(await session.textOf('定制配置')).assertEqual('定制配置');
        expect(await session.textOf('未获取')).assertEqual('未获取');
        expect(await session.textOf('未初始化')).assertEqual('未初始化');
        expect(await session.textOf('获取渠道号')).assertEqual('获取渠道号');
        expect(await session.textOf('查看详情')).assertEqual('查看详情');
        expect(await session.textOf('重置')).assertEqual('重置');
        // aboutToAppear 只写入初始化一条日志，页面日志数必须与之相等
        expect(await session.scrollTextOf(logCountLabel(1))).assertEqual(logCountLabel(1));
        expect(await session.scrollTextOf('视图模型初始化完成', true)).assertContain('视图模型初始化完成');
        const initText: string = await session.scrollTextOf('"channelId"', true);
        const detail: ChannelConfigJson = JSON.parse(initText) as ChannelConfigJson;
        expect(detail.status).assertEqual(ChannelConfigStatus.UNINITIALIZED);
        expect(detail.channelId).assertEqual('');
        expect(detail.fetchCount).assertEqual(0);
        expect(detail.lastFetchTime).assertEqual(0);
      } finally {
        await session.cleanup();
      }
    });

    /**
     * @tc.number SUB_CUSTOM_CONFIG_PAGE_UI_0200
     * @tc.name testCustomConfigPageUI0002
     * @tc.desc Verify channel status badge and result log both match the detail model.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCustomConfigPageUI0002', 0, async () => {
      const session: UiTestSession = new UiTestSession();
      try {
        await openCustomConfigPage(session);
        await session.scrollClickText('获取渠道号');
        // fetchChannelId 固定追加“正在获取”与“结果”两条日志，初始化一条合计三条
        expect(await session.scrollTextOf(logCountLabel(3))).assertEqual(logCountLabel(3));

        const detailText: string = await session.scrollTextOf('"channelId"', true);
        const detail: ChannelConfigJson = JSON.parse(detailText) as ChannelConfigJson;
        expect(detail.fetchCount).assertEqual(1);
        expect(detail.lastFetchTime).assertLarger(0);

        // 状态标签文本由 detail.status 推导，而不是先探测界面再自比
        const expectedStatus: string = statusTextOf(detail.status);
        expect(await session.scrollTextOf(expectedStatus)).assertEqual(expectedStatus);
        expect(await session.textCount(statusTextOf(ChannelConfigStatus.UNINITIALIZED))).assertEqual(0);

        // 渠道号字段与结果日志同样以 detail 模型为期望来源
        expect(await session.scrollTextOf(displayedChannelId(detail))).assertEqual(displayedChannelId(detail));
        const resultLog: string = await session.scrollTextOf(resultLogPrefix(detail), true);
        expect(logResult(resultLog, resultLogPrefix(detail))).assertEqual(resultLogSuffix(detail));

        if (isFetchSuccess(detail)) {
          expect(detail.errorCode).assertEqual(0);
          expect(detail.errorMessage).assertEqual('');
        } else if (detail.status === ChannelConfigStatus.SUCCESS) {
          expect(detail.channelId).assertEqual('');
          expect(detail.errorCode).assertEqual(0);
          expect(detail.errorMessage).assertEqual('');
        } else {
          expect(detail.status).assertEqual(ChannelConfigStatus.FAILED);
          expect(detail.channelId).assertEqual('');
          expect(detail.errorCode).assertLarger(0);
          expect(detail.errorMessage.length).assertLarger(0);
        }
      } finally {
        await session.cleanup();
      }
    });

    /**
     * @tc.number SUB_CUSTOM_CONFIG_PAGE_UI_0300
     * @tc.name testCustomConfigPageUI0003
     * @tc.desc Verify detail JSON channel and status match page results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCustomConfigPageUI0003', 0, async () => {
      const session: UiTestSession = new UiTestSession();
      try {
        await openCustomConfigPage(session);
        await session.scrollClickText('获取渠道号');
        await session.scrollClickText('查看详情');
        expect(await session.scrollTextOf('详细数据')).assertEqual('详细数据');
        const detailText: string = await session.scrollTextOf('"channelId"', true);
        const detail: ChannelConfigJson = JSON.parse(detailText) as ChannelConfigJson;
        expect(detail.fetchCount).assertEqual(1);
        expect(detailText).assertContain('"status"');
        expect(await session.scrollTextOf(statusTextOf(detail.status))).assertEqual(statusTextOf(detail.status));
        expect(await session.scrollTextOf(displayedChannelId(detail))).assertEqual(displayedChannelId(detail));
        if (detail.status === ChannelConfigStatus.SUCCESS && detail.channelId.length > 0) {
          expect(detail.errorMessage).assertEqual('');
          expect(detail.errorCode).assertEqual(0);
          expect(detail.lastFetchTime).assertLarger(0);
        } else if (detail.status === ChannelConfigStatus.SUCCESS) {
          expect(detail.channelId).assertEqual('');
          expect(detail.errorMessage).assertEqual('');
        } else {
          expect(detail.status).assertEqual(ChannelConfigStatus.FAILED);
          expect(detail.channelId).assertEqual('');
          expect(detail.errorMessage.length).assertLarger(0);
          expect(detail.errorCode).assertLarger(0);
        }
      } finally {
        await session.cleanup();
      }
    });

    /**
     * @tc.number SUB_CUSTOM_CONFIG_PAGE_UI_0400
     * @tc.name testCustomConfigPageUI0004
     * @tc.desc Verify reset clears prior channel details and operation logs.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCustomConfigPageUI0004', 0, async () => {
      const session: UiTestSession = new UiTestSession();
      try {
        await openCustomConfigPage(session);
        await session.scrollClickText('获取渠道号');
        await session.scrollClickText('查看详情');
        await session.scrollClickText('重置');
        expect(await session.scrollTextOf('未获取')).assertEqual('未获取');
        expect(await session.scrollTextOf('未初始化')).assertEqual('未初始化');
        // resetState 先清空日志数组再写入“状态已重置”，因此面板计数必须回落为一条，
        // 由此同时证明初始化日志与获取结果日志均已被清除
        expect(await session.scrollTextOf(logCountLabel(1))).assertEqual(logCountLabel(1));
        expect(await session.scrollTextOf('状态已重置', true)).assertContain('状态已重置');

        const detailText: string = await session.scrollTextOf('"channelId"', true);
        const detail: ChannelConfigJson = JSON.parse(detailText) as ChannelConfigJson;
        expect(detail.channelId).assertEqual('');
        expect(detail.status).assertEqual(ChannelConfigStatus.UNINITIALIZED);
        expect(detail.fetchCount).assertEqual(0);
        expect(detail.lastFetchTime).assertEqual(0);
        expect(detail.errorMessage).assertEqual('');
        expect(detail.errorCode).assertEqual(0);
      } finally {
        await session.cleanup();
      }
    });
  });
}
