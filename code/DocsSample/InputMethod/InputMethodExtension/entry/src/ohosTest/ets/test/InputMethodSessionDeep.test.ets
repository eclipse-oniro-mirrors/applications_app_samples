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
import { EXTRA_CONFIG_MAX_BYTES } from '../../../main/ets/common/AppConstants';
import { buildExtraConfig, configByteLength, defaultEntries } from '../../../main/ets/model/ExtraConfigModel';
import { ApiStatus, CallOutcome } from '../../../main/ets/model/CallOutcome';
import {
  buildDefaultOutcome,
  defaultOutcomes,
  nearLimitOutcome,
  oversizedOutcome,
  readAbsentOutcome,
  readStubOutcome,
  roundTripOutcome
} from '../../../main/ets/utils/ExtraConfigSession';
import { KEYBOARD_PAGE_PATH, PanelController } from '../../../main/ets/utils/PanelController';
import { KeyboardBridge } from '../../../main/ets/utils/KeyboardBridge';

/**
 * 会话与运行时状态：扩展信息的六个演示结果、面板控制器与键盘通道的空状态。
 *
 * 这两层都在 UIAbility 进程里跑，不碰系统面板也不碰真实编辑框，
 * 所以可以在自动化里直接断言「没有客户端时绝不伪造成功」这条约定。
 */
