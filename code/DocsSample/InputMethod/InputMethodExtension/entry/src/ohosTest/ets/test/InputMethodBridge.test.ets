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
import { StorageKeys } from '../../../main/ets/common/AppConstants';
import { LogItem, LogLevel, queryLogs } from '../../../main/ets/model/LogStore';
import { KeyboardBridge } from '../../../main/ets/utils/KeyboardBridge';
import { KEYBOARD_PAGE_PATH, PanelController, panelController } from '../../../main/ets/utils/PanelController';
import { Logger } from '../../../main/ets/utils/Logger';

/** 桥接层写日志用的 source，与被测模块内部保持一致 */
const BRIDGE_SOURCE: string = '键盘';
/** 没有 InputClient 时的状态文案：页面靠它说明"这是壳外预览" */
const PREVIEW_STATUS: string = '未连接编辑框（壳外预览）';
/** detach 之后的状态文案 */
const DETACHED_STATUS: string = '编辑框已解绑，回到壳外预览';
/** 面板控制器尚未创建面板时的状态文案 */
const PANEL_IDLE_STATUS: string = '尚未创建面板';

function storedLogs(): LogItem[] {
  return AppStorage.get<LogItem[]>(StorageKeys.APP_LOGS) ?? [];
}

/**
 * KeyboardBridge 与 PanelController 的空状态。
 *
 * 这两个模块的真实对端只在"本应用被系统拉起为输入法"之后才存在：前者要 InputClient，
 * 后者要 InputMethodExtensionAbility 进程。自动化环境里两者都拿不到，所以这里可复核的
 * 不是成功路径，而是**没有对端时它们不许假装成功**：
 * KeyboardBridge 必须返回 false（不能报"已上屏"），PanelController 必须停在空壳、
 * destroyPanel 可安全重入。这两条一旦反转，页面就会出现"已上屏""面板已就绪"这类假成功，
 * 而这正是输入法示例最不能出的问题。真实上屏与真实建面板需要启用输入法后手工复验。
 */
