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
import { display } from '@kit.ArkUI';


export default function windowDisplayBehaviorTest() {
  describe('windowDisplayBehaviorTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_WIN_0001
     * @tc.name      testBehaviorWindow0001
     * @tc.desc      Display property width is available for orientation/window checks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorWindow0001', 0, () => {
      const info = display.getDefaultDisplaySync();
      expect(info.width).assertLarger(0);
      expect(Number.isInteger(info.width)).assertTrue();
      expect(info.width).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_WIN_0002
     * @tc.name      testBehaviorWindow0002
     * @tc.desc      Display property height is available for orientation/window checks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorWindow0002', 0, () => {
      const info = display.getDefaultDisplaySync();
      expect(info.height).assertLarger(0);
      expect(Number.isInteger(info.height)).assertTrue();
      expect(info.height).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_WIN_0003
     * @tc.name      testBehaviorWindow0003
     * @tc.desc      Display property densityPixels is available for orientation/window checks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorWindow0003', 0, () => {
      const info = display.getDefaultDisplaySync();
      expect(info.densityPixels).assertLargerOrEqual(0);
      expect(typeof info.densityPixels).assertEqual('number');
      expect(Number.isFinite(info.densityPixels)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_WIN_0004
     * @tc.name      testBehaviorWindow0004
     * @tc.desc      Display property densityDPI is available for orientation/window checks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorWindow0004', 0, () => {
      const info = display.getDefaultDisplaySync();
      expect(info.densityDPI).assertLargerOrEqual(0);
      expect(typeof info.densityDPI).assertEqual('number');
      expect(Number.isFinite(info.densityDPI)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_WIN_0005
     * @tc.name      testBehaviorWindow0005
     * @tc.desc      Display property orientation is available for orientation/window checks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorWindow0005', 0, () => {
      const info = display.getDefaultDisplaySync();
      expect(info.orientation).assertLargerOrEqual(0);
      expect(typeof info.orientation).assertEqual('number');
      expect(Number.isFinite(info.orientation)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_WIN_0006
     * @tc.name      testBehaviorWindow0006
     * @tc.desc      Display property rotation is available for orientation/window checks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorWindow0006', 0, () => {
      const info = display.getDefaultDisplaySync();
      expect(info.rotation).assertLargerOrEqual(0);
      expect(typeof info.rotation).assertEqual('number');
      expect(Number.isFinite(info.rotation)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_WIN_0007
     * @tc.name      testBehaviorWindow0007
     * @tc.desc      Display property width is available for orientation/window checks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorWindow0007', 0, () => {
      const info = display.getDefaultDisplaySync();
      expect(info.width).assertLarger(0);
      expect(Number.isInteger(info.width)).assertTrue();
      expect(info.width).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_WIN_0008
     * @tc.name      testBehaviorWindow0008
     * @tc.desc      Display property height is available for orientation/window checks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorWindow0008', 0, () => {
      const info = display.getDefaultDisplaySync();
      expect(info.height).assertLarger(0);
      expect(Number.isInteger(info.height)).assertTrue();
      expect(info.height).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_WIN_0009
     * @tc.name      testBehaviorWindow0009
     * @tc.desc      Display property densityPixels is available for orientation/window checks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorWindow0009', 0, () => {
      const info = display.getDefaultDisplaySync();
      expect(info.densityPixels).assertLargerOrEqual(0);
      expect(typeof info.densityPixels).assertEqual('number');
      expect(Number.isFinite(info.densityPixels)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_WIN_0010
     * @tc.name      testBehaviorWindow0010
     * @tc.desc      Display property densityDPI is available for orientation/window checks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorWindow0010', 0, () => {
      const info = display.getDefaultDisplaySync();
      expect(info.densityDPI).assertLargerOrEqual(0);
      expect(typeof info.densityDPI).assertEqual('number');
      expect(Number.isFinite(info.densityDPI)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_WIN_0011
     * @tc.name      testBehaviorWindow0011
     * @tc.desc      Display property orientation is available for orientation/window checks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorWindow0011', 0, () => {
      const info = display.getDefaultDisplaySync();
      expect(info.orientation).assertLargerOrEqual(0);
      expect(typeof info.orientation).assertEqual('number');
      expect(Number.isFinite(info.orientation)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_WIN_0012
     * @tc.name      testBehaviorWindow0012
     * @tc.desc      Display property rotation is available for orientation/window checks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorWindow0012', 0, () => {
      const info = display.getDefaultDisplaySync();
      expect(info.rotation).assertLargerOrEqual(0);
      expect(typeof info.rotation).assertEqual('number');
      expect(Number.isFinite(info.rotation)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_WIN_0013
     * @tc.name      testBehaviorWindow0013
     * @tc.desc      Display property width is available for orientation/window checks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorWindow0013', 0, () => {
      const info = display.getDefaultDisplaySync();
      expect(info.width).assertLarger(0);
      expect(Number.isInteger(info.width)).assertTrue();
      expect(info.width).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_WIN_0014
     * @tc.name      testBehaviorWindow0014
     * @tc.desc      Display property height is available for orientation/window checks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorWindow0014', 0, () => {
      const info = display.getDefaultDisplaySync();
      expect(info.height).assertLarger(0);
      expect(Number.isInteger(info.height)).assertTrue();
      expect(info.height).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_WIN_0015
     * @tc.name      testBehaviorWindow0015
     * @tc.desc      Display property densityPixels is available for orientation/window checks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorWindow0015', 0, () => {
      const info = display.getDefaultDisplaySync();
      expect(info.densityPixels).assertLargerOrEqual(0);
      expect(typeof info.densityPixels).assertEqual('number');
      expect(Number.isFinite(info.densityPixels)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_WIN_0016
     * @tc.name      testBehaviorWindow0016
     * @tc.desc      Display property densityDPI is available for orientation/window checks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorWindow0016', 0, () => {
      const info = display.getDefaultDisplaySync();
      expect(info.densityDPI).assertLargerOrEqual(0);
      expect(typeof info.densityDPI).assertEqual('number');
      expect(Number.isFinite(info.densityDPI)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_WIN_0017
     * @tc.name      testBehaviorWindow0017
     * @tc.desc      Display property orientation is available for orientation/window checks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorWindow0017', 0, () => {
      const info = display.getDefaultDisplaySync();
      expect(info.orientation).assertLargerOrEqual(0);
      expect(typeof info.orientation).assertEqual('number');
      expect(Number.isFinite(info.orientation)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_WIN_0018
     * @tc.name      testBehaviorWindow0018
     * @tc.desc      Display property rotation is available for orientation/window checks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorWindow0018', 0, () => {
      const info = display.getDefaultDisplaySync();
      expect(info.rotation).assertLargerOrEqual(0);
      expect(typeof info.rotation).assertEqual('number');
      expect(Number.isFinite(info.rotation)).assertTrue();
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_WIN_0019
     * @tc.name      testBehaviorWindow0019
     * @tc.desc      Display property width is available for orientation/window checks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorWindow0019', 0, () => {
      const info = display.getDefaultDisplaySync();
      expect(info.width).assertLarger(0);
      expect(Number.isInteger(info.width)).assertTrue();
      expect(info.width).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_BEH2_WIN_0020
     * @tc.name      testBehaviorWindow0020
     * @tc.desc      Display property height is available for orientation/window checks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testBehaviorWindow0020', 0, () => {
      const info = display.getDefaultDisplaySync();
      expect(info.height).assertLarger(0);
      expect(Number.isInteger(info.height)).assertTrue();
      expect(info.height).assertLarger(0);
    })
  })
}
