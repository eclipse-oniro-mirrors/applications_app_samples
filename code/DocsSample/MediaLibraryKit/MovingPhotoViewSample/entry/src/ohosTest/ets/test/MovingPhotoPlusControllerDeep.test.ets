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

export default function movingPhotoPlusControllerDeepTest() {
  describe('MovingPhotoPlusControllerDeepTest', () => {

    /**
     * @tc.name   testMpPlusControllerDeep0001
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0001
     * @tc.desc   Create and exercise controller vector 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 1; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(1);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0002
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0002
     * @tc.desc   Create and exercise controller vector 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 2; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(2);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0003
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0003
     * @tc.desc   Create and exercise controller vector 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 3; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(3);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0004
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0004
     * @tc.desc   Create and exercise controller vector 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 4; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(4);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0005
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0005
     * @tc.desc   Create and exercise controller vector 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 5; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(5);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0006
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0006
     * @tc.desc   Create and exercise controller vector 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 6; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(6);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0007
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0007
     * @tc.desc   Create and exercise controller vector 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 7; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(7);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0008
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0008
     * @tc.desc   Create and exercise controller vector 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 8; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(8);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0009
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0009
     * @tc.desc   Create and exercise controller vector 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 9; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(9);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0010
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0010
     * @tc.desc   Create and exercise controller vector 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 10; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(10);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0011
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0011
     * @tc.desc   Create and exercise controller vector 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 11; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(11);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0012
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0012
     * @tc.desc   Create and exercise controller vector 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 12; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(12);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0013
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0013
     * @tc.desc   Create and exercise controller vector 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 13; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(13);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0014
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0014
     * @tc.desc   Create and exercise controller vector 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 14; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(14);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0015
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0015
     * @tc.desc   Create and exercise controller vector 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 15; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(15);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0016
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0016
     * @tc.desc   Create and exercise controller vector 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 16; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(16);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0017
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0017
     * @tc.desc   Create and exercise controller vector 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 17; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(17);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0018
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0018
     * @tc.desc   Create and exercise controller vector 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 18; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(18);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0019
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0019
     * @tc.desc   Create and exercise controller vector 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 19; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(19);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0020
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0020
     * @tc.desc   Create and exercise controller vector 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 20; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(20);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0021
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0021
     * @tc.desc   Create and exercise controller vector 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 21; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(21);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0022
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0022
     * @tc.desc   Create and exercise controller vector 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 22; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(22);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0023
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0023
     * @tc.desc   Create and exercise controller vector 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 23; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(23);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0024
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0024
     * @tc.desc   Create and exercise controller vector 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 24; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(24);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0025
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0025
     * @tc.desc   Create and exercise controller vector 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 25; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(25);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0026
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0026
     * @tc.desc   Create and exercise controller vector 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 26; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(26);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0027
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0027
     * @tc.desc   Create and exercise controller vector 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 27; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(27);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0028
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0028
     * @tc.desc   Create and exercise controller vector 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 28; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(28);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0029
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0029
     * @tc.desc   Create and exercise controller vector 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 29; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(29);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0030
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0030
     * @tc.desc   Create and exercise controller vector 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 30; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(30);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0031
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0031
     * @tc.desc   Create and exercise controller vector 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 31; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(31);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0032
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0032
     * @tc.desc   Create and exercise controller vector 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 32; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(32);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0033
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0033
     * @tc.desc   Create and exercise controller vector 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 33; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(33);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0034
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0034
     * @tc.desc   Create and exercise controller vector 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 34; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(34);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0035
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0035
     * @tc.desc   Create and exercise controller vector 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 35; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(35);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0036
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0036
     * @tc.desc   Create and exercise controller vector 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 36; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(36);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0037
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0037
     * @tc.desc   Create and exercise controller vector 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 37; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(37);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0038
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0038
     * @tc.desc   Create and exercise controller vector 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 38; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(38);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0039
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0039
     * @tc.desc   Create and exercise controller vector 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 39; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(39);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0040
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0040
     * @tc.desc   Create and exercise controller vector 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 40; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(40);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0041
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0041
     * @tc.desc   Create and exercise controller vector 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 41; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(41);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0042
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0042
     * @tc.desc   Create and exercise controller vector 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 42; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(42);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0043
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0043
     * @tc.desc   Create and exercise controller vector 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 43; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(43);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0044
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0044
     * @tc.desc   Create and exercise controller vector 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 44; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(44);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0045
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0045
     * @tc.desc   Create and exercise controller vector 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 45; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(45);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0046
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0046
     * @tc.desc   Create and exercise controller vector 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 46; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(46);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0047
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0047
     * @tc.desc   Create and exercise controller vector 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 47; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(47);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0048
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0048
     * @tc.desc   Create and exercise controller vector 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 48; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(48);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0049
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0049
     * @tc.desc   Create and exercise controller vector 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 49; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(49);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0050
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0050
     * @tc.desc   Create and exercise controller vector 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 50; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(50);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0051
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0051
     * @tc.desc   Create and exercise controller vector 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 51; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(51);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0052
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0052
     * @tc.desc   Create and exercise controller vector 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 52; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(52);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0053
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0053
     * @tc.desc   Create and exercise controller vector 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 53; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(53);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0054
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0054
     * @tc.desc   Create and exercise controller vector 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 54; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(54);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0055
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0055
     * @tc.desc   Create and exercise controller vector 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 55; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(55);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0056
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0056
     * @tc.desc   Create and exercise controller vector 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 56; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(56);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0057
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0057
     * @tc.desc   Create and exercise controller vector 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 57; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(57);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0058
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0058
     * @tc.desc   Create and exercise controller vector 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 58; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(58);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0059
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0059
     * @tc.desc   Create and exercise controller vector 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 59; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(59);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })

    /**
     * @tc.name   testMpPlusControllerDeep0060
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_DEEP_0060
     * @tc.desc   Create and exercise controller vector 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusControllerDeep0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 60; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(60);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[0].stopPlayback === 'function').assertTrue();
      expect(controllers[controllers.length - 1] !== null).assertTrue();
      for (let index: number = 0; index < controllers.length; index++) {
        controllers[index].startPlayback();
        controllers[index].stopPlayback();
      }
      expect(controllers.length > 0).assertTrue();
    })
  })
}