export default function inputMethodBridgeTest() {
  describe('InputMethodBridgeTest', () => {
    /**
     * @tc.number SUB_INPUT_METHOD_BRIDGE_0100
     * @tc.name testBridge0001
     * @tc.desc Verify the keyboard bridge starts without a client so the page shows the preview wording.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBridge0001', 0, async (done: Function) => {
      expect(KeyboardBridge.hasClient()).assertFalse();
      expect(KeyboardBridge.statusText()).assertEqual(PREVIEW_STATUS);
      // 没有编辑框时如实返回 false，页面因此走预览分支而不是假装上屏成功
      expect(await KeyboardBridge.insertText('中')).assertFalse();
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_BRIDGE_0200
     * @tc.name testBridge0002
     * @tc.desc Verify insertText and deleteBackward report false when no client is attached instead of faking success.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBridge0002', 0, async (done: Function) => {
      expect(KeyboardBridge.hasClient()).assertFalse();
      expect(await KeyboardBridge.insertText('abc')).assertFalse();
      expect(await KeyboardBridge.deleteBackward(1)).assertFalse();
      expect(KeyboardBridge.hasClient()).assertFalse();
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_BRIDGE_0300
     * @tc.name testBridge0003
     * @tc.desc Verify the false result comes from the missing client rather than from the payload being empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBridge0003', 0, async (done: Function) => {
      expect(await KeyboardBridge.insertText('')).assertFalse();
      expect(await KeyboardBridge.deleteBackward(0)).assertFalse();
      expect(await KeyboardBridge.insertText('中文😀')).assertFalse();
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_BRIDGE_0400
     * @tc.name testBridge0004
     * @tc.desc Verify detach brings the status back to the preview wording and keeps writes rejected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBridge0004', 0, async (done: Function) => {
      KeyboardBridge.detach();
      expect(KeyboardBridge.statusText()).assertEqual(DETACHED_STATUS);
      expect(KeyboardBridge.hasClient()).assertFalse();
      expect(await KeyboardBridge.insertText('x')).assertFalse();
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_BRIDGE_0500
     * @tc.name testBridge0005
     * @tc.desc Verify calling detach twice leaves one stable status, so inputStop arriving twice cannot break the page.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBridge0005', 0, () => {
      KeyboardBridge.detach();
      const once: string = KeyboardBridge.statusText();
      KeyboardBridge.detach();
      expect(KeyboardBridge.statusText()).assertEqual(once);
      expect(KeyboardBridge.statusText()).assertEqual(DETACHED_STATUS);
      expect(KeyboardBridge.hasClient()).assertFalse();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_BRIDGE_0600
     * @tc.name testBridge0006
     * @tc.desc Verify one detach produces exactly one inputStop log that the log panel filter can find again.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBridge0006', 0, () => {
      Logger.clear();
      KeyboardBridge.detach();
      const logs: LogItem[] = storedLogs();
      expect(logs.length).assertEqual(1);
      expect(logs[0].source).assertEqual(BRIDGE_SOURCE);
      expect(logs[0].tag).assertEqual('inputStop');
      expect(logs[0].detail).assertEqual(DETACHED_STATUS);
      expect(logs[0].level).assertEqual(LogLevel.INFO);
      expect(queryLogs(logs, BRIDGE_SOURCE, LogLevel.INFO, 'inputStop', 10).length).assertEqual(1);
      expect(Logger.count(BRIDGE_SOURCE, 'inputStop')).assertEqual(1);
      Logger.clear();
      expect(storedLogs().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_BRIDGE_0700
     * @tc.name testBridge0007
     * @tc.desc Verify the shared panel controller reports no panel and the idle wording before any createPanel.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBridge0007', 0, () => {
      expect(panelController.hasPanel()).assertFalse();
      expect(panelController.statusText()).assertEqual(PANEL_IDLE_STATUS);
      // 无面板时状态文案不能说成“已挂载”，否则页面会以为面板在屏幕上
      expect(panelController.statusText().includes('已挂载')).assertFalse();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_BRIDGE_0800
     * @tc.name testBridge0008
     * @tc.desc Verify destroyPanel is a safe no-op when no panel exists and does not move the status forward.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBridge0008', 0, async (done: Function) => {
      await panelController.destroyPanel();
      expect(panelController.hasPanel()).assertFalse();
      expect(panelController.statusText()).assertEqual(PANEL_IDLE_STATUS);
      await panelController.destroyPanel();
      expect(panelController.statusText()).assertEqual(PANEL_IDLE_STATUS);
      expect(panelController.statusText().includes('已销毁')).assertFalse();
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_BRIDGE_0900
     * @tc.name testBridge0009
     * @tc.desc Verify the panel page path keeps the form setUiContent expects: no suffix, no leading
     * slash, no backslash.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBridge0009', 0, () => {
      expect(KEYBOARD_PAGE_PATH).assertEqual('inputmethodextensionability/pages/KeyboardPage');
      expect(KEYBOARD_PAGE_PATH.endsWith('KeyboardPage')).assertTrue();
      expect(KEYBOARD_PAGE_PATH.includes('/pages/')).assertTrue();
      expect(KEYBOARD_PAGE_PATH.startsWith('/')).assertFalse();
      expect(KEYBOARD_PAGE_PATH.includes('.ets')).assertFalse();
      expect(KEYBOARD_PAGE_PATH.includes('\\')).assertFalse();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_BRIDGE_1000
     * @tc.name testBridge0010
     * @tc.desc Verify the module exports one shared controller, so the ability and the keyboard page read
     * the same state.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBridge0010', 0, () => {
      expect(panelController instanceof PanelController).assertTrue();
      const fresh: PanelController = new PanelController();
      expect(fresh.hasPanel()).assertFalse();
      expect(fresh.statusText()).assertEqual(PANEL_IDLE_STATUS);
      expect(panelController === fresh).assertFalse();
    });
  });
}
