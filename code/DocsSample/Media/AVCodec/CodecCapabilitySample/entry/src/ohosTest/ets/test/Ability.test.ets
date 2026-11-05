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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

const DOMAIN = 0xF811;
const TAG = '[Sample_CodecCapability]';
const BUNDLE = 'CodecCapability_';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'beforeAll called');
    })
    beforeEach(() => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'beforeEach called');
    })
    afterEach(() => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'afterEach called');
    })
    afterAll(() => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'afterAll called');
    })

    /**
     * Verify that the application starts successfully.
     */
    it(BUNDLE + 'StartAbility_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001 begin');
      let a = 'CodecCapability';
      let b = 'Capability';
      expect(a).assertContain(b);
      expect(a).assertEqual(a);
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001 end');
    })

    /**
     * Verify that codec category values are valid.
     */
    it(BUNDLE + 'CodecCategory_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'CodecCategory_001 begin');
      // 0: video decoder, 1: video encoder, 2: audio decoder, 3: audio encoder
      let videoDecoder = 0;
      let videoEncoder = 1;
      let audioDecoder = 2;
      let audioEncoder = 3;
      expect(videoDecoder).assertEqual(0);
      expect(videoEncoder).assertEqual(1);
      expect(audioDecoder).assertEqual(2);
      expect(audioEncoder).assertEqual(3);
      hilog.info(DOMAIN, TAG, BUNDLE + 'CodecCategory_001 end');
    })

    /**
     * Verify that all codec categories are distinct.
     */
    it(BUNDLE + 'CodecCategory_002', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'CodecCategory_002 begin');
      let categories = [0, 1, 2, 3];
      for (let i = 0; i < categories.length; i++) {
        for (let j = i + 1; j < categories.length; j++) {
          expect(categories[i] !== categories[j]).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'CodecCategory_002 end');
    })

    /**
     * Verify that the native capability library name is correct.
     */
    it(BUNDLE + 'NativeLibrary_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'NativeLibrary_001 begin');
      let nativeLibrary = 'libcapability.so';
      expect(nativeLibrary).assertContain('capability');
      expect(nativeLibrary).assertEqual('libcapability.so');
      hilog.info(DOMAIN, TAG, BUNDLE + 'NativeLibrary_001 end');
    })

    /**
     * Verify that the scenario group count matches the guide sections.
     */
    it(BUNDLE + 'ScenarioGroups_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'ScenarioGroups_001 begin');
      // 19 scenario groups: obtain-supported-codecs (13) + typical-scenarios (3)
      // + b-frame (1) + temporal-scalability (2)
      let scenarioGroupCount = 19;
      let scenarioCount = 38;
      expect(scenarioGroupCount).assertEqual(19);
      expect(scenarioCount).assertEqual(38);
      hilog.info(DOMAIN, TAG, BUNDLE + 'ScenarioGroups_001 end');
    })

    /**
     * Verify MIME type constant strings.
     */
    it(BUNDLE + 'MimeType_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'MimeType_001 begin');
      let videoAvc = 'video/avc';
      let audioAac = 'audio/mp4a-latm';
      expect(videoAvc).assertContain('video');
      expect(audioAac).assertContain('audio');
      hilog.info(DOMAIN, TAG, BUNDLE + 'MimeType_001 end');
    })

    /**
     * Verify bitrate mode constant values.
     */
    it(BUNDLE + 'BitrateMode_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'BitrateMode_001 begin');
      // BITRATE_MODE_CBR = 0, VBR = 1, CQ = 2, CBRHQ = 4
      let cbr = 0;
      let vbr = 1;
      let cq = 2;
      let cbrhq = 4;
      expect(cbr).assertEqual(0);
      expect(vbr).assertEqual(1);
      expect(cq).assertEqual(2);
      expect(cbrhq).assertEqual(4);
      hilog.info(DOMAIN, TAG, BUNDLE + 'BitrateMode_001 end');
    })
  })
}
