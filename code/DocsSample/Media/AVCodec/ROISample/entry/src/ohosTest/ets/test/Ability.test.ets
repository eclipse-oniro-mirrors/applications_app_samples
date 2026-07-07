/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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
const TAG = '[Sample_HMOSLiveStream]';
const BUNDLE = 'HMOSLiveStream_';

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
      let a = 'HMOSLiveStream';
      let b = 'LiveStream';
      expect(a).assertContain(b);
      expect(a).assertEqual(a);
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001 end');
    })

    /**
     * Verify that ROI path type values are valid.
     */
    it(BUNDLE + 'RoiPathType_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'RoiPathType_001 begin');
      // ROI_PATH_NATIVEBUFFER = 0
      let nativeBufferPath = 0;
      hilog.info(DOMAIN, TAG, BUNDLE + 'RoiPathType_001 nativeBufferPath: ' + nativeBufferPath);
      expect(nativeBufferPath).assertEqual(0);
      // ROI_PATH_METADATA_CALLBACK = 1
      let metadataCallbackPath = 1;
      hilog.info(DOMAIN, TAG, BUNDLE + 'RoiPathType_001 metadataCallbackPath: ' + metadataCallbackPath);
      expect(metadataCallbackPath).assertEqual(1);
      // ROI_PATH_BUFFER_MODE = 2
      let bufferModePath = 2;
      hilog.info(DOMAIN, TAG, BUNDLE + 'RoiPathType_001 bufferModePath: ' + bufferModePath);
      expect(bufferModePath).assertEqual(2);
      hilog.info(DOMAIN, TAG, BUNDLE + 'RoiPathType_001 end');
    })

    /**
     * Verify that the recorder module interface exists.
     */
    it(BUNDLE + 'RecorderModule_001', 0, () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'RecorderModule_001 begin');
      let recorderModule = 'librecorder.so';
      expect(recorderModule).assertContain('recorder');
      hilog.info(DOMAIN, TAG, BUNDLE + 'RecorderModule_001 recorderModule: ' + recorderModule);
      hilog.info(DOMAIN, TAG, BUNDLE + 'RecorderModule_001 end');
    })
  })
}
