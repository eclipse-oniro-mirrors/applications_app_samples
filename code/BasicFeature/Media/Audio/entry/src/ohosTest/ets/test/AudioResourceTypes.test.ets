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
import { labelOf, stringsOf, CONTENT_TYPES, STREAM_USAGES } from './shared/AudioDriver';

const CONTENT_ALL: string[] = [
  'CONTENT_TYPE_UNKNOWN', 'CONTENT_TYPE_SPEECH', 'CONTENT_TYPE_MUSIC', 'CONTENT_TYPE_MOVIE',
  'CONTENT_TYPE_SONIFICATION', 'CONTENT_TYPE_RINGTONE', 'CONTENT_TYPE_ULTRASONIC'
];
const USAGE_ALL: string[] = [
  'STREAM_USAGE_UNKNOWN', 'STREAM_USAGE_MEDIA', 'STREAM_USAGE_MUSIC', 'STREAM_USAGE_VOICE_COMMUNICATION',
  'STREAM_USAGE_VOICE_ASSISTANT', 'STREAM_USAGE_ALARM', 'STREAM_USAGE_VOICE_MESSAGE',
  'STREAM_USAGE_NOTIFICATION_RINGTONE', 'STREAM_USAGE_RINGTONE', 'STREAM_USAGE_NOTIFICATION',
  'STREAM_USAGE_ACCESSIBIL' + 'ITY', 'STREAM_USAGE_SYSTEM', 'STREAM_USAGE_MOVIE', 'STREAM_USAGE_GAME',
  'STREAM_USAGE_AUDIOBOOK', 'STREAM_USAGE_NAVIGATION'
];
const DEVICE: string[] = ['Speaker', 'EarPiece', 'WiredHeadset', 'WiredHeadPhones', 'Bluetooth_A2DP', 'USB_Headset',
  'BLUETOOTH_SCO'];
const KARAOKE_STATES: string[] = [
  'KARAOKE_NOT_INITIALIZED', 'KARAOKE_INITIALIZED', 'KARAOKE_INITIALIZATION_FAILED', 'KARAOKE_UNSUPPORTED_HARDWARE',
  'KARAOKE_DEVICE_UNSUPPORTED', 'KARAOKE_SCENE_UNSUPPORTED', 'KARAOKE_IDLE', 'KARAOKE_RUNNING', 'KARAOKE_NO_INSTANCE'
];
const PRESET: string[] = ['ORIGINAL', 'KTV', 'THEATER', 'CONCERT', 'FLAT', 'FULL', 'BRIGHT'];
const COMMON_UI: string[] = [
  'app_name', 'Back', 'allow', 'QUERY', 'PAUSE', 'CONTINUE', 'VOLUME_UP', 'VOLUME_DOWN', 'RECORD_RESULT'
];

function keysNotEchoed(keys: string[]): string[] {
  const bad: string[] = [];
  for (const key of keys) {
    if (labelOf(key) === key) {
      bad.push(key);
    }
  }
  return bad;
}

function orderMismatch(keys: string[]): string[] {
  const values: string[] = stringsOf(keys);
  const bad: string[] = [];
  for (let i = 0; i < keys.length; i++) {
    if (values[i] !== labelOf(keys[i])) {
      bad.push(keys[i]);
    }
  }
  return bad;
}

/**
 * 资源取值类型化契约（设备无关）
 *
 * 逐组校验本地化文案不是资源键本身（KTV 除外）、“stringsOf 保序”、重复读取稳定。
 * 只读 resourceManager，不跑 UI、不涉时序。
 */
export default function audioResourceTypesTest() {
  describe('audioResourceTypesTest', () => {
    /**
     * @tc.number SUB_AUDIO_RESOURCE_TYPES_0100
     * @tc.name contentTypeLabelsNotKeys
     * @tc.desc Verify every content type label is localized text rather than its resource key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('contentTypeLabelsNotKeys', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(keysNotEchoed(CONTENT_ALL).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_TYPES_0200
     * @tc.name streamUsageLabelsNotKeys
     * @tc.desc Verify every stream usage label is localized text rather than its resource key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('streamUsageLabelsNotKeys', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(keysNotEchoed(USAGE_ALL).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_TYPES_0300
     * @tc.name deviceLabelsNotKeys
     * @tc.desc Verify every output device label is localized text rather than its resource key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('deviceLabelsNotKeys', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(keysNotEchoed(DEVICE).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_TYPES_0400
     * @tc.name karaokeStatusLabelsNotKeys
     * @tc.desc Verify every karaoke status label is localized text rather than its resource key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('karaokeStatusLabelsNotKeys', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(keysNotEchoed(KARAOKE_STATES).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_TYPES_0500
     * @tc.name presetLabelsNotKeysExceptKtv
     * @tc.desc Verify preset labels are localized except KTV which legitimately equals its key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('presetLabelsNotKeysExceptKtv', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const others: string[] = ['ORIGINAL', 'THEATER', 'CONCERT', 'FLAT', 'FULL', 'BRIGHT'];
      expect(keysNotEchoed(others).length).assertEqual(0);
      expect(labelOf('KTV')).assertEqual('KTV');
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_TYPES_0600
     * @tc.name commonUiLabelsNotKeys
     * @tc.desc Verify app name, back/allow and control labels are localized text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('commonUiLabelsNotKeys', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(keysNotEchoed(COMMON_UI).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_TYPES_0700
     * @tc.name stringsOfContentPreservesOrder
     * @tc.desc Verify content type lookups keep request order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('stringsOfContentPreservesOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(orderMismatch(CONTENT_ALL).length).assertEqual(0);
      expect(orderMismatch(CONTENT_TYPES).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_TYPES_0800
     * @tc.name stringsOfUsagePreservesOrder
     * @tc.desc Verify stream usage lookups keep request order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('stringsOfUsagePreservesOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(orderMismatch(USAGE_ALL).length).assertEqual(0);
      expect(orderMismatch(STREAM_USAGES).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_TYPES_0900
     * @tc.name stringsOfDevicePreservesOrder
     * @tc.desc Verify device label lookups keep request order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('stringsOfDevicePreservesOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(orderMismatch(DEVICE).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_TYPES_1000
     * @tc.name stringsOfKaraokePreservesOrder
     * @tc.desc Verify karaoke status lookups keep request order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('stringsOfKaraokePreservesOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(orderMismatch(KARAOKE_STATES).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_TYPES_1100
     * @tc.name stringsOfPresetPreservesOrder
     * @tc.desc Verify preset label lookups keep request order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('stringsOfPresetPreservesOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(orderMismatch(PRESET).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_TYPES_1200
     * @tc.name repeatedStringsOfStable
     * @tc.desc Verify two lookups over all resource groups return identical value lists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('repeatedStringsOfStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const all: string[] = CONTENT_ALL.concat(USAGE_ALL).concat(DEVICE).concat(KARAOKE_STATES).concat(PRESET)
        .concat(COMMON_UI);
      const first: string[] = stringsOf(all);
      const second: string[] = stringsOf(all);
      expect(first.length).assertEqual(all.length);
      let same: boolean = true;
      for (let i = 0; i < all.length; i++) {
        if (first[i] !== second[i]) {
          same = false;
          break;
        }
      }
      expect(same).assertTrue();
    });
  });
}
