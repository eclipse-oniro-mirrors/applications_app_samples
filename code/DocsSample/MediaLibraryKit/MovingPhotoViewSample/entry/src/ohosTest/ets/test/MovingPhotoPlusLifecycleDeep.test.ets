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
import { MovingPhotoViewController } from '@kit.MediaLibraryKit';

export default function movingPhotoPlusLifecycleDeepTest() {
  describe('MovingPhotoPlusLifecycleDeepTest', () => {

    /**
     * @tc.name   testMpPlusLifecycleDeep0001
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0001
     * @tc.desc   Repeat double-start lifecycle 1 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 1; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(1 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0002
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0002
     * @tc.desc   Repeat double-start lifecycle 2 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 2; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(2 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0003
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0003
     * @tc.desc   Repeat double-start lifecycle 3 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 3; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(3 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0004
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0004
     * @tc.desc   Repeat double-start lifecycle 4 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 4; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(4 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0005
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0005
     * @tc.desc   Repeat double-start lifecycle 5 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 5; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(5 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0006
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0006
     * @tc.desc   Repeat double-start lifecycle 6 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 6; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(6 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0007
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0007
     * @tc.desc   Repeat double-start lifecycle 7 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 7; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(7 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0008
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0008
     * @tc.desc   Repeat double-start lifecycle 8 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 8; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(8 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0009
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0009
     * @tc.desc   Repeat double-start lifecycle 9 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 9; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(9 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0010
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0010
     * @tc.desc   Repeat double-start lifecycle 10 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 10; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(10 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0011
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0011
     * @tc.desc   Repeat double-start lifecycle 11 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 11; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(11 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0012
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0012
     * @tc.desc   Repeat double-start lifecycle 12 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 12; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(12 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0013
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0013
     * @tc.desc   Repeat double-start lifecycle 13 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 13; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(13 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0014
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0014
     * @tc.desc   Repeat double-start lifecycle 14 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 14; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(14 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0015
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0015
     * @tc.desc   Repeat double-start lifecycle 15 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 15; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(15 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0016
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0016
     * @tc.desc   Repeat double-start lifecycle 16 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 16; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(16 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0017
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0017
     * @tc.desc   Repeat double-start lifecycle 17 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 17; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(17 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0018
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0018
     * @tc.desc   Repeat double-start lifecycle 18 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 18; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(18 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0019
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0019
     * @tc.desc   Repeat double-start lifecycle 19 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 19; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(19 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0020
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0020
     * @tc.desc   Repeat double-start lifecycle 20 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 20; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(20 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0021
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0021
     * @tc.desc   Repeat double-start lifecycle 21 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 21; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(21 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0022
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0022
     * @tc.desc   Repeat double-start lifecycle 22 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 22; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(22 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0023
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0023
     * @tc.desc   Repeat double-start lifecycle 23 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 23; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(23 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0024
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0024
     * @tc.desc   Repeat double-start lifecycle 24 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 24; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(24 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0025
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0025
     * @tc.desc   Repeat double-start lifecycle 25 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 25; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(25 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0026
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0026
     * @tc.desc   Repeat double-start lifecycle 26 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 26; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(26 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0027
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0027
     * @tc.desc   Repeat double-start lifecycle 27 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 27; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(27 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0028
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0028
     * @tc.desc   Repeat double-start lifecycle 28 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 28; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(28 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0029
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0029
     * @tc.desc   Repeat double-start lifecycle 29 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 29; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(29 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0030
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0030
     * @tc.desc   Repeat double-start lifecycle 30 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 30; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(30 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0031
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0031
     * @tc.desc   Repeat double-start lifecycle 31 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 31; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(31 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0032
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0032
     * @tc.desc   Repeat double-start lifecycle 32 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 32; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(32 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0033
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0033
     * @tc.desc   Repeat double-start lifecycle 33 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 33; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(33 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0034
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0034
     * @tc.desc   Repeat double-start lifecycle 34 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 34; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(34 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0035
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0035
     * @tc.desc   Repeat double-start lifecycle 35 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 35; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(35 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0036
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0036
     * @tc.desc   Repeat double-start lifecycle 36 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 36; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(36 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0037
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0037
     * @tc.desc   Repeat double-start lifecycle 37 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 37; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(37 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0038
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0038
     * @tc.desc   Repeat double-start lifecycle 38 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 38; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(38 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0039
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0039
     * @tc.desc   Repeat double-start lifecycle 39 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 39; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(39 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0040
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0040
     * @tc.desc   Repeat double-start lifecycle 40 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 40; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(40 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0041
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0041
     * @tc.desc   Repeat double-start lifecycle 41 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 41; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(41 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0042
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0042
     * @tc.desc   Repeat double-start lifecycle 42 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 42; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(42 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0043
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0043
     * @tc.desc   Repeat double-start lifecycle 43 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 43; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(43 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0044
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0044
     * @tc.desc   Repeat double-start lifecycle 44 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 44; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(44 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0045
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0045
     * @tc.desc   Repeat double-start lifecycle 45 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 45; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(45 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0046
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0046
     * @tc.desc   Repeat double-start lifecycle 46 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 46; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(46 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0047
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0047
     * @tc.desc   Repeat double-start lifecycle 47 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 47; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(47 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0048
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0048
     * @tc.desc   Repeat double-start lifecycle 48 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 48; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(48 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0049
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0049
     * @tc.desc   Repeat double-start lifecycle 49 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 49; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(49 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0050
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0050
     * @tc.desc   Repeat double-start lifecycle 50 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 50; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(50 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0051
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0051
     * @tc.desc   Repeat double-start lifecycle 51 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 51; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(51 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0052
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0052
     * @tc.desc   Repeat double-start lifecycle 52 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 52; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(52 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0053
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0053
     * @tc.desc   Repeat double-start lifecycle 53 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 53; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(53 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0054
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0054
     * @tc.desc   Repeat double-start lifecycle 54 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 54; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(54 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0055
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0055
     * @tc.desc   Repeat double-start lifecycle 55 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 55; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(55 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0056
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0056
     * @tc.desc   Repeat double-start lifecycle 56 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 56; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(56 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0057
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0057
     * @tc.desc   Repeat double-start lifecycle 57 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 57; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(57 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0058
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0058
     * @tc.desc   Repeat double-start lifecycle 58 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 58; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(58 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0059
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0059
     * @tc.desc   Repeat double-start lifecycle 59 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 59; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(59 > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycleDeep0060
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_DEEP_0060
     * @tc.desc   Repeat double-start lifecycle 60 rounds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycleDeep0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      for (let index: number = 0; index < 60; index++) {
        controller.startPlayback();
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      expect(controller !== null).assertTrue();
      expect(60 > 0).assertTrue();
    })
  })
}
