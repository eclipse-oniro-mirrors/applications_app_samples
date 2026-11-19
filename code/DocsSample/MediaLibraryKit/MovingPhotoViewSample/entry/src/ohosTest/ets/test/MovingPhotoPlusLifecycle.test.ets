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

export default function movingPhotoPlusLifecycleTest() {
  describe('MovingPhotoPlusLifecycleTest', () => {

    /**
     * @tc.name   testMpPlusLifecycle0001
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0001
     * @tc.desc   Repeat start and stop lifecycle 1 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 1; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0002
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0002
     * @tc.desc   Repeat start and stop lifecycle 2 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 2; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0003
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0003
     * @tc.desc   Repeat start and stop lifecycle 3 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 3; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0004
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0004
     * @tc.desc   Repeat start and stop lifecycle 4 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 4; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0005
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0005
     * @tc.desc   Repeat start and stop lifecycle 5 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 5; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0006
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0006
     * @tc.desc   Repeat start and stop lifecycle 6 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 6; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0007
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0007
     * @tc.desc   Repeat start and stop lifecycle 7 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 7; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0008
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0008
     * @tc.desc   Repeat start and stop lifecycle 8 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 8; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0009
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0009
     * @tc.desc   Repeat start and stop lifecycle 9 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 9; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0010
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0010
     * @tc.desc   Repeat start and stop lifecycle 10 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 10; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0011
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0011
     * @tc.desc   Repeat start and stop lifecycle 11 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 11; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0012
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0012
     * @tc.desc   Repeat start and stop lifecycle 12 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 12; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0013
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0013
     * @tc.desc   Repeat start and stop lifecycle 13 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 13; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0014
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0014
     * @tc.desc   Repeat start and stop lifecycle 14 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 14; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0015
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0015
     * @tc.desc   Repeat start and stop lifecycle 15 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 15; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0016
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0016
     * @tc.desc   Repeat start and stop lifecycle 16 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 16; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0017
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0017
     * @tc.desc   Repeat start and stop lifecycle 17 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 17; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0018
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0018
     * @tc.desc   Repeat start and stop lifecycle 18 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 18; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0019
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0019
     * @tc.desc   Repeat start and stop lifecycle 19 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 19; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0020
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0020
     * @tc.desc   Repeat start and stop lifecycle 20 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 20; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0021
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0021
     * @tc.desc   Repeat start and stop lifecycle 21 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 21; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0022
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0022
     * @tc.desc   Repeat start and stop lifecycle 22 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 22; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0023
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0023
     * @tc.desc   Repeat start and stop lifecycle 23 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 23; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0024
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0024
     * @tc.desc   Repeat start and stop lifecycle 24 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 24; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0025
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0025
     * @tc.desc   Repeat start and stop lifecycle 25 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 25; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0026
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0026
     * @tc.desc   Repeat start and stop lifecycle 26 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 26; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0027
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0027
     * @tc.desc   Repeat start and stop lifecycle 27 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 27; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0028
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0028
     * @tc.desc   Repeat start and stop lifecycle 28 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 28; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0029
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0029
     * @tc.desc   Repeat start and stop lifecycle 29 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 29; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0030
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0030
     * @tc.desc   Repeat start and stop lifecycle 30 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 30; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0031
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0031
     * @tc.desc   Repeat start and stop lifecycle 31 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 31; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0032
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0032
     * @tc.desc   Repeat start and stop lifecycle 32 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 32; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0033
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0033
     * @tc.desc   Repeat start and stop lifecycle 33 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 33; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0034
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0034
     * @tc.desc   Repeat start and stop lifecycle 34 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 34; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0035
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0035
     * @tc.desc   Repeat start and stop lifecycle 35 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 35; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0036
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0036
     * @tc.desc   Repeat start and stop lifecycle 36 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 36; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0037
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0037
     * @tc.desc   Repeat start and stop lifecycle 37 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 37; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0038
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0038
     * @tc.desc   Repeat start and stop lifecycle 38 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 38; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0039
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0039
     * @tc.desc   Repeat start and stop lifecycle 39 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 39; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0040
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0040
     * @tc.desc   Repeat start and stop lifecycle 40 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 40; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0041
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0041
     * @tc.desc   Repeat start and stop lifecycle 41 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 41; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0042
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0042
     * @tc.desc   Repeat start and stop lifecycle 42 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 42; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0043
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0043
     * @tc.desc   Repeat start and stop lifecycle 43 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 43; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0044
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0044
     * @tc.desc   Repeat start and stop lifecycle 44 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 44; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0045
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0045
     * @tc.desc   Repeat start and stop lifecycle 45 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 45; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0046
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0046
     * @tc.desc   Repeat start and stop lifecycle 46 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 46; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0047
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0047
     * @tc.desc   Repeat start and stop lifecycle 47 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 47; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0048
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0048
     * @tc.desc   Repeat start and stop lifecycle 48 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 48; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0049
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0049
     * @tc.desc   Repeat start and stop lifecycle 49 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 49; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0050
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0050
     * @tc.desc   Repeat start and stop lifecycle 50 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 50; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0051
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0051
     * @tc.desc   Repeat start and stop lifecycle 51 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 51; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0052
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0052
     * @tc.desc   Repeat start and stop lifecycle 52 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 52; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0053
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0053
     * @tc.desc   Repeat start and stop lifecycle 53 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 53; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0054
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0054
     * @tc.desc   Repeat start and stop lifecycle 54 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 54; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0055
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0055
     * @tc.desc   Repeat start and stop lifecycle 55 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 55; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0056
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0056
     * @tc.desc   Repeat start and stop lifecycle 56 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 56; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0057
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0057
     * @tc.desc   Repeat start and stop lifecycle 57 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 57; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0058
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0058
     * @tc.desc   Repeat start and stop lifecycle 58 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 58; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0059
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0059
     * @tc.desc   Repeat start and stop lifecycle 59 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 59; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testMpPlusLifecycle0060
     * @tc.number MOVING_PHOTO_PLUS_LIFECYCLE_0060
     * @tc.desc   Repeat start and stop lifecycle 60 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusLifecycle0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controller: MovingPhotoViewController = new MovingPhotoViewController();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
      for (let index: number = 0; index < 60; index++) {
        controller.startPlayback();
        controller.stopPlayback();
      }
      expect(controller !== null).assertTrue();
      expect(typeof controller.startPlayback === 'function').assertTrue();
      expect(typeof controller.stopPlayback === 'function').assertTrue();
    })
  })
}
