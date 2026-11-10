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
import { abilityDelegatorRegistry } from '@kit.TestKit';

const context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();



export default function nativeInvalidInputBehaviorTest() {
  describe('nativeInvalidInputBehaviorTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_NAT_0001
     * @tc.name      testBehaviorNativeInvalid0001
     * @tc.desc      addSubtitle with missing resource 1 returns a numeric failure code.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorNativeInvalid0001', 0, () => {
      const result: number = avPlayerNDK.addSubtitle('missing_subtitle.srt', context);
      expect(result).assertLessOrEqual(0);
      expect(typeof result).assertEqual('number');
      expect(Number.isInteger(result)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_NAT_0002
     * @tc.name      testBehaviorNativeInvalid0002
     * @tc.desc      release before setup 2 returns a numeric failure code.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorNativeInvalid0002', 0, () => {
      const result: number = avPlayerNDK.release();
      expect(result).assertLessOrEqual(0);
      expect(typeof result).assertEqual('number');
      expect(Number.isInteger(result)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_NAT_0003
     * @tc.name      testBehaviorNativeInvalid0003
     * @tc.desc      addSubtitle with missing resource 3 returns a numeric failure code.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorNativeInvalid0003', 0, () => {
      const result: number = avPlayerNDK.addSubtitle('missing_subtitle.srt', context);
      expect(result).assertLessOrEqual(0);
      expect(typeof result).assertEqual('number');
      expect(Number.isInteger(result)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_NAT_0004
     * @tc.name      testBehaviorNativeInvalid0004
     * @tc.desc      release before setup 4 returns a numeric failure code.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorNativeInvalid0004', 0, () => {
      const result: number = avPlayerNDK.release();
      expect(result).assertLessOrEqual(0);
      expect(typeof result).assertEqual('number');
      expect(Number.isInteger(result)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_NAT_0005
     * @tc.name      testBehaviorNativeInvalid0005
     * @tc.desc      addSubtitle with missing resource 5 returns a numeric failure code.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorNativeInvalid0005', 0, () => {
      const result: number = avPlayerNDK.addSubtitle('missing_subtitle.srt', context);
      expect(result).assertLessOrEqual(0);
      expect(typeof result).assertEqual('number');
      expect(Number.isInteger(result)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_NAT_0006
     * @tc.name      testBehaviorNativeInvalid0006
     * @tc.desc      release before setup 6 returns a numeric failure code.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorNativeInvalid0006', 0, () => {
      const result: number = avPlayerNDK.release();
      expect(result).assertLessOrEqual(0);
      expect(typeof result).assertEqual('number');
      expect(Number.isInteger(result)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_NAT_0007
     * @tc.name      testBehaviorNativeInvalid0007
     * @tc.desc      addSubtitle with missing resource 7 returns a numeric failure code.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorNativeInvalid0007', 0, () => {
      const result: number = avPlayerNDK.addSubtitle('missing_subtitle.srt', context);
      expect(result).assertLessOrEqual(0);
      expect(typeof result).assertEqual('number');
      expect(Number.isInteger(result)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_NAT_0008
     * @tc.name      testBehaviorNativeInvalid0008
     * @tc.desc      release before setup 8 returns a numeric failure code.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorNativeInvalid0008', 0, () => {
      const result: number = avPlayerNDK.release();
      expect(result).assertLessOrEqual(0);
      expect(typeof result).assertEqual('number');
      expect(Number.isInteger(result)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_NAT_0009
     * @tc.name      testBehaviorNativeInvalid0009
     * @tc.desc      addSubtitle with missing resource 9 returns a numeric failure code.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorNativeInvalid0009', 0, () => {
      const result: number = avPlayerNDK.addSubtitle('missing_subtitle.srt', context);
      expect(result).assertLessOrEqual(0);
      expect(typeof result).assertEqual('number');
      expect(Number.isInteger(result)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_NAT_0010
     * @tc.name      testBehaviorNativeInvalid0010
     * @tc.desc      release before setup 10 returns a numeric failure code.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorNativeInvalid0010', 0, () => {
      const result: number = avPlayerNDK.release();
      expect(result).assertLessOrEqual(0);
      expect(typeof result).assertEqual('number');
      expect(Number.isInteger(result)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_NAT_0011
     * @tc.name      testBehaviorNativeInvalid0011
     * @tc.desc      addSubtitle with missing resource 11 returns a numeric failure code.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorNativeInvalid0011', 0, () => {
      const result: number = avPlayerNDK.addSubtitle('missing_subtitle.srt', context);
      expect(result).assertLessOrEqual(0);
      expect(typeof result).assertEqual('number');
      expect(Number.isInteger(result)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_NAT_0012
     * @tc.name      testBehaviorNativeInvalid0012
     * @tc.desc      release before setup 12 returns a numeric failure code.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorNativeInvalid0012', 0, () => {
      const result: number = avPlayerNDK.release();
      expect(result).assertLessOrEqual(0);
      expect(typeof result).assertEqual('number');
      expect(Number.isInteger(result)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_NAT_0013
     * @tc.name      testBehaviorNativeInvalid0013
     * @tc.desc      addSubtitle with missing resource 13 returns a numeric failure code.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorNativeInvalid0013', 0, () => {
      const result: number = avPlayerNDK.addSubtitle('missing_subtitle.srt', context);
      expect(result).assertLessOrEqual(0);
      expect(typeof result).assertEqual('number');
      expect(Number.isInteger(result)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_NAT_0014
     * @tc.name      testBehaviorNativeInvalid0014
     * @tc.desc      release before setup 14 returns a numeric failure code.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorNativeInvalid0014', 0, () => {
      const result: number = avPlayerNDK.release();
      expect(result).assertLessOrEqual(0);
      expect(typeof result).assertEqual('number');
      expect(Number.isInteger(result)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_NAT_0015
     * @tc.name      testBehaviorNativeInvalid0015
     * @tc.desc      addSubtitle with missing resource 15 returns a numeric failure code.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorNativeInvalid0015', 0, () => {
      const result: number = avPlayerNDK.addSubtitle('missing_subtitle.srt', context);
      expect(result).assertLessOrEqual(0);
      expect(typeof result).assertEqual('number');
      expect(Number.isInteger(result)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_NAT_0016
     * @tc.name      testBehaviorNativeInvalid0016
     * @tc.desc      release before setup 16 returns a numeric failure code.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorNativeInvalid0016', 0, () => {
      const result: number = avPlayerNDK.release();
      expect(result).assertLessOrEqual(0);
      expect(typeof result).assertEqual('number');
      expect(Number.isInteger(result)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_NAT_0017
     * @tc.name      testBehaviorNativeInvalid0017
     * @tc.desc      addSubtitle with missing resource 17 returns a numeric failure code.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorNativeInvalid0017', 0, () => {
      const result: number = avPlayerNDK.addSubtitle('missing_subtitle.srt', context);
      expect(result).assertLessOrEqual(0);
      expect(typeof result).assertEqual('number');
      expect(Number.isInteger(result)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_NAT_0018
     * @tc.name      testBehaviorNativeInvalid0018
     * @tc.desc      release before setup 18 returns a numeric failure code.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorNativeInvalid0018', 0, () => {
      const result: number = avPlayerNDK.release();
      expect(result).assertLessOrEqual(0);
      expect(typeof result).assertEqual('number');
      expect(Number.isInteger(result)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_NAT_0019
     * @tc.name      testBehaviorNativeInvalid0019
     * @tc.desc      addSubtitle with missing resource 19 returns a numeric failure code.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorNativeInvalid0019', 0, () => {
      const result: number = avPlayerNDK.addSubtitle('missing_subtitle.srt', context);
      expect(result).assertLessOrEqual(0);
      expect(typeof result).assertEqual('number');
      expect(Number.isInteger(result)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_NAT_0020
     * @tc.name      testBehaviorNativeInvalid0020
     * @tc.desc      release before setup 20 returns a numeric failure code.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorNativeInvalid0020', 0, () => {
      const result: number = avPlayerNDK.release();
      expect(result).assertLessOrEqual(0);
      expect(typeof result).assertEqual('number');
      expect(Number.isInteger(result)).assertTrue();
    })
  })
}
