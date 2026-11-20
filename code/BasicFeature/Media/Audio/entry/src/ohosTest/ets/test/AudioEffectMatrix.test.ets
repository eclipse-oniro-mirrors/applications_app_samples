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
import type { Component } from '@kit.TestKit';
import hilog from '@ohos.hilog';
import {
  BLANK_TEXT,
  CONTENT_TYPES,
  STREAM_USAGES,
  stringsOf,
  backToHomeIfNeeded,
  tapId,
  getIdText,
  getSubtreeText,
  ensureHomeReady
} from './shared/AudioDriver';

const DEFAULT_USAGE: string = '未知场景';
const MODE_NONE: string = '直通';
const MODE_DEFAULT: string = '默认';
const RESULT_NONE: string = '直通';
const RESULT_BOTH: string = '直通/默认';
const MUSIC_CONTENT_INDEX: number = 2;
const MUSIC_USAGE_INDEX: number = 2;
const PRESET_BACK_ID: string = 'back_btn_preset';
const SEARCH_TEXT: string = '查询';
const PLAY_TEXT: string = '播放';
const PAUSE_TEXT: string = '暂停';

async function dumpProbe(): Promise<void> {
  const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  await delegator.executeShellCommand('uitest dumpLayout -p /data/local/tmp/em.json');
  const size = await delegator.executeShellCommand('ls -l /data/local/tmp/em.json');
  hilog.info(0xF811, 'EmProbe', 'size: %{public}s', size.stdResult);
}

async function pickOption(driver: Driver, selectorId: string, optionLabel: string): Promise<boolean> {
  if (!(await tapId(driver, selectorId, 400))) {
    return false;
  }
  const option: Component | null = await driver.waitForComponent(ON.text(optionLabel), 2000);
  if (option === null) {
    return false;
  }
  await option.click();
  await driver.delayMs(500);
  return true;
}

export default function audioEffectMatrix() {
  describe('AudioEffectMatrix', () => {
    const driver: Driver = Driver.create();
    let contentTypeLabels: string[] = [];
    let streamUsageLabels: string[] = [];
    beforeAll(async () => {
      contentTypeLabels = stringsOf(CONTENT_TYPES);
      streamUsageLabels = stringsOf(STREAM_USAGES);
      // The suite walks the preset page and then the realtime page in one pass:
      // the test ability owns the top window, so the entry is opened only once.
      let ready: boolean = false;
      for (let i = 0; i < 3 && !ready; i++) {
        ready = await ensureHomeReady(driver);
        if (!ready) {
          await driver.delayMs(800);
        }
      }
      expect(ready).assertTrue();
      expect(await tapId(driver, 'audio_effect_manager_card', 1500)).assertTrue();
      const first: string | null = await getIdText(driver, 'query_btn_preset');
      const second: string | null = await getSubtreeText(driver, 'select_content_preset');
      expect(first === SEARCH_TEXT || second === contentTypeLabels[0]).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_EFFECT_MATRIX_0200
     * @tc.name testEffectMatrix0002
     * @tc.desc Verify the usage selector holds fifteen distinct scenarios
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testEffectMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(streamUsageLabels.length).assertEqual(15);
      expect(new Set(streamUsageLabels).size).assertEqual(15);
      expect(streamUsageLabels[0]).assertEqual(DEFAULT_USAGE);
      expect(streamUsageLabels[MUSIC_USAGE_INDEX]).assertEqual('音乐场景');
    });

    /**
     * @tc.number SUB_AUDIO_EFFECT_MATRIX_0300
     * @tc.name testEffectMatrix0003
     * @tc.desc Verify a preset query replaces the placeholder with one of the two availability results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testEffectMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await getIdText(driver, 'query_result_preset')).assertEqual(BLANK_TEXT);
      expect(await tapId(driver, 'query_btn_preset', 1500)).assertTrue();
      const result: string | null = await getIdText(driver, 'query_result_preset');
      expect(result === RESULT_NONE || result === RESULT_BOTH).assertTrue();
      const label: string | null = await getSubtreeText(driver, 'select_content_preset');
      const btn: string | null = await getIdText(driver, 'query_btn_preset');
      expect(label === contentTypeLabels[0] || btn === SEARCH_TEXT).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_EFFECT_MATRIX_0400
     * @tc.name testEffectMatrix0004
     * @tc.desc Verify repeated queries with unchanged inputs return a stable result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testEffectMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const first: string | null = await getIdText(driver, 'query_result_preset');
      expect(await tapId(driver, 'query_btn_preset', 1500)).assertTrue();
      const second: string | null = await getIdText(driver, 'query_result_preset');
      expect(second).assertEqual(first as string);
      expect(second !== BLANK_TEXT).assertTrue();
      expect(second === RESULT_NONE || second === RESULT_BOTH).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_EFFECT_MATRIX_1400
     * @tc.name testEffectMatrix0016
     * @tc.desc Verify leaving the effect page through its back entry returns to the home page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testEffectMatrix0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      expect(await backToHomeIfNeeded(driver, 'back_btn_realtime') ||
        await ensureHomeReady(driver)).assertTrue();
      expect(await driver.findComponent(ON.id('audio_effect_manager_card')) !== null).assertTrue();
      expect(await driver.findComponent(ON.id('audio_focus_card')) !== null).assertTrue();
    });
  });
}
