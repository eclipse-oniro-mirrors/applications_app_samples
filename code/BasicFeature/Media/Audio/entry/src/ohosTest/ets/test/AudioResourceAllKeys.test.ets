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
import { labelOf } from './shared/AudioDriver';

const APP_NAV: string[] = [
  'app_name', 'allow', 'Back', 'SelectOutputDevice', 'AudioEffectManager', 'AudioFocus', 'EffectManager',
  'AVVOLUME_PANEL', 'AVVOLUME_PANEL_TITLE'
];
const DEVICE_TYPES: string[] = [
  'Speaker', 'EarPiece', 'WiredHeadset', 'WiredHeadPhones', 'Bluetooth_A2DP', 'USB_Headset', 'BLUETOOTH_SCO'
];
const SCENES: string[] = ['VoiceCallType', 'MusicType', 'RingtoneType'];
const CONTENT_TYPES_ALL: string[] = [
  'CONTENT_TYPE_UNKNOWN', 'CONTENT_TYPE_SPEECH', 'CONTENT_TYPE_MUSIC', 'CONTENT_TYPE_MOVIE',
  'CONTENT_TYPE_SONIFICATION', 'CONTENT_TYPE_RINGTONE', 'CONTENT_TYPE_ULTRASONIC'
];
const STREAM_USAGES_ALL: string[] = [
  'STREAM_USAGE_UNKNOWN', 'STREAM_USAGE_MEDIA', 'STREAM_USAGE_MUSIC', 'STREAM_USAGE_VOICE_COMMUNICATION',
  'STREAM_USAGE_VOICE_ASSISTANT', 'STREAM_USAGE_ALARM', 'STREAM_USAGE_VOICE_MESSAGE',
  'STREAM_USAGE_NOTIFICATION_RINGTONE', 'STREAM_USAGE_RINGTONE', 'STREAM_USAGE_NOTIFICATION',
  'STREAM_USAGE_ACCESSIBILITY', 'STREAM_USAGE_SYSTEM', 'STREAM_USAGE_MOVIE', 'STREAM_USAGE_GAME',
  'STREAM_USAGE_AUDIOBOOK', 'STREAM_USAGE_NAVIGATION'
];
const EFFECT_UI: string[] = [
  'EFFECT_NONE_AND_DEFAULT', 'EFFECT_NONE', 'EFFECT_DEFAULT', 'CURRENT_AUDIO_EFFECT', 'QUERY', 'QUERY_RESULT',
  'AUDIO_EFFECT_MODE_SETTING', 'PRESET_AUDIO_EFFECT_QUERY', 'REALTIME_AUDIO_EFFECT_SETTING',
  'SYSTEM_PRESET_AUDIO_EFFECT', 'BLANK'
];
const CAPTURER_UI: string[] = [
  'AUDIO_CAPTURER', 'NORMAL_CAPTURER', 'PARALLEL_CAPTURER', 'LIVE_CAPTURER', 'CONTINUE', 'PAUSE', 'RECORD_RESULT'
];
const VOLUME_UI: string[] = ['VOLUME_UP', 'VOLUME_DOWN'];
const SPATIAL_UI: string[] = ['SPATIAL_AUDIO', '2P0_MUSIC', '5P1_MUSIC'];
const KARAOKE_UI: string[] = [
  'KARAOKE', 'KARAOKE_DEMO_TITLE', 'KARAOKE_STATUS_PREFIX', 'KARAOKE_NOT_INITIALIZED', 'KARAOKE_INITIALIZED',
  'KARAOKE_INITIALIZATION_FAILED', 'KARAOKE_UNSUPPORTED_HARDWARE', 'KARAOKE_DEVICE_UNSUPPORTED',
  'KARAOKE_SCENE_UNSUPPORTED', 'KARAOKE_IDLE', 'KARAOKE_RUNNING', 'KARAOKE_NO_INSTANCE', 'KARAOKE_INIT_BUTTON',
  'KARAOKE_ENABLE_BUTTON', 'KARAOKE_DISABLE_BUTTON', 'KARAOKE_VOLUME_LABEL'
];
const PRESET_UI: string[] = ['ORIGINAL', 'KTV', 'THEATER', 'CONCERT', 'FLAT', 'FULL', 'BRIGHT', 'Reverb', 'Equalizer'];

