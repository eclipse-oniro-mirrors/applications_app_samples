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
import { TestType, Size, Level } from '@ohos/hypium';
import { describe, it, expect } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import { CommonConstants } from '../../../main/ets/common/CommonConstants';

const DOMAIN: number = 0xF811;
const TAG: string = 'AudioToVideoSyncLogicTest01';

export default function AudioToVideoSyncLogic01Test() {
  describe('AudioToVideoSyncLogic01Test', () => {
    /**
     * @tc.number    SUB_AUDIO_TO_VIDEO_SYNC_LOGIC_TEST01_0100
     * @tc.name      testAudioToVideoSyncLogic01Chapter0001
     * @tc.desc      Verify the page tag and unit constants
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioToVideoSyncLogic01Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudioToVideoSyncLogic01Chapter0001 begin');
      hilog.info(DOMAIN, TAG, 'tag=%{public}s', CommonConstants.INDEX_TAG);
      expect(CommonConstants.INDEX_TAG).assertEqual('INDEX');
      expect(CommonConstants.PX).assertEqual('px');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudioToVideoSyncLogic01Chapter0001 end');
    })

    /**
     * @tc.number    SUB_AUDIO_TO_VIDEO_SYNC_LOGIC_TEST01_0200
     * @tc.name      testAudioToVideoSyncLogic01Chapter0002
     * @tc.desc      Verify the default video size constants
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioToVideoSyncLogic01Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudioToVideoSyncLogic01Chapter0002 begin');
      expect(CommonConstants.DEFAULT_VALUE).assertEqual(0);
      expect(CommonConstants.DEFAULT_WIDTH).assertEqual(1920);
      expect(CommonConstants.DEFAULT_HEIGHT).assertEqual(1080);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudioToVideoSyncLogic01Chapter0002 end');
    })

    /**
     * @tc.number    SUB_AUDIO_TO_VIDEO_SYNC_LOGIC_TEST01_0300
     * @tc.name      testAudioToVideoSyncLogic01Chapter0003
     * @tc.desc      Verify the animation duration constant
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testAudioToVideoSyncLogic01Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudioToVideoSyncLogic01Chapter0003 begin');
      expect(CommonConstants.DURATION).assertEqual(2000);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testAudioToVideoSyncLogic01Chapter0003 end');
    })


  })
}