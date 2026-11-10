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

export default function mediaTimelineMoreTest() {
  describe('mediaTimelineMoreTest', () => {
    /**
     * @tc.number    SUB_AVS_MORE_MT_0001
     * @tc.name      testMoreMediaTimeline0001
     * @tc.desc      1000ms at 24fps maps to 24 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 1000;
      const fps: number = 24;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(24);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0002
     * @tc.name      testMoreMediaTimeline0002
     * @tc.desc      1050ms at 25fps maps to 26 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 1050;
      const fps: number = 25;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(26);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0003
     * @tc.name      testMoreMediaTimeline0003
     * @tc.desc      1100ms at 30fps maps to 33 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 1100;
      const fps: number = 30;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(33);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0004
     * @tc.name      testMoreMediaTimeline0004
     * @tc.desc      1150ms at 50fps maps to 57 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 1150;
      const fps: number = 50;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(57);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0005
     * @tc.name      testMoreMediaTimeline0005
     * @tc.desc      1200ms at 60fps maps to 72 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 1200;
      const fps: number = 60;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(72);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0006
     * @tc.name      testMoreMediaTimeline0006
     * @tc.desc      1250ms at 24fps maps to 30 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 1250;
      const fps: number = 24;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(30);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0007
     * @tc.name      testMoreMediaTimeline0007
     * @tc.desc      1300ms at 25fps maps to 32 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 1300;
      const fps: number = 25;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(32);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0008
     * @tc.name      testMoreMediaTimeline0008
     * @tc.desc      1350ms at 30fps maps to 40 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 1350;
      const fps: number = 30;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(40);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0009
     * @tc.name      testMoreMediaTimeline0009
     * @tc.desc      1400ms at 50fps maps to 70 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 1400;
      const fps: number = 50;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(70);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0010
     * @tc.name      testMoreMediaTimeline0010
     * @tc.desc      1450ms at 60fps maps to 87 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 1450;
      const fps: number = 60;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(87);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0011
     * @tc.name      testMoreMediaTimeline0011
     * @tc.desc      1500ms at 24fps maps to 36 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 1500;
      const fps: number = 24;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(36);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0012
     * @tc.name      testMoreMediaTimeline0012
     * @tc.desc      1550ms at 25fps maps to 38 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 1550;
      const fps: number = 25;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(38);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0013
     * @tc.name      testMoreMediaTimeline0013
     * @tc.desc      1600ms at 30fps maps to 48 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 1600;
      const fps: number = 30;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(48);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0014
     * @tc.name      testMoreMediaTimeline0014
     * @tc.desc      1650ms at 50fps maps to 82 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 1650;
      const fps: number = 50;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(82);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0015
     * @tc.name      testMoreMediaTimeline0015
     * @tc.desc      1700ms at 60fps maps to 102 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 1700;
      const fps: number = 60;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(102);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0016
     * @tc.name      testMoreMediaTimeline0016
     * @tc.desc      1750ms at 24fps maps to 42 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 1750;
      const fps: number = 24;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(42);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0017
     * @tc.name      testMoreMediaTimeline0017
     * @tc.desc      1800ms at 25fps maps to 45 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 1800;
      const fps: number = 25;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(45);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0018
     * @tc.name      testMoreMediaTimeline0018
     * @tc.desc      1850ms at 30fps maps to 55 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 1850;
      const fps: number = 30;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(55);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0019
     * @tc.name      testMoreMediaTimeline0019
     * @tc.desc      1900ms at 50fps maps to 95 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 1900;
      const fps: number = 50;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(95);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0020
     * @tc.name      testMoreMediaTimeline0020
     * @tc.desc      1950ms at 60fps maps to 117 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 1950;
      const fps: number = 60;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(117);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0021
     * @tc.name      testMoreMediaTimeline0021
     * @tc.desc      2000ms at 24fps maps to 48 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 2000;
      const fps: number = 24;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(48);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0022
     * @tc.name      testMoreMediaTimeline0022
     * @tc.desc      2050ms at 25fps maps to 51 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 2050;
      const fps: number = 25;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(51);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0023
     * @tc.name      testMoreMediaTimeline0023
     * @tc.desc      2100ms at 30fps maps to 63 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 2100;
      const fps: number = 30;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(63);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0024
     * @tc.name      testMoreMediaTimeline0024
     * @tc.desc      2150ms at 50fps maps to 107 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 2150;
      const fps: number = 50;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(107);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0025
     * @tc.name      testMoreMediaTimeline0025
     * @tc.desc      2200ms at 60fps maps to 132 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 2200;
      const fps: number = 60;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(132);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0026
     * @tc.name      testMoreMediaTimeline0026
     * @tc.desc      2250ms at 24fps maps to 54 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 2250;
      const fps: number = 24;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(54);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0027
     * @tc.name      testMoreMediaTimeline0027
     * @tc.desc      2300ms at 25fps maps to 57 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 2300;
      const fps: number = 25;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(57);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0028
     * @tc.name      testMoreMediaTimeline0028
     * @tc.desc      2350ms at 30fps maps to 70 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 2350;
      const fps: number = 30;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(70);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0029
     * @tc.name      testMoreMediaTimeline0029
     * @tc.desc      2400ms at 50fps maps to 120 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 2400;
      const fps: number = 50;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(120);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0030
     * @tc.name      testMoreMediaTimeline0030
     * @tc.desc      2450ms at 60fps maps to 147 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 2450;
      const fps: number = 60;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(147);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0031
     * @tc.name      testMoreMediaTimeline0031
     * @tc.desc      2500ms at 24fps maps to 60 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 2500;
      const fps: number = 24;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(60);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0032
     * @tc.name      testMoreMediaTimeline0032
     * @tc.desc      2550ms at 25fps maps to 63 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 2550;
      const fps: number = 25;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(63);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0033
     * @tc.name      testMoreMediaTimeline0033
     * @tc.desc      2600ms at 30fps maps to 78 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 2600;
      const fps: number = 30;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(78);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0034
     * @tc.name      testMoreMediaTimeline0034
     * @tc.desc      2650ms at 50fps maps to 132 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 2650;
      const fps: number = 50;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(132);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0035
     * @tc.name      testMoreMediaTimeline0035
     * @tc.desc      2700ms at 60fps maps to 162 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 2700;
      const fps: number = 60;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(162);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0036
     * @tc.name      testMoreMediaTimeline0036
     * @tc.desc      2750ms at 24fps maps to 66 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 2750;
      const fps: number = 24;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(66);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0037
     * @tc.name      testMoreMediaTimeline0037
     * @tc.desc      2800ms at 25fps maps to 70 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 2800;
      const fps: number = 25;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(70);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0038
     * @tc.name      testMoreMediaTimeline0038
     * @tc.desc      2850ms at 30fps maps to 85 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 2850;
      const fps: number = 30;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(85);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0039
     * @tc.name      testMoreMediaTimeline0039
     * @tc.desc      2900ms at 50fps maps to 145 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 2900;
      const fps: number = 50;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(145);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0040
     * @tc.name      testMoreMediaTimeline0040
     * @tc.desc      2950ms at 60fps maps to 177 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 2950;
      const fps: number = 60;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(177);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0041
     * @tc.name      testMoreMediaTimeline0041
     * @tc.desc      3000ms at 24fps maps to 72 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 3000;
      const fps: number = 24;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(72);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0042
     * @tc.name      testMoreMediaTimeline0042
     * @tc.desc      3050ms at 25fps maps to 76 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 3050;
      const fps: number = 25;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(76);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0043
     * @tc.name      testMoreMediaTimeline0043
     * @tc.desc      3100ms at 30fps maps to 93 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 3100;
      const fps: number = 30;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(93);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0044
     * @tc.name      testMoreMediaTimeline0044
     * @tc.desc      3150ms at 50fps maps to 157 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 3150;
      const fps: number = 50;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(157);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0045
     * @tc.name      testMoreMediaTimeline0045
     * @tc.desc      3200ms at 60fps maps to 192 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 3200;
      const fps: number = 60;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(192);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0046
     * @tc.name      testMoreMediaTimeline0046
     * @tc.desc      3250ms at 24fps maps to 78 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 3250;
      const fps: number = 24;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(78);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0047
     * @tc.name      testMoreMediaTimeline0047
     * @tc.desc      3300ms at 25fps maps to 82 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 3300;
      const fps: number = 25;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(82);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0048
     * @tc.name      testMoreMediaTimeline0048
     * @tc.desc      3350ms at 30fps maps to 100 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 3350;
      const fps: number = 30;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(100);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0049
     * @tc.name      testMoreMediaTimeline0049
     * @tc.desc      3400ms at 50fps maps to 170 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 3400;
      const fps: number = 50;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(170);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0050
     * @tc.name      testMoreMediaTimeline0050
     * @tc.desc      3450ms at 60fps maps to 207 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 3450;
      const fps: number = 60;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(207);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0051
     * @tc.name      testMoreMediaTimeline0051
     * @tc.desc      3500ms at 24fps maps to 84 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 3500;
      const fps: number = 24;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(84);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0052
     * @tc.name      testMoreMediaTimeline0052
     * @tc.desc      3550ms at 25fps maps to 88 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 3550;
      const fps: number = 25;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(88);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0053
     * @tc.name      testMoreMediaTimeline0053
     * @tc.desc      3600ms at 30fps maps to 108 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 3600;
      const fps: number = 30;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(108);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0054
     * @tc.name      testMoreMediaTimeline0054
     * @tc.desc      3650ms at 50fps maps to 182 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 3650;
      const fps: number = 50;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(182);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0055
     * @tc.name      testMoreMediaTimeline0055
     * @tc.desc      3700ms at 60fps maps to 222 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 3700;
      const fps: number = 60;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(222);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0056
     * @tc.name      testMoreMediaTimeline0056
     * @tc.desc      3750ms at 24fps maps to 90 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 3750;
      const fps: number = 24;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(90);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0057
     * @tc.name      testMoreMediaTimeline0057
     * @tc.desc      3800ms at 25fps maps to 95 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 3800;
      const fps: number = 25;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(95);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0058
     * @tc.name      testMoreMediaTimeline0058
     * @tc.desc      3850ms at 30fps maps to 115 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 3850;
      const fps: number = 30;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(115);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0059
     * @tc.name      testMoreMediaTimeline0059
     * @tc.desc      3900ms at 50fps maps to 195 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 3900;
      const fps: number = 50;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(195);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0060
     * @tc.name      testMoreMediaTimeline0060
     * @tc.desc      3950ms at 60fps maps to 237 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 3950;
      const fps: number = 60;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(237);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0061
     * @tc.name      testMoreMediaTimeline0061
     * @tc.desc      4000ms at 24fps maps to 96 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 4000;
      const fps: number = 24;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(96);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0062
     * @tc.name      testMoreMediaTimeline0062
     * @tc.desc      4050ms at 25fps maps to 101 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 4050;
      const fps: number = 25;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(101);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0063
     * @tc.name      testMoreMediaTimeline0063
     * @tc.desc      4100ms at 30fps maps to 123 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 4100;
      const fps: number = 30;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(123);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0064
     * @tc.name      testMoreMediaTimeline0064
     * @tc.desc      4150ms at 50fps maps to 207 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 4150;
      const fps: number = 50;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(207);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0065
     * @tc.name      testMoreMediaTimeline0065
     * @tc.desc      4200ms at 60fps maps to 252 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 4200;
      const fps: number = 60;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(252);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0066
     * @tc.name      testMoreMediaTimeline0066
     * @tc.desc      4250ms at 24fps maps to 102 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 4250;
      const fps: number = 24;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(102);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0067
     * @tc.name      testMoreMediaTimeline0067
     * @tc.desc      4300ms at 25fps maps to 107 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 4300;
      const fps: number = 25;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(107);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0068
     * @tc.name      testMoreMediaTimeline0068
     * @tc.desc      4350ms at 30fps maps to 130 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 4350;
      const fps: number = 30;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(130);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0069
     * @tc.name      testMoreMediaTimeline0069
     * @tc.desc      4400ms at 50fps maps to 220 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 4400;
      const fps: number = 50;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(220);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0070
     * @tc.name      testMoreMediaTimeline0070
     * @tc.desc      4450ms at 60fps maps to 267 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 4450;
      const fps: number = 60;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(267);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0071
     * @tc.name      testMoreMediaTimeline0071
     * @tc.desc      4500ms at 24fps maps to 108 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 4500;
      const fps: number = 24;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(108);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0072
     * @tc.name      testMoreMediaTimeline0072
     * @tc.desc      4550ms at 25fps maps to 113 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 4550;
      const fps: number = 25;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(113);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0073
     * @tc.name      testMoreMediaTimeline0073
     * @tc.desc      4600ms at 30fps maps to 138 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 4600;
      const fps: number = 30;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(138);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0074
     * @tc.name      testMoreMediaTimeline0074
     * @tc.desc      4650ms at 50fps maps to 232 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 4650;
      const fps: number = 50;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(232);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0075
     * @tc.name      testMoreMediaTimeline0075
     * @tc.desc      4700ms at 60fps maps to 282 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 4700;
      const fps: number = 60;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(282);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0076
     * @tc.name      testMoreMediaTimeline0076
     * @tc.desc      4750ms at 24fps maps to 114 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 4750;
      const fps: number = 24;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(114);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0077
     * @tc.name      testMoreMediaTimeline0077
     * @tc.desc      4800ms at 25fps maps to 120 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 4800;
      const fps: number = 25;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(120);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0078
     * @tc.name      testMoreMediaTimeline0078
     * @tc.desc      4850ms at 30fps maps to 145 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 4850;
      const fps: number = 30;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(145);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0079
     * @tc.name      testMoreMediaTimeline0079
     * @tc.desc      4900ms at 50fps maps to 245 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 4900;
      const fps: number = 50;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(245);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0080
     * @tc.name      testMoreMediaTimeline0080
     * @tc.desc      4950ms at 60fps maps to 297 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 4950;
      const fps: number = 60;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(297);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0081
     * @tc.name      testMoreMediaTimeline0081
     * @tc.desc      5000ms at 24fps maps to 120 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 5000;
      const fps: number = 24;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(120);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0082
     * @tc.name      testMoreMediaTimeline0082
     * @tc.desc      5050ms at 25fps maps to 126 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 5050;
      const fps: number = 25;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(126);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0083
     * @tc.name      testMoreMediaTimeline0083
     * @tc.desc      5100ms at 30fps maps to 153 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 5100;
      const fps: number = 30;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(153);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0084
     * @tc.name      testMoreMediaTimeline0084
     * @tc.desc      5150ms at 50fps maps to 257 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 5150;
      const fps: number = 50;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(257);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0085
     * @tc.name      testMoreMediaTimeline0085
     * @tc.desc      5200ms at 60fps maps to 312 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 5200;
      const fps: number = 60;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(312);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_MORE_MT_0086
     * @tc.name      testMoreMediaTimeline0086
     * @tc.desc      5250ms at 24fps maps to 126 frames.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMoreMediaTimeline0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const durationMs: number = 5250;
      const fps: number = 24;
      const frames: number = Math.floor(durationMs * fps / 1000);
      expect(frames).assertEqual(126);
      expect(durationMs).assertLarger(0);
      expect(fps).assertLarger(0);
      expect(frames >= 0).assertTrue();
    })
  })
}
