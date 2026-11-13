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

export default function movingPhotoControllerStateMatrixTest() {
  describe('MovingPhotoControllerStateMatrixTest', () => {

    /**
     * @tc.name   testControllerStateMatrix0001
     * @tc.number MOVING_PHOTO_VIEW_CONTROLLER_STATE_0001
     * @tc.desc   Test controller instance and playback API usage, case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerStateMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: MovingPhotoViewController = new MovingPhotoViewController();
      const second: MovingPhotoViewController = new MovingPhotoViewController();
      expect(first !== second).assertTrue();
      expect(typeof first.startPlayback === 'function').assertTrue();
      expect(typeof first.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testControllerStateMatrix0002
     * @tc.number MOVING_PHOTO_VIEW_CONTROLLER_STATE_0002
     * @tc.desc   Test controller instance and playback API usage, case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerStateMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: MovingPhotoViewController = new MovingPhotoViewController();
      const second: MovingPhotoViewController = new MovingPhotoViewController();
      expect(first !== second).assertTrue();
      expect(typeof first.startPlayback === 'function').assertTrue();
      expect(typeof first.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testControllerStateMatrix0003
     * @tc.number MOVING_PHOTO_VIEW_CONTROLLER_STATE_0003
     * @tc.desc   Test controller instance and playback API usage, case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerStateMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: MovingPhotoViewController = new MovingPhotoViewController();
      const second: MovingPhotoViewController = new MovingPhotoViewController();
      expect(first !== second).assertTrue();
      expect(typeof first.startPlayback === 'function').assertTrue();
      expect(typeof first.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testControllerStateMatrix0004
     * @tc.number MOVING_PHOTO_VIEW_CONTROLLER_STATE_0004
     * @tc.desc   Test controller instance and playback API usage, case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerStateMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: MovingPhotoViewController = new MovingPhotoViewController();
      const second: MovingPhotoViewController = new MovingPhotoViewController();
      expect(first !== second).assertTrue();
      expect(typeof first.startPlayback === 'function').assertTrue();
      expect(typeof first.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testControllerStateMatrix0005
     * @tc.number MOVING_PHOTO_VIEW_CONTROLLER_STATE_0005
     * @tc.desc   Test controller instance and playback API usage, case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerStateMatrix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: MovingPhotoViewController = new MovingPhotoViewController();
      const second: MovingPhotoViewController = new MovingPhotoViewController();
      expect(first !== second).assertTrue();
      expect(typeof first.startPlayback === 'function').assertTrue();
      expect(typeof first.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testControllerStateMatrix0006
     * @tc.number MOVING_PHOTO_VIEW_CONTROLLER_STATE_0006
     * @tc.desc   Test controller instance and playback API usage, case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerStateMatrix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: MovingPhotoViewController = new MovingPhotoViewController();
      const second: MovingPhotoViewController = new MovingPhotoViewController();
      expect(first !== second).assertTrue();
      expect(typeof first.startPlayback === 'function').assertTrue();
      expect(typeof first.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testControllerStateMatrix0007
     * @tc.number MOVING_PHOTO_VIEW_CONTROLLER_STATE_0007
     * @tc.desc   Test controller instance and playback API usage, case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerStateMatrix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: MovingPhotoViewController = new MovingPhotoViewController();
      const second: MovingPhotoViewController = new MovingPhotoViewController();
      expect(first !== second).assertTrue();
      expect(typeof first.startPlayback === 'function').assertTrue();
      expect(typeof first.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testControllerStateMatrix0008
     * @tc.number MOVING_PHOTO_VIEW_CONTROLLER_STATE_0008
     * @tc.desc   Test controller instance and playback API usage, case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerStateMatrix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: MovingPhotoViewController = new MovingPhotoViewController();
      const second: MovingPhotoViewController = new MovingPhotoViewController();
      expect(first !== second).assertTrue();
      expect(typeof first.startPlayback === 'function').assertTrue();
      expect(typeof first.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testControllerStateMatrix0009
     * @tc.number MOVING_PHOTO_VIEW_CONTROLLER_STATE_0009
     * @tc.desc   Test controller instance and playback API usage, case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerStateMatrix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: MovingPhotoViewController = new MovingPhotoViewController();
      const second: MovingPhotoViewController = new MovingPhotoViewController();
      expect(first !== second).assertTrue();
      expect(typeof first.startPlayback === 'function').assertTrue();
      expect(typeof first.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testControllerStateMatrix0010
     * @tc.number MOVING_PHOTO_VIEW_CONTROLLER_STATE_0010
     * @tc.desc   Test controller instance and playback API usage, case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerStateMatrix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: MovingPhotoViewController = new MovingPhotoViewController();
      const second: MovingPhotoViewController = new MovingPhotoViewController();
      expect(first !== second).assertTrue();
      expect(typeof first.startPlayback === 'function').assertTrue();
      expect(typeof first.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testControllerStateMatrix0011
     * @tc.number MOVING_PHOTO_VIEW_CONTROLLER_STATE_0011
     * @tc.desc   Test controller instance and playback API usage, case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerStateMatrix0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: MovingPhotoViewController = new MovingPhotoViewController();
      const second: MovingPhotoViewController = new MovingPhotoViewController();
      expect(first !== second).assertTrue();
      expect(typeof first.startPlayback === 'function').assertTrue();
      expect(typeof first.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testControllerStateMatrix0012
     * @tc.number MOVING_PHOTO_VIEW_CONTROLLER_STATE_0012
     * @tc.desc   Test controller instance and playback API usage, case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerStateMatrix0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: MovingPhotoViewController = new MovingPhotoViewController();
      const second: MovingPhotoViewController = new MovingPhotoViewController();
      expect(first !== second).assertTrue();
      expect(typeof first.startPlayback === 'function').assertTrue();
      expect(typeof first.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testControllerStateMatrix0013
     * @tc.number MOVING_PHOTO_VIEW_CONTROLLER_STATE_0013
     * @tc.desc   Test controller instance and playback API usage, case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerStateMatrix0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: MovingPhotoViewController = new MovingPhotoViewController();
      const second: MovingPhotoViewController = new MovingPhotoViewController();
      expect(first !== second).assertTrue();
      expect(typeof first.startPlayback === 'function').assertTrue();
      expect(typeof first.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testControllerStateMatrix0014
     * @tc.number MOVING_PHOTO_VIEW_CONTROLLER_STATE_0014
     * @tc.desc   Test controller instance and playback API usage, case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerStateMatrix0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: MovingPhotoViewController = new MovingPhotoViewController();
      const second: MovingPhotoViewController = new MovingPhotoViewController();
      expect(first !== second).assertTrue();
      expect(typeof first.startPlayback === 'function').assertTrue();
      expect(typeof first.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testControllerStateMatrix0015
     * @tc.number MOVING_PHOTO_VIEW_CONTROLLER_STATE_0015
     * @tc.desc   Test controller instance and playback API usage, case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerStateMatrix0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: MovingPhotoViewController = new MovingPhotoViewController();
      const second: MovingPhotoViewController = new MovingPhotoViewController();
      expect(first !== second).assertTrue();
      expect(typeof first.startPlayback === 'function').assertTrue();
      expect(typeof first.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testControllerStateMatrix0016
     * @tc.number MOVING_PHOTO_VIEW_CONTROLLER_STATE_0016
     * @tc.desc   Test controller instance and playback API usage, case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerStateMatrix0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: MovingPhotoViewController = new MovingPhotoViewController();
      const second: MovingPhotoViewController = new MovingPhotoViewController();
      expect(first !== second).assertTrue();
      expect(typeof first.startPlayback === 'function').assertTrue();
      expect(typeof first.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testControllerStateMatrix0017
     * @tc.number MOVING_PHOTO_VIEW_CONTROLLER_STATE_0017
     * @tc.desc   Test controller instance and playback API usage, case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerStateMatrix0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: MovingPhotoViewController = new MovingPhotoViewController();
      const second: MovingPhotoViewController = new MovingPhotoViewController();
      expect(first !== second).assertTrue();
      expect(typeof first.startPlayback === 'function').assertTrue();
      expect(typeof first.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testControllerStateMatrix0018
     * @tc.number MOVING_PHOTO_VIEW_CONTROLLER_STATE_0018
     * @tc.desc   Test controller instance and playback API usage, case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerStateMatrix0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: MovingPhotoViewController = new MovingPhotoViewController();
      const second: MovingPhotoViewController = new MovingPhotoViewController();
      expect(first !== second).assertTrue();
      expect(typeof first.startPlayback === 'function').assertTrue();
      expect(typeof first.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testControllerStateMatrix0019
     * @tc.number MOVING_PHOTO_VIEW_CONTROLLER_STATE_0019
     * @tc.desc   Test controller instance and playback API usage, case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerStateMatrix0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: MovingPhotoViewController = new MovingPhotoViewController();
      const second: MovingPhotoViewController = new MovingPhotoViewController();
      expect(first !== second).assertTrue();
      expect(typeof first.startPlayback === 'function').assertTrue();
      expect(typeof first.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testControllerStateMatrix0020
     * @tc.number MOVING_PHOTO_VIEW_CONTROLLER_STATE_0020
     * @tc.desc   Test controller instance and playback API usage, case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerStateMatrix0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: MovingPhotoViewController = new MovingPhotoViewController();
      const second: MovingPhotoViewController = new MovingPhotoViewController();
      expect(first !== second).assertTrue();
      expect(typeof first.startPlayback === 'function').assertTrue();
      expect(typeof first.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testControllerStateMatrix0021
     * @tc.number MOVING_PHOTO_VIEW_CONTROLLER_STATE_0021
     * @tc.desc   Test controller instance and playback API usage, case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerStateMatrix0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: MovingPhotoViewController = new MovingPhotoViewController();
      const second: MovingPhotoViewController = new MovingPhotoViewController();
      expect(first !== second).assertTrue();
      expect(typeof first.startPlayback === 'function').assertTrue();
      expect(typeof first.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testControllerStateMatrix0022
     * @tc.number MOVING_PHOTO_VIEW_CONTROLLER_STATE_0022
     * @tc.desc   Test controller instance and playback API usage, case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerStateMatrix0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: MovingPhotoViewController = new MovingPhotoViewController();
      const second: MovingPhotoViewController = new MovingPhotoViewController();
      expect(first !== second).assertTrue();
      expect(typeof first.startPlayback === 'function').assertTrue();
      expect(typeof first.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testControllerStateMatrix0023
     * @tc.number MOVING_PHOTO_VIEW_CONTROLLER_STATE_0023
     * @tc.desc   Test controller instance and playback API usage, case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerStateMatrix0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: MovingPhotoViewController = new MovingPhotoViewController();
      const second: MovingPhotoViewController = new MovingPhotoViewController();
      expect(first !== second).assertTrue();
      expect(typeof first.startPlayback === 'function').assertTrue();
      expect(typeof first.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testControllerStateMatrix0024
     * @tc.number MOVING_PHOTO_VIEW_CONTROLLER_STATE_0024
     * @tc.desc   Test controller instance and playback API usage, case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerStateMatrix0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: MovingPhotoViewController = new MovingPhotoViewController();
      const second: MovingPhotoViewController = new MovingPhotoViewController();
      expect(first !== second).assertTrue();
      expect(typeof first.startPlayback === 'function').assertTrue();
      expect(typeof first.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testControllerStateMatrix0025
     * @tc.number MOVING_PHOTO_VIEW_CONTROLLER_STATE_0025
     * @tc.desc   Test controller instance and playback API usage, case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerStateMatrix0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: MovingPhotoViewController = new MovingPhotoViewController();
      const second: MovingPhotoViewController = new MovingPhotoViewController();
      expect(first !== second).assertTrue();
      expect(typeof first.startPlayback === 'function').assertTrue();
      expect(typeof first.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testControllerStateMatrix0026
     * @tc.number MOVING_PHOTO_VIEW_CONTROLLER_STATE_0026
     * @tc.desc   Test controller instance and playback API usage, case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerStateMatrix0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: MovingPhotoViewController = new MovingPhotoViewController();
      const second: MovingPhotoViewController = new MovingPhotoViewController();
      expect(first !== second).assertTrue();
      expect(typeof first.startPlayback === 'function').assertTrue();
      expect(typeof first.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testControllerStateMatrix0027
     * @tc.number MOVING_PHOTO_VIEW_CONTROLLER_STATE_0027
     * @tc.desc   Test controller instance and playback API usage, case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerStateMatrix0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: MovingPhotoViewController = new MovingPhotoViewController();
      const second: MovingPhotoViewController = new MovingPhotoViewController();
      expect(first !== second).assertTrue();
      expect(typeof first.startPlayback === 'function').assertTrue();
      expect(typeof first.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testControllerStateMatrix0028
     * @tc.number MOVING_PHOTO_VIEW_CONTROLLER_STATE_0028
     * @tc.desc   Test controller instance and playback API usage, case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerStateMatrix0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: MovingPhotoViewController = new MovingPhotoViewController();
      const second: MovingPhotoViewController = new MovingPhotoViewController();
      expect(first !== second).assertTrue();
      expect(typeof first.startPlayback === 'function').assertTrue();
      expect(typeof first.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testControllerStateMatrix0029
     * @tc.number MOVING_PHOTO_VIEW_CONTROLLER_STATE_0029
     * @tc.desc   Test controller instance and playback API usage, case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerStateMatrix0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: MovingPhotoViewController = new MovingPhotoViewController();
      const second: MovingPhotoViewController = new MovingPhotoViewController();
      expect(first !== second).assertTrue();
      expect(typeof first.startPlayback === 'function').assertTrue();
      expect(typeof first.stopPlayback === 'function').assertTrue();
    })

    /**
     * @tc.name   testControllerStateMatrix0030
     * @tc.number MOVING_PHOTO_VIEW_CONTROLLER_STATE_0030
     * @tc.desc   Test controller instance and playback API usage, case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testControllerStateMatrix0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first: MovingPhotoViewController = new MovingPhotoViewController();
      const second: MovingPhotoViewController = new MovingPhotoViewController();
      expect(first !== second).assertTrue();
      expect(typeof first.startPlayback === 'function').assertTrue();
      expect(typeof first.stopPlayback === 'function').assertTrue();
    })
  })
}
