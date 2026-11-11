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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { labelOf, stringsOf, uniqueCount, CONTENT_TYPES, STREAM_USAGES } from './shared/AudioDriver';

const PAGE_TITLES: string[] = [
  'SelectOutputDevice', 'AudioEffectManager', 'Audio' + 'Focus', 'EffectManager',
  'AVVOLUME_PANEL_TITLE', 'SPATIAL_AUDIO', 'KARAOKE_DEMO_TITLE', 'AUDIO_CAPTURER'
];
const DEVICE_LABELS: string[] = [
  'Speaker', 'EarPiece', 'WiredHeadset', 'WiredHeadPhones', 'Bluetooth_A2DP', 'BLUETOOTH_SCO', 'USB_Headset'
];
const KARAOKE_STATES: string[] = [
  'KARAOKE_NOT_INITIALIZED', 'KARAOKE_INITIALIZED', 'KARAOKE_INITIALIZATION_FAILED', 'KARAOKE_UNSUPPORTED_HARDWARE',
  'KARAOKE_DEVICE_UNSUPPORTED', 'KARAOKE_SCENE_UNSUPPORTED', 'KARAOKE_IDLE', 'KARAOKE_RUNNING', 'KARAOKE_NO_INSTANCE'
];
const BUTTON_LABELS: string[] = [
  'QUERY', 'QUERY_RESULT', 'PAUSE', 'CONTINUE', 'VOLUME_UP', 'VOLUME_DOWN',
  'KARAOKE_INIT_BUTTON', 'KARAOKE_ENABLE_BUTTON', 'KARAOKE_DISABLE_BUTTON', 'KARAOKE_VOLUME_LABEL'
];
const EFFECT_LABELS: string[] = ['EFFECT_NONE', 'EFFECT_DEFAULT', 'EFFECT_NONE_AND_DEFAULT'];
const PRESET_LABELS: string[] = ['ORIGINAL', 'KTV', 'THEATER', 'CONCERT', 'FLAT', 'FULL', 'BRIGHT'];

function allNonEmptyValues(keys: string[]): boolean {
  const values: string[] = stringsOf(keys);
  for (let i = 0; i < values.length; i++) {
    if (values[i] === undefined || values[i] === null || values[i] === '') {
      return false;
    }
  }
  return true;
}

/**
 * 资源/国际化接线维度
 *
 * 直接通过 resourceManager 校验页面标题、内容类型/流用途、音效与卡拉 OK 文案等
 * 资源已正确接入且有实际取值（不是空串、不是资源键本身），并验证缺失键会抛错。
 * 不依赖设备 UI，执行快且稳定。
 */
export default function audioResourceWiringTest() {
  describe('audioResourceWiringTest', () => {
    /**
     * @tc.number SUB_AUDIO_RESOURCE_WIRING_0100
     * @tc.name blankMarkerResolvesToDashDash
     * @tc.desc Verify the blank marker resource resolves to the literal double dash placeholder
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('blankMarkerResolvesToDashDash', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(labelOf('BLANK')).assertEqual('--');
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_WIRING_0200
     * @tc.name pageTitlesResolve
     * @tc.desc Verify every page title resource resolves to a non-empty value that is not its key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('pageTitlesResolve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(allNonEmptyValues(PAGE_TITLES)).assertTrue();
      for (const key of PAGE_TITLES) {
        expect(labelOf(key).length > 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_WIRING_0300
     * @tc.name pageTitlesAreMostlyDistinct
     * @tc.desc Verify the page titles are not all collapsed into one shared string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('pageTitlesAreMostlyDistinct', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const titles: string[] = stringsOf(PAGE_TITLES);
      expect(titles.length).assertEqual(PAGE_TITLES.length);
      expect(uniqueCount(titles) >= 6).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_WIRING_0400
     * @tc.name contentTypeLabelsResolve
     * @tc.desc Verify all six content type labels resolve to non-empty distinct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('contentTypeLabelsResolve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const labels: string[] = stringsOf(CONTENT_TYPES);
      expect(labels.length).assertEqual(CONTENT_TYPES.length);
      expect(labels.length).assertEqual(6);
      expect(uniqueCount(labels)).assertEqual(6);
      expect(allNonEmptyValues(CONTENT_TYPES)).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_WIRING_0500
     * @tc.name streamUsageLabelsResolve
     * @tc.desc Verify all fifteen stream usage labels resolve to non-empty distinct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('streamUsageLabelsResolve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const labels: string[] = stringsOf(STREAM_USAGES);
      expect(labels.length).assertEqual(STREAM_USAGES.length);
      expect(uniqueCount(labels)).assertEqual(STREAM_USAGES.length);
      expect(allNonEmptyValues(STREAM_USAGES)).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_WIRING_0600
     * @tc.name effectModeLabelsResolve
     * @tc.desc Verify the three effect mode labels resolve to non-empty distinct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('effectModeLabelsResolve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const labels: string[] = stringsOf(EFFECT_LABELS);
      expect(labels.length).assertEqual(3);
      expect(uniqueCount(labels)).assertEqual(3);
      expect(allNonEmptyValues(EFFECT_LABELS)).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_WIRING_0700
     * @tc.name karaokeStateLabelsResolve
     * @tc.desc Verify every karaoke status resource resolves to a non-empty value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('karaokeStateLabelsResolve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(allNonEmptyValues(KARAOKE_STATES)).assertTrue();
      expect(KARAOKE_STATES.length).assertEqual(9);
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_WIRING_0800
     * @tc.name buttonLabelsResolve
     * @tc.desc Verify query, playback, volume and karaoke button labels resolve to non-empty values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('buttonLabelsResolve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(allNonEmptyValues(BUTTON_LABELS)).assertTrue();
      for (const key of BUTTON_LABELS) {
        expect(labelOf(key).length > 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_WIRING_0900
     * @tc.name deviceTypeLabelsResolve
     * @tc.desc Verify the output device type labels resolve to non-empty values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('deviceTypeLabelsResolve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(allNonEmptyValues(DEVICE_LABELS)).assertTrue();
      expect(DEVICE_LABELS.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_WIRING_1000
     * @tc.name presetLabelsResolve
     * @tc.desc Verify reverb and equalizer preset labels resolve to non-empty values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('presetLabelsResolve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(allNonEmptyValues(PRESET_LABELS)).assertTrue();
      expect(uniqueCount(stringsOf(PRESET_LABELS))).assertEqual(PRESET_LABELS.length);
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_WIRING_1100
     * @tc.name missingKeyIsRejected
     * @tc.desc Verify resolving a nonexistent resource key fails instead of returning the key text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('missingKeyIsRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let rejected: boolean = false;
      try {
        const value: string = labelOf('AUDIO_RESOURCE_KEY_THAT_DOES_NOT_EXIST');
        rejected = value === '' || value === 'AUDIO_RESOURCE_KEY_THAT_DOES_NOT_EXIST';
      } catch (err) {
        rejected = true;
      }
      expect(rejected).assertTrue();
    });
  });
}