function invalidKeys(keys: string[]): string[] {
  const bad: string[] = [];
  for (const key of keys) {
    try {
      const value: string = labelOf(key);
      if (typeof value !== 'string' || value.trim().length === 0) {
        bad.push(key);
      }
    } catch (err) {
      bad.push(key);
    }
  }
  return bad;
}

function unstableKeys(keys: string[]): string[] {
  const bad: string[] = [];
  for (const key of keys) {
    try {
      if (labelOf(key) !== labelOf(key)) {
        bad.push(key);
      }
    } catch (err) {
      bad.push(key);
    }
  }
  return bad;
}

/**
 * 全量资源键接线（设备无关）
 *
 * 按功能域把 Audio 的全部资源键分组逐键解析，要求每个键都能解析为去掉首尾空白后
 * 仍非空的字符串；并校验重复读取结果一致。只读 resourceManager，不跑 UI、不涉时序。
 */
export default function audioResourceAllKeysTest() {
  describe('audioResourceAllKeysTest', () => {
    /**
     * @tc.number SUB_AUDIO_RESOURCE_KEYS_0100
     * @tc.name appAndNavigationKeysResolve
     * @tc.desc Verify app name, permission and navigation/page title keys all resolve non-blank
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('appAndNavigationKeysResolve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(invalidKeys(APP_NAV).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_KEYS_0200
     * @tc.name deviceTypeKeysResolve
     * @tc.desc Verify every output device type label resolves non-blank
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('deviceTypeKeysResolve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(invalidKeys(DEVICE_TYPES).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_KEYS_0300
     * @tc.name callAndMediaSceneKeysResolve
     * @tc.desc Verify voice call, music and ringtone scene labels resolve non-blank
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('callAndMediaSceneKeysResolve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(invalidKeys(SCENES).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_KEYS_0400
     * @tc.name allContentTypeKeysResolve
     * @tc.desc Verify all seven content type labels resolve non-blank
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('allContentTypeKeysResolve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(invalidKeys(CONTENT_TYPES_ALL).length).assertEqual(0);
      expect(CONTENT_TYPES_ALL.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_KEYS_0500
     * @tc.name allStreamUsageKeysResolve
     * @tc.desc Verify all sixteen stream usage labels resolve non-blank
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('allStreamUsageKeysResolve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(invalidKeys(STREAM_USAGES_ALL).length).assertEqual(0);
      expect(STREAM_USAGES_ALL.length).assertEqual(16);
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_KEYS_0600
     * @tc.name effectUiKeysResolve
     * @tc.desc Verify effect page labels and control keys resolve non-blank
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('effectUiKeysResolve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(invalidKeys(EFFECT_UI).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_KEYS_0700
     * @tc.name capturerUiKeysResolve
     * @tc.desc Verify capturer entry, control and result labels resolve non-blank
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('capturerUiKeysResolve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(invalidKeys(CAPTURER_UI).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_KEYS_0800
     * @tc.name volumeAndSpatialKeysResolve
     * @tc.desc Verify volume and spatial audio labels resolve non-blank
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('volumeAndSpatialKeysResolve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(invalidKeys(VOLUME_UI).length).assertEqual(0);
      expect(invalidKeys(SPATIAL_UI).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_KEYS_0900
     * @tc.name karaokeUiKeysResolve
     * @tc.desc Verify all karaoke title, status, button and volume labels resolve non-blank
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('karaokeUiKeysResolve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(invalidKeys(KARAOKE_UI).length).assertEqual(0);
      expect(KARAOKE_UI.length).assertEqual(16);
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_KEYS_1000
     * @tc.name presetUiKeysResolve
     * @tc.desc Verify reverb and equalizer preset labels resolve non-blank
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('presetUiKeysResolve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(invalidKeys(PRESET_UI).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_KEYS_1100
     * @tc.name allKeysLookupStable
     * @tc.desc Verify every resource key resolves to the same value on repeated lookups
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('allKeysLookupStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const all: string[] = APP_NAV.concat(DEVICE_TYPES).concat(SCENES).concat(CONTENT_TYPES_ALL)
        .concat(STREAM_USAGES_ALL).concat(EFFECT_UI).concat(CAPTURER_UI).concat(VOLUME_UI)
        .concat(SPATIAL_UI).concat(KARAOKE_UI).concat(PRESET_UI);
      expect(unstableKeys(all).length).assertEqual(0);
      expect(all.length > 60).assertTrue();
    });
  });
}