export default function inputMethodSessionDeepTest() {
  describe('InputMethodSessionDeepTest', () => {
    /**
     * @tc.number SUB_INPUT_METHOD_SESS_0100
     * @tc.name testSessionDeep0001
     * @tc.desc Verify the session summary is derived from the model byte count rather than a copied constant.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSessionDeep0001', 0, () => {
      const expectedBytes = configByteLength(buildExtraConfig(defaultEntries()));
      const outcome = buildDefaultOutcome();
      expect(outcome.summary).assertEqual(`4 个键，${expectedBytes} 字节`);
      expect(outcome.isOk()).assertTrue();
      expect(outcome.durationMs >= 0).assertTrue();
      expect(outcome.code).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_SESS_0200
     * @tc.name testSessionDeep0002
     * @tc.desc Verify the detail line lists every demo key with its type so the page can show what was written.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSessionDeep0002', 0, () => {
      const detail = buildDefaultOutcome().describeDetail();
      expect(detail.includes('theme.color = #0A59F7（string）')).assertTrue();
      expect(detail.includes('candidate.limit = 8（number）')).assertTrue();
      expect(detail.includes('JSON 共')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_SESS_0300
     * @tc.name testSessionDeep0003
     * @tc.desc Verify the stub read path reports four entries in sorted key order, not in write order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSessionDeep0003', 0, () => {
      const outcome = readStubOutcome();
      expect(outcome.isOk()).assertTrue();
      expect(outcome.summary).assertEqual('4 项');
      const detail = outcome.describeDetail();
      expect(detail.indexOf('candidate.limit') < detail.indexOf('theme.color')).assertTrue();
      expect(detail.includes('voice.enabled')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_SESS_0400
     * @tc.name testSessionDeep0004
     * @tc.desc Verify an editor without extraConfig reports zero entries and does not invent defaults.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSessionDeep0004', 0, () => {
      const outcome = readAbsentOutcome();
      expect(outcome.isOk()).assertTrue();
      expect(outcome.summary.includes('0 项')).assertTrue();
      expect(outcome.describeDetail().includes('StubEditorAttribute')).assertTrue();
      expect(outcome.describeDetail().includes('空')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_SESS_0500
     * @tc.name testSessionDeep0005
     * @tc.desc Verify the padded configuration lands exactly on the documented ceiling and is reported as inside.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSessionDeep0005', 0, () => {
      const outcome = nearLimitOutcome();
      expect(outcome.isOk()).assertTrue();
      expect(outcome.summary).assertEqual(`${EXTRA_CONFIG_MAX_BYTES} 字节，未越界`);
      expect(outcome.describeDetail().includes('32768')).assertTrue();
      expect(outcome.describeDetail().includes('32KB')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_SESS_0600
     * @tc.name testSessionDeep0006
     * @tc.desc Verify one byte over the ceiling is reported as an input problem with the documented truncation note.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSessionDeep0006', 0, () => {
      const outcome = oversizedOutcome();
      expect(outcome.isOk()).assertFalse();
      expect(outcome.status).assertEqual(ApiStatus.INVALID_INPUT);
      expect(outcome.code).assertEqual(401);
      expect(outcome.summary).assertEqual('超出 1 字节');
      expect(outcome.describeDetail().includes('不传递')).assertTrue();
      expect(outcome.describe().includes('（401）')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_SESS_0700
     * @tc.name testSessionDeep0007
     * @tc.desc Verify the json round trip keeps the payload identical
     * while the detail line stays short enough for the card.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSessionDeep0007', 0, () => {
      const outcome = roundTripOutcome();
      expect(outcome.isOk()).assertTrue();
      expect(outcome.summary.includes('内容一致')).assertTrue();
      const detail = outcome.describeDetail();
      expect(detail.startsWith('原文 {')).assertTrue();
      expect(detail.endsWith('…')).assertTrue();
      expect(detail.length <= 84).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_SESS_0800
     * @tc.name testSessionDeep0008
     * @tc.desc Verify the six default results keep the button order so the page and the report line up.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSessionDeep0008', 0, () => {
      const outcomes = defaultOutcomes();
      expect(outcomes.length).assertEqual(6);
      expect(outcomes[0].api).assertEqual('buildExtraConfig');
      expect(outcomes[1].api).assertEqual('readExtraConfig');
      expect(outcomes[3].api).assertEqual('paddedEntries');
      expect(outcomes[5].api).assertEqual('configFromJson');
      expect(outcomes.every((item: CallOutcome) => item.describe().includes('→'))).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_SESS_0900
     * @tc.name testSessionDeep0009
     * @tc.desc Verify only the oversized case fails, so a green list on the page really means five local checks passed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSessionDeep0009', 0, () => {
      const statuses = defaultOutcomes().map((item: CallOutcome) => item.status);
      expect(statuses[0]).assertEqual(ApiStatus.OK);
      expect(statuses[1]).assertEqual(ApiStatus.OK);
      expect(statuses[2]).assertEqual(ApiStatus.OK);
      expect(statuses[3]).assertEqual(ApiStatus.OK);
      expect(statuses[4]).assertEqual(ApiStatus.INVALID_INPUT);
      expect(statuses[5]).assertEqual(ApiStatus.OK);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_SESS_1000
     * @tc.name testSessionDeep0010
     * @tc.desc Verify every result carries a non negative duration so the page never renders a negative cost.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSessionDeep0010', 0, () => {
      const outcomes = defaultOutcomes();
      expect(outcomes.every((item: CallOutcome) => item.durationMs >= 0)).assertTrue();
      expect(outcomes[4].durationMs >= 0).assertTrue();
      expect(outcomes[0].code).assertEqual(0);
    });
  });

  describe('InputMethodRuntimeStateTest', () => {
    /**
     * @tc.number SUB_INPUT_METHOD_RUNTIME_0100
     * @tc.name testSessionDeep0011
     * @tc.desc Verify a fresh controller reports no panel and the declared placeholder status.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSessionDeep0011', 0, () => {
      const controller = new PanelController();
      expect(controller.hasPanel()).assertFalse();
      expect(controller.statusText()).assertEqual('尚未创建面板');
      expect(controller.hasPanel()).assertFalse();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_RUNTIME_0200
     * @tc.name testSessionDeep0012
     * @tc.desc Verify destroying before creating is a no-op that keeps the placeholder status instead of throwing.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSessionDeep0012', 0, async (done: Function) => {
      const controller = new PanelController();
      await controller.destroyPanel();
      expect(controller.hasPanel()).assertFalse();
      expect(controller.statusText()).assertEqual('尚未创建面板');
      // 没创建过就销毁，不应该把状态刷成“已销毁”
      expect(controller.statusText() === '面板已销毁').assertFalse();
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_RUNTIME_0300
     * @tc.name testSessionDeep0013
     * @tc.desc Verify two controller instances keep their own state,
     * so the extension process and a test do not interfere.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSessionDeep0013', 0, () => {
      const first = new PanelController();
      const second = new PanelController();
      expect(first.hasPanel()).assertFalse();
      expect(second.hasPanel()).assertFalse();
      expect(first.statusText()).assertEqual(second.statusText());
      expect(first === second).assertFalse();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_RUNTIME_0400
     * @tc.name testSessionDeep0014
     * @tc.desc Verify the panel page path matches the registered page style: no suffix and under the extension folder.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSessionDeep0014', 0, () => {
      expect(KEYBOARD_PAGE_PATH).assertEqual('inputmethodextensionability/pages/KeyboardPage');
      expect(KEYBOARD_PAGE_PATH.startsWith('inputmethodextensionability/')).assertTrue();
      expect(KEYBOARD_PAGE_PATH.includes('/pages/')).assertTrue();
      expect(KEYBOARD_PAGE_PATH.endsWith('.ets')).assertFalse();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_RUNTIME_0500
     * @tc.name testSessionDeep0015
     * @tc.desc Verify the keyboard channel starts unconnected and says so, which is the normal state outside IME.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSessionDeep0015', 0, () => {
      expect(KeyboardBridge.hasClient()).assertFalse();
      expect(KeyboardBridge.statusText().includes('未连接')).assertTrue();
      expect(KeyboardBridge.statusText().includes('壳外预览')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_RUNTIME_0600
     * @tc.name testSessionDeep0016
     * @tc.desc Verify insertText reports false instead of pretending the editor accepted the text.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSessionDeep0016', 0, async (done: Function) => {
      const accepted = await KeyboardBridge.insertText('ni');
      expect(accepted).assertFalse();
      expect(KeyboardBridge.hasClient()).assertFalse();
      expect(KeyboardBridge.statusText().includes('已连接')).assertFalse();
      done();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_RUNTIME_0700
     * @tc.name testSessionDeep0017
     * @tc.desc Verify deleteBackward also reports false and leaves the status text untouched.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSessionDeep0017', 0, async (done: Function) => {
      const before = KeyboardBridge.statusText();
      const accepted = await KeyboardBridge.deleteBackward(1);
      expect(accepted).assertFalse();
      expect(KeyboardBridge.statusText()).assertEqual(before);
      expect(KeyboardBridge.hasClient()).assertFalse();
      done();
    });
  });
}
