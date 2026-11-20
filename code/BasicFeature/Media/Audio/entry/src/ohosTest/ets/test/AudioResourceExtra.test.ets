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

const APP_NAV: string[] = [
  'app_name', 'Back', 'allow', 'KARAOKE', 'AUDIO_CAPTURER', 'NORMAL_CAPTURER', 'PARALLEL_CAPTURER', 'LIVE_CAPTURER'
];
const EFFECT_CONTROLS: string[] = [
  'CURRENT_AUDIO_EFFECT', 'AUDIO_EFFECT_MODE_SETTING', 'PRESET_AUDIO_EFFECT_QUERY',
  'REALTIME_AUDIO_EFFECT_SETTING', 'SYSTEM_PRESET_AUDIO_EFFECT', 'QUERY', 'QUERY_RESULT', 'BLANK'
];
const EXTRA_TYPES: string[] = ['CONTENT_TYPE_ULTRASONIC', 'STREAM_USAGE_SYSTEM'];
const RECORD_CONTROLS: string[] = ['RECORD_RESULT', 'CONTINUE', 'PAUSE', 'VOLUME_UP', 'VOLUME_DOWN'];
const KARAOKE_EXTRA: string[] = ['KARAOKE', 'KARAOKE_STATUS_PREFIX', 'KARAOKE_DEMO_TITLE', 'KARAOKE_VOLUME_LABEL'];

function nonBlank(value: string): boolean {
  return value !== undefined && value !== null && value.trim().length > 0;
}

function allNonBlank(keys: string[]): boolean {
  const values: string[] = stringsOf(keys);
  for (let i = 0; i < values.length; i++) {
    if (!nonBlank(values[i])) {
      return false;
    }
  }
  return true;
}

/**
 * 资源接线补充矩阵（设备无关）
 *
 * 覆盖 AudioResourceWiring 未涉及的资源键：应用/导航、音效页控件、超声内容与
 * 系统流用途、录制控件、卡拉 OK 文案；并校验加入新增项后类型集合仍唯一。
 * 不依赖 UiTest，执行快且稳定，不会超时。
 */
export default function audioResourceExtraTest() {
  describe('audioResourceExtraTest', () => {
    /**
     * @tc.number SUB_AUDIO_RESOURCE_EXTRA_0100
     * @tc.name appAndNavLabelsNonBlank
     * @tc.desc Verify app name, back/allow and capturer/karaoke labels resolve to non-blank values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('appAndNavLabelsNonBlank', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(allNonBlank(APP_NAV)).assertTrue();
      expect(labelOf('app_name').length > 0).assertTrue();
      expect(labelOf('Back').length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_EXTRA_0200
     * @tc.name effectControlLabelsNonBlank
     * @tc.desc Verify effect page control labels and the blank marker resolve to non-blank values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('effectControlLabelsNonBlank', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(allNonBlank(EFFECT_CONTROLS)).assertTrue();
      expect(labelOf('BLANK').trim().length > 0).assertTrue();
      expect(labelOf('QUERY').length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_EXTRA_0300
     * @tc.name extraTypeLabelsNonBlank
     * @tc.desc Verify the ultrasonic content type and system stream usage labels are wired
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('extraTypeLabelsNonBlank', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(allNonBlank(EXTRA_TYPES)).assertTrue();
      expect(labelOf('CONTENT_TYPE_ULTRASONIC').length > 0).assertTrue();
      expect(labelOf('STREAM_USAGE_SYSTEM').length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_EXTRA_0400
     * @tc.name recordControlLabelsNonBlank
     * @tc.desc Verify record result, continue/pause and volume control labels are wired
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('recordControlLabelsNonBlank', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(allNonBlank(RECORD_CONTROLS)).assertTrue();
      expect(labelOf('CONTINUE').length > 0).assertTrue();
      expect(labelOf('PAUSE').length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_EXTRA_0500
     * @tc.name karaokeExtraLabelsNonBlank
     * @tc.desc Verify karaoke title, status prefix and volume label are wired
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('karaokeExtraLabelsNonBlank', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(allNonBlank(KARAOKE_EXTRA)).assertTrue();
      expect(labelOf('KARAOKE_STATUS_PREFIX').length > 0).assertTrue();
      expect(labelOf('KARAOKE_DEMO_TITLE').length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_EXTRA_0600
     * @tc.name contentTypesWithUltrasonicStayUnique
     * @tc.desc Verify adding the ultrasonic content type keeps all seven content labels distinct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('contentTypesWithUltrasonicStayUnique', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const keys: string[] = CONTENT_TYPES.concat(['CONTENT_TYPE_ULTRASONIC']);
      const labels: string[] = stringsOf(keys);
      expect(labels.length).assertEqual(7);
      expect(uniqueCount(labels)).assertEqual(7);
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_EXTRA_0700
     * @tc.name streamUsagesWithSystemStayUnique
     * @tc.desc Verify adding the system stream usage keeps all sixteen usage labels distinct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('streamUsagesWithSystemStayUnique', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const keys: string[] = STREAM_USAGES.concat(['STREAM_USAGE_SYSTEM']);
      const labels: string[] = stringsOf(keys);
      expect(labels.length).assertEqual(16);
      expect(uniqueCount(labels)).assertEqual(16);
    });

    /**
     * @tc.number SUB_AUDIO_RESOURCE_EXTRA_0800
     * @tc.name aggregateLabelsAllNonBlank
     * @tc.desc Verify the union of all supplemented resource keys resolves without blank values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('aggregateLabelsAllNonBlank', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const all: string[] = APP_NAV.concat(EFFECT_CONTROLS).concat(EXTRA_TYPES).concat(RECORD_CONTROLS).concat(KARAOKE_EXTRA);
      expect(allNonBlank(all)).assertTrue();
      expect(all.length > 20).assertTrue();
    });
  });
}
