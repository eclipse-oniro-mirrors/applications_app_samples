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
import { describe, it, expect } from '@ohos/hypium';
import avPlayerNDK from 'libentry.so';

export default function nativeApiTypeExpandedTest() {
  describe('nativeApiTypeExpandedTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0001
     * @tc.name      testContinueNativeType0001
     * @tc.desc      Native API setup is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0001', 0, () => {
      expect(typeof avPlayerNDK.setup).assertEqual('function');
      expect(avPlayerNDK.setup !== undefined).assertTrue();
      expect(avPlayerNDK.setup !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0002
     * @tc.name      testContinueNativeType0002
     * @tc.desc      Native API play is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0002', 0, () => {
      expect(typeof avPlayerNDK.play).assertEqual('function');
      expect(avPlayerNDK.play !== undefined).assertTrue();
      expect(avPlayerNDK.play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0003
     * @tc.name      testContinueNativeType0003
     * @tc.desc      Native API setSpeed is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0003', 0, () => {
      expect(typeof avPlayerNDK.setSpeed).assertEqual('function');
      expect(avPlayerNDK.setSpeed !== undefined).assertTrue();
      expect(avPlayerNDK.setSpeed !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0004
     * @tc.name      testContinueNativeType0004
     * @tc.desc      Native API getSpeed is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0004', 0, () => {
      expect(typeof avPlayerNDK.getSpeed).assertEqual('function');
      expect(avPlayerNDK.getSpeed !== undefined).assertTrue();
      expect(avPlayerNDK.getSpeed !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0005
     * @tc.name      testContinueNativeType0005
     * @tc.desc      Native API pause is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0005', 0, () => {
      expect(typeof avPlayerNDK.pause).assertEqual('function');
      expect(avPlayerNDK.pause !== undefined).assertTrue();
      expect(avPlayerNDK.pause !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0006
     * @tc.name      testContinueNativeType0006
     * @tc.desc      Native API seek is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0006', 0, () => {
      expect(typeof avPlayerNDK.seek).assertEqual('function');
      expect(avPlayerNDK.seek !== undefined).assertTrue();
      expect(avPlayerNDK.seek !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0007
     * @tc.name      testContinueNativeType0007
     * @tc.desc      Native API getDuration is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0007', 0, () => {
      expect(typeof avPlayerNDK.getDuration).assertEqual('function');
      expect(avPlayerNDK.getDuration !== undefined).assertTrue();
      expect(avPlayerNDK.getDuration !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0008
     * @tc.name      testContinueNativeType0008
     * @tc.desc      Native API getCurrentTime is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0008', 0, () => {
      expect(typeof avPlayerNDK.getCurrentTime).assertEqual('function');
      expect(avPlayerNDK.getCurrentTime !== undefined).assertTrue();
      expect(avPlayerNDK.getCurrentTime !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0009
     * @tc.name      testContinueNativeType0009
     * @tc.desc      Native API getVideoHeight is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0009', 0, () => {
      expect(typeof avPlayerNDK.getVideoHeight).assertEqual('function');
      expect(avPlayerNDK.getVideoHeight !== undefined).assertTrue();
      expect(avPlayerNDK.getVideoHeight !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0010
     * @tc.name      testContinueNativeType0010
     * @tc.desc      Native API getVideoWidth is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0010', 0, () => {
      expect(typeof avPlayerNDK.getVideoWidth).assertEqual('function');
      expect(avPlayerNDK.getVideoWidth !== undefined).assertTrue();
      expect(avPlayerNDK.getVideoWidth !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0011
     * @tc.name      testContinueNativeType0011
     * @tc.desc      Native API release is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0011', 0, () => {
      expect(typeof avPlayerNDK.release).assertEqual('function');
      expect(avPlayerNDK.release !== undefined).assertTrue();
      expect(avPlayerNDK.release !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0012
     * @tc.name      testContinueNativeType0012
     * @tc.desc      Native API addSubtitle is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0012', 0, () => {
      expect(typeof avPlayerNDK.addSubtitle).assertEqual('function');
      expect(avPlayerNDK.addSubtitle !== undefined).assertTrue();
      expect(avPlayerNDK.addSubtitle !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0013
     * @tc.name      testContinueNativeType0013
     * @tc.desc      Native API getSubtitle is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0013', 0, () => {
      expect(typeof avPlayerNDK.getSubtitle).assertEqual('function');
      expect(avPlayerNDK.getSubtitle !== undefined).assertTrue();
      expect(avPlayerNDK.getSubtitle !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0014
     * @tc.name      testContinueNativeType0014
     * @tc.desc      Native API setup is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0014', 0, () => {
      expect(typeof avPlayerNDK.setup).assertEqual('function');
      expect(avPlayerNDK.setup !== undefined).assertTrue();
      expect(avPlayerNDK.setup !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0015
     * @tc.name      testContinueNativeType0015
     * @tc.desc      Native API play is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0015', 0, () => {
      expect(typeof avPlayerNDK.play).assertEqual('function');
      expect(avPlayerNDK.play !== undefined).assertTrue();
      expect(avPlayerNDK.play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0016
     * @tc.name      testContinueNativeType0016
     * @tc.desc      Native API setSpeed is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0016', 0, () => {
      expect(typeof avPlayerNDK.setSpeed).assertEqual('function');
      expect(avPlayerNDK.setSpeed !== undefined).assertTrue();
      expect(avPlayerNDK.setSpeed !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0017
     * @tc.name      testContinueNativeType0017
     * @tc.desc      Native API getSpeed is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0017', 0, () => {
      expect(typeof avPlayerNDK.getSpeed).assertEqual('function');
      expect(avPlayerNDK.getSpeed !== undefined).assertTrue();
      expect(avPlayerNDK.getSpeed !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0018
     * @tc.name      testContinueNativeType0018
     * @tc.desc      Native API pause is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0018', 0, () => {
      expect(typeof avPlayerNDK.pause).assertEqual('function');
      expect(avPlayerNDK.pause !== undefined).assertTrue();
      expect(avPlayerNDK.pause !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0019
     * @tc.name      testContinueNativeType0019
     * @tc.desc      Native API seek is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0019', 0, () => {
      expect(typeof avPlayerNDK.seek).assertEqual('function');
      expect(avPlayerNDK.seek !== undefined).assertTrue();
      expect(avPlayerNDK.seek !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0020
     * @tc.name      testContinueNativeType0020
     * @tc.desc      Native API getDuration is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0020', 0, () => {
      expect(typeof avPlayerNDK.getDuration).assertEqual('function');
      expect(avPlayerNDK.getDuration !== undefined).assertTrue();
      expect(avPlayerNDK.getDuration !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0021
     * @tc.name      testContinueNativeType0021
     * @tc.desc      Native API getCurrentTime is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0021', 0, () => {
      expect(typeof avPlayerNDK.getCurrentTime).assertEqual('function');
      expect(avPlayerNDK.getCurrentTime !== undefined).assertTrue();
      expect(avPlayerNDK.getCurrentTime !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0022
     * @tc.name      testContinueNativeType0022
     * @tc.desc      Native API getVideoHeight is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0022', 0, () => {
      expect(typeof avPlayerNDK.getVideoHeight).assertEqual('function');
      expect(avPlayerNDK.getVideoHeight !== undefined).assertTrue();
      expect(avPlayerNDK.getVideoHeight !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0023
     * @tc.name      testContinueNativeType0023
     * @tc.desc      Native API getVideoWidth is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0023', 0, () => {
      expect(typeof avPlayerNDK.getVideoWidth).assertEqual('function');
      expect(avPlayerNDK.getVideoWidth !== undefined).assertTrue();
      expect(avPlayerNDK.getVideoWidth !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0024
     * @tc.name      testContinueNativeType0024
     * @tc.desc      Native API release is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0024', 0, () => {
      expect(typeof avPlayerNDK.release).assertEqual('function');
      expect(avPlayerNDK.release !== undefined).assertTrue();
      expect(avPlayerNDK.release !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0025
     * @tc.name      testContinueNativeType0025
     * @tc.desc      Native API addSubtitle is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0025', 0, () => {
      expect(typeof avPlayerNDK.addSubtitle).assertEqual('function');
      expect(avPlayerNDK.addSubtitle !== undefined).assertTrue();
      expect(avPlayerNDK.addSubtitle !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0026
     * @tc.name      testContinueNativeType0026
     * @tc.desc      Native API getSubtitle is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0026', 0, () => {
      expect(typeof avPlayerNDK.getSubtitle).assertEqual('function');
      expect(avPlayerNDK.getSubtitle !== undefined).assertTrue();
      expect(avPlayerNDK.getSubtitle !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0027
     * @tc.name      testContinueNativeType0027
     * @tc.desc      Native API setup is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0027', 0, () => {
      expect(typeof avPlayerNDK.setup).assertEqual('function');
      expect(avPlayerNDK.setup !== undefined).assertTrue();
      expect(avPlayerNDK.setup !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0028
     * @tc.name      testContinueNativeType0028
     * @tc.desc      Native API play is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0028', 0, () => {
      expect(typeof avPlayerNDK.play).assertEqual('function');
      expect(avPlayerNDK.play !== undefined).assertTrue();
      expect(avPlayerNDK.play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0029
     * @tc.name      testContinueNativeType0029
     * @tc.desc      Native API setSpeed is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0029', 0, () => {
      expect(typeof avPlayerNDK.setSpeed).assertEqual('function');
      expect(avPlayerNDK.setSpeed !== undefined).assertTrue();
      expect(avPlayerNDK.setSpeed !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0030
     * @tc.name      testContinueNativeType0030
     * @tc.desc      Native API getSpeed is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0030', 0, () => {
      expect(typeof avPlayerNDK.getSpeed).assertEqual('function');
      expect(avPlayerNDK.getSpeed !== undefined).assertTrue();
      expect(avPlayerNDK.getSpeed !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0031
     * @tc.name      testContinueNativeType0031
     * @tc.desc      Native API pause is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0031', 0, () => {
      expect(typeof avPlayerNDK.pause).assertEqual('function');
      expect(avPlayerNDK.pause !== undefined).assertTrue();
      expect(avPlayerNDK.pause !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0032
     * @tc.name      testContinueNativeType0032
     * @tc.desc      Native API seek is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0032', 0, () => {
      expect(typeof avPlayerNDK.seek).assertEqual('function');
      expect(avPlayerNDK.seek !== undefined).assertTrue();
      expect(avPlayerNDK.seek !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0033
     * @tc.name      testContinueNativeType0033
     * @tc.desc      Native API getDuration is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0033', 0, () => {
      expect(typeof avPlayerNDK.getDuration).assertEqual('function');
      expect(avPlayerNDK.getDuration !== undefined).assertTrue();
      expect(avPlayerNDK.getDuration !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0034
     * @tc.name      testContinueNativeType0034
     * @tc.desc      Native API getCurrentTime is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0034', 0, () => {
      expect(typeof avPlayerNDK.getCurrentTime).assertEqual('function');
      expect(avPlayerNDK.getCurrentTime !== undefined).assertTrue();
      expect(avPlayerNDK.getCurrentTime !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0035
     * @tc.name      testContinueNativeType0035
     * @tc.desc      Native API getVideoHeight is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0035', 0, () => {
      expect(typeof avPlayerNDK.getVideoHeight).assertEqual('function');
      expect(avPlayerNDK.getVideoHeight !== undefined).assertTrue();
      expect(avPlayerNDK.getVideoHeight !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0036
     * @tc.name      testContinueNativeType0036
     * @tc.desc      Native API getVideoWidth is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0036', 0, () => {
      expect(typeof avPlayerNDK.getVideoWidth).assertEqual('function');
      expect(avPlayerNDK.getVideoWidth !== undefined).assertTrue();
      expect(avPlayerNDK.getVideoWidth !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0037
     * @tc.name      testContinueNativeType0037
     * @tc.desc      Native API release is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0037', 0, () => {
      expect(typeof avPlayerNDK.release).assertEqual('function');
      expect(avPlayerNDK.release !== undefined).assertTrue();
      expect(avPlayerNDK.release !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0038
     * @tc.name      testContinueNativeType0038
     * @tc.desc      Native API addSubtitle is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0038', 0, () => {
      expect(typeof avPlayerNDK.addSubtitle).assertEqual('function');
      expect(avPlayerNDK.addSubtitle !== undefined).assertTrue();
      expect(avPlayerNDK.addSubtitle !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0039
     * @tc.name      testContinueNativeType0039
     * @tc.desc      Native API getSubtitle is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0039', 0, () => {
      expect(typeof avPlayerNDK.getSubtitle).assertEqual('function');
      expect(avPlayerNDK.getSubtitle !== undefined).assertTrue();
      expect(avPlayerNDK.getSubtitle !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0040
     * @tc.name      testContinueNativeType0040
     * @tc.desc      Native API setup is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0040', 0, () => {
      expect(typeof avPlayerNDK.setup).assertEqual('function');
      expect(avPlayerNDK.setup !== undefined).assertTrue();
      expect(avPlayerNDK.setup !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0041
     * @tc.name      testContinueNativeType0041
     * @tc.desc      Native API play is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0041', 0, () => {
      expect(typeof avPlayerNDK.play).assertEqual('function');
      expect(avPlayerNDK.play !== undefined).assertTrue();
      expect(avPlayerNDK.play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0042
     * @tc.name      testContinueNativeType0042
     * @tc.desc      Native API setSpeed is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0042', 0, () => {
      expect(typeof avPlayerNDK.setSpeed).assertEqual('function');
      expect(avPlayerNDK.setSpeed !== undefined).assertTrue();
      expect(avPlayerNDK.setSpeed !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0043
     * @tc.name      testContinueNativeType0043
     * @tc.desc      Native API getSpeed is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0043', 0, () => {
      expect(typeof avPlayerNDK.getSpeed).assertEqual('function');
      expect(avPlayerNDK.getSpeed !== undefined).assertTrue();
      expect(avPlayerNDK.getSpeed !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0044
     * @tc.name      testContinueNativeType0044
     * @tc.desc      Native API pause is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0044', 0, () => {
      expect(typeof avPlayerNDK.pause).assertEqual('function');
      expect(avPlayerNDK.pause !== undefined).assertTrue();
      expect(avPlayerNDK.pause !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0045
     * @tc.name      testContinueNativeType0045
     * @tc.desc      Native API seek is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0045', 0, () => {
      expect(typeof avPlayerNDK.seek).assertEqual('function');
      expect(avPlayerNDK.seek !== undefined).assertTrue();
      expect(avPlayerNDK.seek !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0046
     * @tc.name      testContinueNativeType0046
     * @tc.desc      Native API getDuration is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0046', 0, () => {
      expect(typeof avPlayerNDK.getDuration).assertEqual('function');
      expect(avPlayerNDK.getDuration !== undefined).assertTrue();
      expect(avPlayerNDK.getDuration !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0047
     * @tc.name      testContinueNativeType0047
     * @tc.desc      Native API getCurrentTime is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0047', 0, () => {
      expect(typeof avPlayerNDK.getCurrentTime).assertEqual('function');
      expect(avPlayerNDK.getCurrentTime !== undefined).assertTrue();
      expect(avPlayerNDK.getCurrentTime !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0048
     * @tc.name      testContinueNativeType0048
     * @tc.desc      Native API getVideoHeight is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0048', 0, () => {
      expect(typeof avPlayerNDK.getVideoHeight).assertEqual('function');
      expect(avPlayerNDK.getVideoHeight !== undefined).assertTrue();
      expect(avPlayerNDK.getVideoHeight !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0049
     * @tc.name      testContinueNativeType0049
     * @tc.desc      Native API getVideoWidth is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0049', 0, () => {
      expect(typeof avPlayerNDK.getVideoWidth).assertEqual('function');
      expect(avPlayerNDK.getVideoWidth !== undefined).assertTrue();
      expect(avPlayerNDK.getVideoWidth !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0050
     * @tc.name      testContinueNativeType0050
     * @tc.desc      Native API release is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0050', 0, () => {
      expect(typeof avPlayerNDK.release).assertEqual('function');
      expect(avPlayerNDK.release !== undefined).assertTrue();
      expect(avPlayerNDK.release !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0051
     * @tc.name      testContinueNativeType0051
     * @tc.desc      Native API addSubtitle is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0051', 0, () => {
      expect(typeof avPlayerNDK.addSubtitle).assertEqual('function');
      expect(avPlayerNDK.addSubtitle !== undefined).assertTrue();
      expect(avPlayerNDK.addSubtitle !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0052
     * @tc.name      testContinueNativeType0052
     * @tc.desc      Native API getSubtitle is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0052', 0, () => {
      expect(typeof avPlayerNDK.getSubtitle).assertEqual('function');
      expect(avPlayerNDK.getSubtitle !== undefined).assertTrue();
      expect(avPlayerNDK.getSubtitle !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0053
     * @tc.name      testContinueNativeType0053
     * @tc.desc      Native API setup is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0053', 0, () => {
      expect(typeof avPlayerNDK.setup).assertEqual('function');
      expect(avPlayerNDK.setup !== undefined).assertTrue();
      expect(avPlayerNDK.setup !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0054
     * @tc.name      testContinueNativeType0054
     * @tc.desc      Native API play is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0054', 0, () => {
      expect(typeof avPlayerNDK.play).assertEqual('function');
      expect(avPlayerNDK.play !== undefined).assertTrue();
      expect(avPlayerNDK.play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0055
     * @tc.name      testContinueNativeType0055
     * @tc.desc      Native API setSpeed is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0055', 0, () => {
      expect(typeof avPlayerNDK.setSpeed).assertEqual('function');
      expect(avPlayerNDK.setSpeed !== undefined).assertTrue();
      expect(avPlayerNDK.setSpeed !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0056
     * @tc.name      testContinueNativeType0056
     * @tc.desc      Native API getSpeed is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0056', 0, () => {
      expect(typeof avPlayerNDK.getSpeed).assertEqual('function');
      expect(avPlayerNDK.getSpeed !== undefined).assertTrue();
      expect(avPlayerNDK.getSpeed !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0057
     * @tc.name      testContinueNativeType0057
     * @tc.desc      Native API pause is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0057', 0, () => {
      expect(typeof avPlayerNDK.pause).assertEqual('function');
      expect(avPlayerNDK.pause !== undefined).assertTrue();
      expect(avPlayerNDK.pause !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0058
     * @tc.name      testContinueNativeType0058
     * @tc.desc      Native API seek is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0058', 0, () => {
      expect(typeof avPlayerNDK.seek).assertEqual('function');
      expect(avPlayerNDK.seek !== undefined).assertTrue();
      expect(avPlayerNDK.seek !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0059
     * @tc.name      testContinueNativeType0059
     * @tc.desc      Native API getDuration is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0059', 0, () => {
      expect(typeof avPlayerNDK.getDuration).assertEqual('function');
      expect(avPlayerNDK.getDuration !== undefined).assertTrue();
      expect(avPlayerNDK.getDuration !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0060
     * @tc.name      testContinueNativeType0060
     * @tc.desc      Native API getCurrentTime is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0060', 0, () => {
      expect(typeof avPlayerNDK.getCurrentTime).assertEqual('function');
      expect(avPlayerNDK.getCurrentTime !== undefined).assertTrue();
      expect(avPlayerNDK.getCurrentTime !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0061
     * @tc.name      testContinueNativeType0061
     * @tc.desc      Native API getVideoHeight is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0061', 0, () => {
      expect(typeof avPlayerNDK.getVideoHeight).assertEqual('function');
      expect(avPlayerNDK.getVideoHeight !== undefined).assertTrue();
      expect(avPlayerNDK.getVideoHeight !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0062
     * @tc.name      testContinueNativeType0062
     * @tc.desc      Native API getVideoWidth is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0062', 0, () => {
      expect(typeof avPlayerNDK.getVideoWidth).assertEqual('function');
      expect(avPlayerNDK.getVideoWidth !== undefined).assertTrue();
      expect(avPlayerNDK.getVideoWidth !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0063
     * @tc.name      testContinueNativeType0063
     * @tc.desc      Native API release is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0063', 0, () => {
      expect(typeof avPlayerNDK.release).assertEqual('function');
      expect(avPlayerNDK.release !== undefined).assertTrue();
      expect(avPlayerNDK.release !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0064
     * @tc.name      testContinueNativeType0064
     * @tc.desc      Native API addSubtitle is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0064', 0, () => {
      expect(typeof avPlayerNDK.addSubtitle).assertEqual('function');
      expect(avPlayerNDK.addSubtitle !== undefined).assertTrue();
      expect(avPlayerNDK.addSubtitle !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0065
     * @tc.name      testContinueNativeType0065
     * @tc.desc      Native API getSubtitle is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0065', 0, () => {
      expect(typeof avPlayerNDK.getSubtitle).assertEqual('function');
      expect(avPlayerNDK.getSubtitle !== undefined).assertTrue();
      expect(avPlayerNDK.getSubtitle !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0066
     * @tc.name      testContinueNativeType0066
     * @tc.desc      Native API setup is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0066', 0, () => {
      expect(typeof avPlayerNDK.setup).assertEqual('function');
      expect(avPlayerNDK.setup !== undefined).assertTrue();
      expect(avPlayerNDK.setup !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0067
     * @tc.name      testContinueNativeType0067
     * @tc.desc      Native API play is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0067', 0, () => {
      expect(typeof avPlayerNDK.play).assertEqual('function');
      expect(avPlayerNDK.play !== undefined).assertTrue();
      expect(avPlayerNDK.play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0068
     * @tc.name      testContinueNativeType0068
     * @tc.desc      Native API setSpeed is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0068', 0, () => {
      expect(typeof avPlayerNDK.setSpeed).assertEqual('function');
      expect(avPlayerNDK.setSpeed !== undefined).assertTrue();
      expect(avPlayerNDK.setSpeed !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0069
     * @tc.name      testContinueNativeType0069
     * @tc.desc      Native API getSpeed is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0069', 0, () => {
      expect(typeof avPlayerNDK.getSpeed).assertEqual('function');
      expect(avPlayerNDK.getSpeed !== undefined).assertTrue();
      expect(avPlayerNDK.getSpeed !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0070
     * @tc.name      testContinueNativeType0070
     * @tc.desc      Native API pause is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0070', 0, () => {
      expect(typeof avPlayerNDK.pause).assertEqual('function');
      expect(avPlayerNDK.pause !== undefined).assertTrue();
      expect(avPlayerNDK.pause !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0071
     * @tc.name      testContinueNativeType0071
     * @tc.desc      Native API seek is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0071', 0, () => {
      expect(typeof avPlayerNDK.seek).assertEqual('function');
      expect(avPlayerNDK.seek !== undefined).assertTrue();
      expect(avPlayerNDK.seek !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0072
     * @tc.name      testContinueNativeType0072
     * @tc.desc      Native API getDuration is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0072', 0, () => {
      expect(typeof avPlayerNDK.getDuration).assertEqual('function');
      expect(avPlayerNDK.getDuration !== undefined).assertTrue();
      expect(avPlayerNDK.getDuration !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0073
     * @tc.name      testContinueNativeType0073
     * @tc.desc      Native API getCurrentTime is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0073', 0, () => {
      expect(typeof avPlayerNDK.getCurrentTime).assertEqual('function');
      expect(avPlayerNDK.getCurrentTime !== undefined).assertTrue();
      expect(avPlayerNDK.getCurrentTime !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0074
     * @tc.name      testContinueNativeType0074
     * @tc.desc      Native API getVideoHeight is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0074', 0, () => {
      expect(typeof avPlayerNDK.getVideoHeight).assertEqual('function');
      expect(avPlayerNDK.getVideoHeight !== undefined).assertTrue();
      expect(avPlayerNDK.getVideoHeight !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0075
     * @tc.name      testContinueNativeType0075
     * @tc.desc      Native API getVideoWidth is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0075', 0, () => {
      expect(typeof avPlayerNDK.getVideoWidth).assertEqual('function');
      expect(avPlayerNDK.getVideoWidth !== undefined).assertTrue();
      expect(avPlayerNDK.getVideoWidth !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0076
     * @tc.name      testContinueNativeType0076
     * @tc.desc      Native API release is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0076', 0, () => {
      expect(typeof avPlayerNDK.release).assertEqual('function');
      expect(avPlayerNDK.release !== undefined).assertTrue();
      expect(avPlayerNDK.release !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0077
     * @tc.name      testContinueNativeType0077
     * @tc.desc      Native API addSubtitle is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0077', 0, () => {
      expect(typeof avPlayerNDK.addSubtitle).assertEqual('function');
      expect(avPlayerNDK.addSubtitle !== undefined).assertTrue();
      expect(avPlayerNDK.addSubtitle !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0078
     * @tc.name      testContinueNativeType0078
     * @tc.desc      Native API getSubtitle is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0078', 0, () => {
      expect(typeof avPlayerNDK.getSubtitle).assertEqual('function');
      expect(avPlayerNDK.getSubtitle !== undefined).assertTrue();
      expect(avPlayerNDK.getSubtitle !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0079
     * @tc.name      testContinueNativeType0079
     * @tc.desc      Native API setup is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0079', 0, () => {
      expect(typeof avPlayerNDK.setup).assertEqual('function');
      expect(avPlayerNDK.setup !== undefined).assertTrue();
      expect(avPlayerNDK.setup !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0080
     * @tc.name      testContinueNativeType0080
     * @tc.desc      Native API play is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0080', 0, () => {
      expect(typeof avPlayerNDK.play).assertEqual('function');
      expect(avPlayerNDK.play !== undefined).assertTrue();
      expect(avPlayerNDK.play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0081
     * @tc.name      testContinueNativeType0081
     * @tc.desc      Native API setSpeed is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0081', 0, () => {
      expect(typeof avPlayerNDK.setSpeed).assertEqual('function');
      expect(avPlayerNDK.setSpeed !== undefined).assertTrue();
      expect(avPlayerNDK.setSpeed !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0082
     * @tc.name      testContinueNativeType0082
     * @tc.desc      Native API getSpeed is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0082', 0, () => {
      expect(typeof avPlayerNDK.getSpeed).assertEqual('function');
      expect(avPlayerNDK.getSpeed !== undefined).assertTrue();
      expect(avPlayerNDK.getSpeed !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0083
     * @tc.name      testContinueNativeType0083
     * @tc.desc      Native API pause is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0083', 0, () => {
      expect(typeof avPlayerNDK.pause).assertEqual('function');
      expect(avPlayerNDK.pause !== undefined).assertTrue();
      expect(avPlayerNDK.pause !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0084
     * @tc.name      testContinueNativeType0084
     * @tc.desc      Native API seek is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0084', 0, () => {
      expect(typeof avPlayerNDK.seek).assertEqual('function');
      expect(avPlayerNDK.seek !== undefined).assertTrue();
      expect(avPlayerNDK.seek !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0085
     * @tc.name      testContinueNativeType0085
     * @tc.desc      Native API getDuration is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0085', 0, () => {
      expect(typeof avPlayerNDK.getDuration).assertEqual('function');
      expect(avPlayerNDK.getDuration !== undefined).assertTrue();
      expect(avPlayerNDK.getDuration !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0086
     * @tc.name      testContinueNativeType0086
     * @tc.desc      Native API getCurrentTime is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0086', 0, () => {
      expect(typeof avPlayerNDK.getCurrentTime).assertEqual('function');
      expect(avPlayerNDK.getCurrentTime !== undefined).assertTrue();
      expect(avPlayerNDK.getCurrentTime !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0087
     * @tc.name      testContinueNativeType0087
     * @tc.desc      Native API getVideoHeight is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0087', 0, () => {
      expect(typeof avPlayerNDK.getVideoHeight).assertEqual('function');
      expect(avPlayerNDK.getVideoHeight !== undefined).assertTrue();
      expect(avPlayerNDK.getVideoHeight !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0088
     * @tc.name      testContinueNativeType0088
     * @tc.desc      Native API getVideoWidth is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0088', 0, () => {
      expect(typeof avPlayerNDK.getVideoWidth).assertEqual('function');
      expect(avPlayerNDK.getVideoWidth !== undefined).assertTrue();
      expect(avPlayerNDK.getVideoWidth !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0089
     * @tc.name      testContinueNativeType0089
     * @tc.desc      Native API release is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0089', 0, () => {
      expect(typeof avPlayerNDK.release).assertEqual('function');
      expect(avPlayerNDK.release !== undefined).assertTrue();
      expect(avPlayerNDK.release !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0090
     * @tc.name      testContinueNativeType0090
     * @tc.desc      Native API addSubtitle is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0090', 0, () => {
      expect(typeof avPlayerNDK.addSubtitle).assertEqual('function');
      expect(avPlayerNDK.addSubtitle !== undefined).assertTrue();
      expect(avPlayerNDK.addSubtitle !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0091
     * @tc.name      testContinueNativeType0091
     * @tc.desc      Native API getSubtitle is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0091', 0, () => {
      expect(typeof avPlayerNDK.getSubtitle).assertEqual('function');
      expect(avPlayerNDK.getSubtitle !== undefined).assertTrue();
      expect(avPlayerNDK.getSubtitle !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0092
     * @tc.name      testContinueNativeType0092
     * @tc.desc      Native API setup is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0092', 0, () => {
      expect(typeof avPlayerNDK.setup).assertEqual('function');
      expect(avPlayerNDK.setup !== undefined).assertTrue();
      expect(avPlayerNDK.setup !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0093
     * @tc.name      testContinueNativeType0093
     * @tc.desc      Native API play is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0093', 0, () => {
      expect(typeof avPlayerNDK.play).assertEqual('function');
      expect(avPlayerNDK.play !== undefined).assertTrue();
      expect(avPlayerNDK.play !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0094
     * @tc.name      testContinueNativeType0094
     * @tc.desc      Native API setSpeed is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0094', 0, () => {
      expect(typeof avPlayerNDK.setSpeed).assertEqual('function');
      expect(avPlayerNDK.setSpeed !== undefined).assertTrue();
      expect(avPlayerNDK.setSpeed !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0095
     * @tc.name      testContinueNativeType0095
     * @tc.desc      Native API getSpeed is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0095', 0, () => {
      expect(typeof avPlayerNDK.getSpeed).assertEqual('function');
      expect(avPlayerNDK.getSpeed !== undefined).assertTrue();
      expect(avPlayerNDK.getSpeed !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0096
     * @tc.name      testContinueNativeType0096
     * @tc.desc      Native API pause is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0096', 0, () => {
      expect(typeof avPlayerNDK.pause).assertEqual('function');
      expect(avPlayerNDK.pause !== undefined).assertTrue();
      expect(avPlayerNDK.pause !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0097
     * @tc.name      testContinueNativeType0097
     * @tc.desc      Native API seek is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0097', 0, () => {
      expect(typeof avPlayerNDK.seek).assertEqual('function');
      expect(avPlayerNDK.seek !== undefined).assertTrue();
      expect(avPlayerNDK.seek !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0098
     * @tc.name      testContinueNativeType0098
     * @tc.desc      Native API getDuration is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0098', 0, () => {
      expect(typeof avPlayerNDK.getDuration).assertEqual('function');
      expect(avPlayerNDK.getDuration !== undefined).assertTrue();
      expect(avPlayerNDK.getDuration !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0099
     * @tc.name      testContinueNativeType0099
     * @tc.desc      Native API getCurrentTime is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0099', 0, () => {
      expect(typeof avPlayerNDK.getCurrentTime).assertEqual('function');
      expect(avPlayerNDK.getCurrentTime !== undefined).assertTrue();
      expect(avPlayerNDK.getCurrentTime !== null).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_CNT_NDK_0100
     * @tc.name      testContinueNativeType0100
     * @tc.desc      Native API getVideoHeight is exported with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testContinueNativeType0100', 0, () => {
      expect(typeof avPlayerNDK.getVideoHeight).assertEqual('function');
      expect(avPlayerNDK.getVideoHeight !== undefined).assertTrue();
      expect(avPlayerNDK.getVideoHeight !== null).assertTrue();
    })
  })
}
