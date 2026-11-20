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

import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { MovingPhotoViewController } from '@kit.MediaLibraryKit';

export default function movingPhotoPlusControllerTest() {
  describe('MovingPhotoPlusControllerTest', () => {

    /**
     * @tc.name   testMpPlusController0001
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0001
     * @tc.desc   Create and exercise 1 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 1; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(1);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0002
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0002
     * @tc.desc   Create and exercise 2 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 2; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(2);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0003
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0003
     * @tc.desc   Create and exercise 3 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 3; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(3);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0004
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0004
     * @tc.desc   Create and exercise 4 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 4; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(4);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0005
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0005
     * @tc.desc   Create and exercise 5 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 5; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(5);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0006
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0006
     * @tc.desc   Create and exercise 6 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 6; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(6);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0007
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0007
     * @tc.desc   Create and exercise 7 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 7; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(7);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0008
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0008
     * @tc.desc   Create and exercise 8 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 8; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(8);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0009
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0009
     * @tc.desc   Create and exercise 9 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 9; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(9);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0010
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0010
     * @tc.desc   Create and exercise 10 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 10; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(10);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0011
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0011
     * @tc.desc   Create and exercise 11 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 11; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(11);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0012
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0012
     * @tc.desc   Create and exercise 12 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 12; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(12);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0013
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0013
     * @tc.desc   Create and exercise 13 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 13; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(13);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0014
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0014
     * @tc.desc   Create and exercise 14 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 14; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(14);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0015
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0015
     * @tc.desc   Create and exercise 15 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 15; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(15);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0016
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0016
     * @tc.desc   Create and exercise 16 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 16; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(16);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0017
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0017
     * @tc.desc   Create and exercise 17 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 17; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(17);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0018
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0018
     * @tc.desc   Create and exercise 18 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 18; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(18);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0019
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0019
     * @tc.desc   Create and exercise 19 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 19; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(19);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0020
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0020
     * @tc.desc   Create and exercise 20 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 20; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(20);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0021
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0021
     * @tc.desc   Create and exercise 21 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 21; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(21);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0022
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0022
     * @tc.desc   Create and exercise 22 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 22; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(22);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0023
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0023
     * @tc.desc   Create and exercise 23 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 23; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(23);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0024
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0024
     * @tc.desc   Create and exercise 24 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 24; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(24);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0025
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0025
     * @tc.desc   Create and exercise 25 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 25; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(25);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0026
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0026
     * @tc.desc   Create and exercise 26 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 26; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(26);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0027
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0027
     * @tc.desc   Create and exercise 27 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 27; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(27);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0028
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0028
     * @tc.desc   Create and exercise 28 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 28; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(28);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0029
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0029
     * @tc.desc   Create and exercise 29 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 29; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(29);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0030
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0030
     * @tc.desc   Create and exercise 30 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 30; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(30);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0031
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0031
     * @tc.desc   Create and exercise 31 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 31; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(31);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0032
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0032
     * @tc.desc   Create and exercise 32 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 32; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(32);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0033
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0033
     * @tc.desc   Create and exercise 33 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 33; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(33);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0034
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0034
     * @tc.desc   Create and exercise 34 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 34; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(34);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0035
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0035
     * @tc.desc   Create and exercise 35 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 35; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(35);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0036
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0036
     * @tc.desc   Create and exercise 36 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 36; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(36);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0037
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0037
     * @tc.desc   Create and exercise 37 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 37; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(37);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0038
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0038
     * @tc.desc   Create and exercise 38 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 38; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(38);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0039
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0039
     * @tc.desc   Create and exercise 39 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 39; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(39);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0040
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0040
     * @tc.desc   Create and exercise 40 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 40; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(40);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0041
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0041
     * @tc.desc   Create and exercise 41 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 41; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(41);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0042
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0042
     * @tc.desc   Create and exercise 42 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 42; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(42);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0043
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0043
     * @tc.desc   Create and exercise 43 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 43; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(43);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0044
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0044
     * @tc.desc   Create and exercise 44 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 44; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(44);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0045
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0045
     * @tc.desc   Create and exercise 45 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 45; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(45);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0046
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0046
     * @tc.desc   Create and exercise 46 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 46; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(46);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0047
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0047
     * @tc.desc   Create and exercise 47 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 47; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(47);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0048
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0048
     * @tc.desc   Create and exercise 48 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 48; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(48);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0049
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0049
     * @tc.desc   Create and exercise 49 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 49; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(49);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0050
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0050
     * @tc.desc   Create and exercise 50 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 50; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(50);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0051
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0051
     * @tc.desc   Create and exercise 51 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 51; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(51);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0052
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0052
     * @tc.desc   Create and exercise 52 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 52; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(52);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0053
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0053
     * @tc.desc   Create and exercise 53 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 53; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(53);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0054
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0054
     * @tc.desc   Create and exercise 54 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 54; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(54);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0055
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0055
     * @tc.desc   Create and exercise 55 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 55; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(55);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0056
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0056
     * @tc.desc   Create and exercise 56 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 56; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(56);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0057
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0057
     * @tc.desc   Create and exercise 57 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 57; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(57);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0058
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0058
     * @tc.desc   Create and exercise 58 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 58; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(58);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0059
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0059
     * @tc.desc   Create and exercise 59 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 59; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(59);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })

    /**
     * @tc.name   testMpPlusController0060
     * @tc.number MOVING_PHOTO_PLUS_CONTROLLER_0060
     * @tc.desc   Create and exercise 60 moving photo controller instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMpPlusController0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const controllers: MovingPhotoViewController[] = [];
      for (let index: number = 0; index < 60; index++) {
        controllers.push(new MovingPhotoViewController());
      }
      expect(controllers.length).assertEqual(60);
      expect(typeof controllers[0].startPlayback === 'function').assertTrue();
      expect(typeof controllers[controllers.length - 1].stopPlayback === 'function').assertTrue();
      if (controllers.length > 1) {
        expect(controllers[0] === controllers[1]).assertFalse();
      } else {
        expect(controllers[0] !== null).assertTrue();
      }
      controllers[0].startPlayback();
      controllers[0].stopPlayback();
    })
  })
}
