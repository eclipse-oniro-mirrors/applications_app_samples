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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { describe, expect, it } from '@ohos/hypium';
import { BUNDLE, DOMAIN, TAG } from '../TestLog';

const WAIT_MS = 5000;
const EDITOR = 'staticPreviewEditor';
const SEND = 'previewAsync';
const FINISH = 'previewFinish';

async function openSample(): Promise<Driver> {
  await abilityDelegatorRegistry.getAbilityDelegator().startAbility({
    bundleName: BUNDLE,
    abilityName: 'EntryAbility'
  });
  return Driver.create();
}

async function runCase(name: string, body: () => Promise<void>): Promise<void> {
  hilog.info(DOMAIN, TAG, '%{public}s begin', name);
  try {
    await body();
  } finally {
    hilog.info(DOMAIN, TAG, '%{public}s end', name);
  }
}

export default function abilityTest(): void {
  describe('PreviewStyleSampleTest', () => {
    const open = `${BUNDLE}_OpenPreviewEditor_001`;
    const panel = `${BUNDLE}_ShowPreviewControls_002`;
    const preview = `${BUNDLE}_SendAndFinishPreview_003`;

    // 验证静态编辑框正常打开。
    it(open, 0, async () => runCase(open, async () => {
      const driver = await openSample();
      const editor = await driver.waitForComponent(ON.id(EDITOR), WAIT_MS);
      hilog.info(DOMAIN, TAG, 'Assert that the static editor is visible');
      expect(editor !== null).assertTrue();
    }));

    // 验证绑定后显示示例输入法及发送、结束按钮。
    it(panel, 0, async () => runCase(panel, async () => {
      const driver = await openSample();
      const editor = await driver.waitForComponent(ON.id(EDITOR), WAIT_MS);
      await editor.click();
      const send = await driver.waitForComponent(ON.id(SEND), WAIT_MS);
      const finish = await driver.waitForComponent(ON.id(FINISH), WAIT_MS);
      hilog.info(DOMAIN, TAG, 'Assert that the send and finish controls are visible');
      expect(send !== null).assertTrue();
      expect(finish !== null).assertTrue();
    }));

    // 验证收到预上屏文本，结束预上屏后保留文本。
    it(preview, 0, async () => runCase(preview, async () => {
      const driver = await openSample();
      const editor = await driver.waitForComponent(ON.id(EDITOR), WAIT_MS);
      const initial = await editor.getText();
      await editor.click();
      const send = await driver.waitForComponent(ON.id(SEND), WAIT_MS);
      await send.click();
      const expected = abilityDelegatorRegistry.getAbilityDelegator().getAppContext()
        .createModuleContext('entry_test').resourceManager.getStringByNameSync('preview_text');
      const received = await driver.waitForComponent(ON.id(EDITOR).text(expected), WAIT_MS);
      hilog.info(DOMAIN, TAG, 'Assert that the editor receives the preview text');
      expect(await received.getText()).assertEqual(expected);
      expect(initial === expected).assertFalse();
      const finish = await driver.waitForComponent(ON.id(FINISH), WAIT_MS);
      await finish.click();
      const committed = await driver.waitForComponent(ON.id(EDITOR).text(expected), WAIT_MS);
      hilog.info(DOMAIN, TAG, 'Assert that the editor retains the committed text');
      expect(await committed.getText()).assertEqual(expected);
    }));
  });
}
