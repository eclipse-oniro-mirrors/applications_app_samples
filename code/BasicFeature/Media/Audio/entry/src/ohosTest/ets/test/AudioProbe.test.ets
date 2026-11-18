/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import type { Component, UiWindow } from '@kit.TestKit';
import hilog from '@ohos.hilog';
import {
  HOME_ID,
  backToHomeIfNeeded,
  bringHomeToFront,
  tapId,
  getIdText,
  existsInWindow,
  ensureHomeReady
} from './shared/AudioDriver';

const TAG: string = 'AudioProbe';

async function dumpStage(driver: Driver, tag: string): Promise<void> {
  const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  const dump = await delegator.executeShellCommand('uitest dumpLayout -p /data/local/tmp/pd.json');
  const ids =
    await delegator.executeShellCommand('grep -o "\\"id\\":\\"[^\\"]*\\"" /data/local/tmp/pd.json | head -30');
  log(tag + ' dump:' + dump.stdResult + ' ids:' + ids.stdResult);
}

function log(msg: string): void {
  hilog.info(0xF811, TAG, '%{public}s', msg);
}

export default function audioProbe() {
  describe('AudioProbe', () => {
    const driver: Driver = Driver.create();
    beforeAll(async () => {
      await ensureHomeReady(driver);
    });

    /**
     * @tc.number SUB_AUDIO_PROBE_0100
     * @tc.name testProbe0001
     * @tc.desc Probe the home bring-up path used by the UI suites
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testProbe0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const a: boolean = await bringHomeToFront(driver);
      log('probe bring home: ' + String(a));
      const b: boolean = await backToHomeIfNeeded(driver, 'back_btn_preset');
      log('probe backToHome: ' + String(b));
      const c: boolean = await tapId(driver, 'audio_effect_manager_card');
      log('probe tap effect card: ' + String(c));
      const d: string | null = await getIdText(driver, 'query_btn_preset');
      log('probe query btn text: ' + String(d));
      expect(a).assertTrue();
      expect(b).assertTrue();
      expect(c).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_PROBE_0200
     * @tc.name testProbe0002
     * @tc.desc Probe the second iteration of the same home bring-up path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testProbe0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const found: boolean = await existsInWindow(driver, 'back_btn_preset');
      log('probe2 back btn in any window: ' + String(found));
      const backText: string | null = await getIdText(driver, 'back_btn_preset');
      log('probe2 back btn text: ' + String(backText));
      const w: UiWindow | null = await driver.findWindow({ bundleName: 'com.samples.audio' });
      log('probe2 window: ' + String(w !== null) + ' active: ' + String(w === null ? '' : await w.isActive()));
      const hw: UiWindow | null = await driver.findWindow({ bundleName: 'com.ohos.launcher' });
      log('probe2 launcher window: ' + String(hw !== null) + ' active: ' +
        String(hw === null ? '' : await hw.isActive()));
      const back: Component | null = await driver.findComponent(ON.id('back_btn_preset'));
      let backInfo: string = 'null';
      if (back !== null) {
        try {
          const r = await back.getBounds();
          backInfo = JSON.stringify(r) + ' enabled:' + String(await back.isEnabled());
        } catch (err) {
          backInfo = 'bounds failed ' + JSON.stringify(err);
        }
      }
      log('probe2 back info: ' + backInfo);
      const tapResult: boolean = await tapId(driver, 'back_btn_preset');
      log('probe2 tap back id: ' + String(tapResult));
      const homeAfterTap: boolean = await existsInWindow(driver, HOME_ID);
      log('probe2 home after tap: ' + String(homeAfterTap));
      const homeFound: boolean = await existsInWindow(driver, HOME_ID);
      log('probe2 home in any window: ' + String(homeFound));
      const b: boolean = await backToHomeIfNeeded(driver, 'back_btn_preset');
      log('probe2 backToHome: ' + String(b));
      const c: boolean = await tapId(driver, 'audio_effect_manager_card');
      log('probe2 tap effect card: ' + String(c));
      const d: string | null = await getIdText(driver, 'query_btn_preset');
      log('probe2 query btn text: ' + String(d));
      const home: Component | null = await driver.findComponent(ON.id(HOME_ID));
      log('probe2 home visible: ' + String(home !== null));
      expect(b).assertTrue();
      expect(c).assertTrue();
      expect(d !== null).assertTrue();
    });
  });
}
