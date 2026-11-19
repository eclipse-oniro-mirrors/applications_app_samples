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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import { CapabilityController } from '../../../../main/ets/controller/CapabilityController';
import { CodecBrief, CodecCategoryConstants, SCENARIO_GROUPS } from '../../../../main/ets/model/CodecModel';

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
     * Verify that the application starts successfully and the top ability is EntryAbility.
     */
    it(BUNDLE + 'StartAbility_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001 begin');
      const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator =
        abilityDelegatorRegistry.getAbilityDelegator();
      const want: Want = {
        bundleName: 'com.samples.codeccapabilitysample',
        abilityName: 'EntryAbility'
      };
      await abilityDelegator.startAbility(want);
      const ability: UIAbility = await abilityDelegator.getCurrentTopAbility();
      const abilityName: string = ability.context.abilityInfo.name;
      hilog.info(DOMAIN, TAG, 'assertEqual params, abilityName: %{public}s', abilityName);
      expect(abilityName).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001 end');
    })

    /**
     * Verify that codec category constants match the native side definition.
     */
    it(BUNDLE + 'CodecCategory_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'CodecCategory_001 begin');
      const videoDecoder: number = CodecCategoryConstants.VIDEO_DECODER;
      const videoEncoder: number = CodecCategoryConstants.VIDEO_ENCODER;
      const audioDecoder: number = CodecCategoryConstants.AUDIO_DECODER;
      const audioEncoder: number = CodecCategoryConstants.AUDIO_ENCODER;
      hilog.info(DOMAIN, TAG, 'assertEqual params, videoDecoder: %{public}d, videoEncoder: %{public}d, ' +
        'audioDecoder: %{public}d, audioEncoder: %{public}d',
        videoDecoder, videoEncoder, audioDecoder, audioEncoder);
      expect(videoDecoder).assertEqual(0);
      expect(videoEncoder).assertEqual(1);
      expect(audioDecoder).assertEqual(2);
      expect(audioEncoder).assertEqual(3);
      hilog.info(DOMAIN, TAG, BUNDLE + 'CodecCategory_001 end');
    })

    /**
     * Verify that all codec category constants are distinct.
     */
    it(BUNDLE + 'CodecCategory_002', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'CodecCategory_002 begin');
      const categories: number[] = [
        CodecCategoryConstants.VIDEO_DECODER,
        CodecCategoryConstants.VIDEO_ENCODER,
        CodecCategoryConstants.AUDIO_DECODER,
        CodecCategoryConstants.AUDIO_ENCODER
      ];
      for (let i = 0; i < categories.length; i++) {
        for (let j = i + 1; j < categories.length; j++) {
          hilog.info(DOMAIN, TAG, 'assertTrue params, categories[%{public}d]: %{public}d, ' +
            'categories[%{public}d]: %{public}d', i, categories[i], j, categories[j]);
          expect(categories[i] !== categories[j]).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'CodecCategory_002 end');
    })

    /**
     * Verify that the native capability library is loaded and returns a codec list.
     */
    it(BUNDLE + 'NativeLibrary_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'NativeLibrary_001 begin');
      const codecList: CodecBrief[] = CapabilityController.getCodecList(CodecCategoryConstants.VIDEO_DECODER);
      const listSize: number = codecList.length;
      hilog.info(DOMAIN, TAG, 'assertTrue params, isArray: %{public}s, listSize: %{public}d',
        `${Array.isArray(codecList)}`, listSize);
      expect(Array.isArray(codecList)).assertTrue();
      hilog.info(DOMAIN, TAG, BUNDLE + 'NativeLibrary_001 end');
    })

    /**
     * Verify that scenario group count and item count match the guide sections.
     */
    it(BUNDLE + 'ScenarioGroups_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'ScenarioGroups_001 begin');
      const groupCount: number = SCENARIO_GROUPS.length;
      let scenarioCount: number = 0;
      for (const group of SCENARIO_GROUPS) {
        scenarioCount += group.items.length;
      }
      hilog.info(DOMAIN, TAG, 'assertEqual params, groupCount: %{public}d, scenarioCount: %{public}d',
        groupCount, scenarioCount);
      expect(groupCount).assertEqual(19);
      expect(scenarioCount).assertEqual(39);
      hilog.info(DOMAIN, TAG, BUNDLE + 'ScenarioGroups_001 end');
    })
  })
}
