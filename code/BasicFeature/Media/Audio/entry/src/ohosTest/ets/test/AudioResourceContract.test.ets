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

/**
 * 资源契约（设备无关）
 *
 * 校验资源值之间的可区分性与 stringsOf / labelOf 的稳定行为：页面标题不等于键名、
 * 同类文案互不相同、顺序与查表一致、重复键/空表行为、重复读取稳定、批量非空白。
 * 纯资源读取，不依赖 UiTest 与音频硬件，执行快且不会超时。
 */
export default function audioResourceContractTest() {
  describe('audioResourceContractTest', () => {
    /**
     * @tc.number SUB_AUDIO_RESOURCE_CONTRACT_0100
     * @tc.name pageTitlesDifferFromKeys
     * @tc.desc Verify each page title resolves to a localized value that is not the raw resource key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('pageTitlesDifferFromKeys', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      for (const key of PAGE_TITLES) {
        const value: string = labelOf(key);
        expect(value.length > 0).assertTrue();
        expect(value === key).assertFalse();
      }
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_CONTRACT_0200
     * @tc.name volumeUpDownLabelsDiffer
     * @tc.desc Verify the volume up and down labels are non-empty and distinct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('volumeUpDownLabelsDiffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const up: string = labelOf('VOLUME_UP');
      const down: string = labelOf('VOLUME_DOWN');
      expect(up.length > 0).assertTrue();
      expect(down.length > 0).assertTrue();
      expect(up === down).assertFalse();
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_CONTRACT_0300
     * @tc.name pauseContinueLabelsDiffer
     * @tc.desc Verify the pause and continue labels are non-empty and distinct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('pauseContinueLabelsDiffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pause: string = labelOf('PAUSE');
      const cont: string = labelOf('CONTINUE');
      expect(pause.length > 0).assertTrue();
      expect(cont.length > 0).assertTrue();
      expect(pause === cont).assertFalse();
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_CONTRACT_0400
     * @tc.name karaokeStateLabelsDistinct
     * @tc.desc Verify all nine karaoke status labels are non-empty and mutually distinct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('karaokeStateLabelsDistinct', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const labels: string[] = stringsOf(KARAOKE_STATES);
      expect(labels.length).assertEqual(9);
      expect(uniqueCount(labels)).assertEqual(9);
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_CONTRACT_0500
     * @tc.name deviceLabelsDistinct
     * @tc.desc Verify all seven device type labels resolve to distinct non-empty values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('deviceLabelsDistinct', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const labels: string[] = stringsOf(DEVICE_LABELS);
      expect(labels.length).assertEqual(7);
      expect(uniqueCount(labels)).assertEqual(7);
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_CONTRACT_0600
     * @tc.name stringsOfPreservesOrder
     * @tc.desc Verify stringsOf returns values in the same order as the requested keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('stringsOfPreservesOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const values: string[] = stringsOf(CONTENT_TYPES);
      expect(values.length).assertEqual(CONTENT_TYPES.length);
      for (let i = 0; i < CONTENT_TYPES.length; i++) {
        expect(values[i]).assertEqual(labelOf(CONTENT_TYPES[i]));
      }
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_CONTRACT_0700
     * @tc.name stringsOfDuplicateKeys
     * @tc.desc Verify duplicate keys yield duplicate values without collapsing the list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('stringsOfDuplicateKeys', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const values: string[] = stringsOf(['PAUSE', 'PAUSE', 'PAUSE']);
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(values[1]);
      expect(values[1]).assertEqual(values[2]);
      expect(values[0]).assertEqual(labelOf('PAUSE'));
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_CONTRACT_0800
     * @tc.name stringsOfEmptyList
     * @tc.desc Verify an empty key list resolves to an empty value list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('stringsOfEmptyList', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(stringsOf([]).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_CONTRACT_0900
     * @tc.name labelLookupIsStable
     * @tc.desc Verify repeated lookups of the blank marker always return the same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('labelLookupIsStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: string = labelOf('BLANK');
      for (let i = 0; i < 20; i++) {
        expect(labelOf('BLANK')).assertEqual(first);
      }
      expect(first).assertEqual('--');
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_CONTRACT_1000
     * @tc.name allTypeLabelsNonBlank
     * @tc.desc Verify every content type and stream usage label is non-blank after trimming
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('allTypeLabelsNonBlank', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const values: string[] = stringsOf(CONTENT_TYPES).concat(stringsOf(STREAM_USAGES));
      for (const value of values) {
        expect(value.trim().length > 0).assertTrue();
      }
      expect(values.length).assertEqual(21);
    });
  });
}
