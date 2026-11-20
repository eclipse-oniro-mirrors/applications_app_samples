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
import { TestRes } from '../Utils/TestRes';

/**
 * Prefix of the fetch-result line that CustomConfigPage appends to the log panel, resolved from
 * the same resource as the page so that it follows the device language.
 */
function successLogPrefix(): string {
  return TestRes.str1('log_channel_success', '');
}

function failureLogPrefix(): string {
  return TestRes.str1('log_channel_failed', '');
}

/**
 * Total entry count rendered in the log panel title bar, the single authoritative count of the page log array.
 */
function logCountLabel(count: number): string {
  return TestRes.str1('log_count', count);
}

/**
 * Expected mapping of CustomConfigPage.getStatusText.
 */
function statusTextOf(status: ChannelConfigStatus): string {
  if (status === ChannelConfigStatus.SUCCESS) {
    return TestRes.str('status_success');
  }
  if (status === ChannelConfigStatus.FAILED) {
    return TestRes.str('status_failed');
  }
  if (status === ChannelConfigStatus.LOADING) {
    return TestRes.str('status_loading');
  }
  return TestRes.str('status_uninitialized');
}

function isFetchSuccess(detail: ChannelConfigJson): boolean {
  return detail.status === ChannelConfigStatus.SUCCESS && detail.channelId.length > 0;
}

/**
 * The displayed value comes from viewModel.currentChannelId || '未获取',
 * and ChannelConfigModel only writes channelId on success; failures and empty values fall back to not-fetched.
 */
function displayedChannelId(detail: ChannelConfigJson): string {
  return isFetchSuccess(detail) ? detail.channelId : TestRes.str('value_not_fetched');
}

function resultLogPrefix(detail: ChannelConfigJson): string {
  return isFetchSuccess(detail) ? successLogPrefix() : failureLogPrefix();
}

function resultLogSuffix(detail: ChannelConfigJson): string {
  return isFetchSuccess(detail) ? detail.channelId : detail.errorMessage;
}

function logResult(log: string, prefix: string): string {
  return log.substring(log.indexOf(prefix) + prefix.length);
}

async function openCustomConfigPage(session: UiTestSession): Promise<void> {
  await session.start();
  await session.openHomeEntry(TestRes.str('page_custom_config'), TestRes.str('btn_get_channel_id'));
}

/**
 * Real ViewModel orchestration tests for the custom config page.
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
        expect(await session.textOf(TestRes.str('page_custom_config'))).assertEqual(TestRes.str('page_custom_config'));
        expect(await session.textOf(TestRes.str('value_not_fetched'))).assertEqual(TestRes.str('value_not_fetched'));
        expect(await session.textOf(TestRes.str('status_uninitialized')))
          .assertEqual(TestRes.str('status_uninitialized'));
        expect(await session.textOf(TestRes.str('btn_get_channel_id'))).assertEqual(TestRes.str('btn_get_channel_id'));
        expect(await session.textOf(TestRes.str('btn_view_detail'))).assertEqual(TestRes.str('btn_view_detail'));
        expect(await session.textOf(TestRes.str('btn_reset'))).assertEqual(TestRes.str('btn_reset'));
        // aboutToAppear writes exactly one initialization log, so the page log count must equal it
        expect(await session.scrollTextOf(logCountLabel(1))).assertEqual(logCountLabel(1));
        expect(await session.scrollTextOf(TestRes.str('log_vm_initialized'), true))
          .assertContain(TestRes.str('log_vm_initialized'));
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
        await session.scrollClickText(TestRes.str('btn_get_channel_id'));
        // fetchChannelId always appends two logs "正在获取" and "结果", three in total with the initialization log
        expect(await session.scrollTextOf(logCountLabel(3))).assertEqual(logCountLabel(3));

        const detailText: string = await session.scrollTextOf('"channelId"', true);
        const detail: ChannelConfigJson = JSON.parse(detailText) as ChannelConfigJson;
        expect(detail.fetchCount).assertEqual(1);
        expect(detail.lastFetchTime).assertLarger(0);

        // The status label text is derived from detail.status, rather than probing the UI and self-comparing
        const expectedStatus: string = statusTextOf(detail.status);
        expect(await session.scrollTextOf(expectedStatus)).assertEqual(expectedStatus);
        expect(await session.textCount(statusTextOf(ChannelConfigStatus.UNINITIALIZED))).assertEqual(0);

        // The channel id field and the result log also take the detail model as the expected source
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
        await session.scrollClickText(TestRes.str('btn_get_channel_id'));
        await session.scrollClickText(TestRes.str('btn_view_detail'));
        expect(await session.scrollTextOf(TestRes.str('card_detail_title')))
          .assertEqual(TestRes.str('card_detail_title'));
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
        await session.scrollClickText(TestRes.str('btn_get_channel_id'));
        await session.scrollClickText(TestRes.str('btn_view_detail'));
        await session.scrollClickText(TestRes.str('btn_reset'));
        expect(await session.scrollTextOf(TestRes.str('value_not_fetched')))
          .assertEqual(TestRes.str('value_not_fetched'));
        expect(await session.scrollTextOf(TestRes.str('status_uninitialized')))
          .assertEqual(TestRes.str('status_uninitialized'));
        // resetState clears the log array first then writes "状态已重置", so the panel count must drop back to one,
        // which simultaneously proves both the initialization log and the fetch result logs have been cleared
        expect(await session.scrollTextOf(logCountLabel(1))).assertEqual(logCountLabel(1));
        expect(await session.scrollTextOf(TestRes.str('log_state_reset'), true))
          .assertContain(TestRes.str('log_state_reset'));

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
