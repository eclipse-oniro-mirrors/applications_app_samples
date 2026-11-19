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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ParticleCamera } from '../model/ComponentSampleLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentCollection]';
const BUNDLE: string = 'ComponentCollection_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new ParticleCamera (49 cases). */
export default function particleCameraCtorTest(): void {
  describe('ParticleCameraCtorTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0001
     * @tc.name      ComponentCollection_ParticleCameraCtor_0001
     * @tc.desc      new ParticleCamera(0, 0) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_ParticleCameraCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0001 begin`);
      const subject: ParticleCamera = new ParticleCamera(0, 0);
      logInfo(`new ParticleCamera(0, 0): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(0, 0): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(0);
      logInfo(`new ParticleCamera(0, 0): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(0, 0): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(0);
      logInfo(`new ParticleCamera(0, 0): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(0, 0): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0001 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0002
     * @tc.name      ComponentCollection_ParticleCameraCtor_0002
     * @tc.desc      new ParticleCamera(1, 0) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_ParticleCameraCtor_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0002 begin`);
      const subject: ParticleCamera = new ParticleCamera(1, 0);
      logInfo(`new ParticleCamera(1, 0): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(1, 0): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(1);
      logInfo(`new ParticleCamera(1, 0): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(1, 0): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(0);
      logInfo(`new ParticleCamera(1, 0): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(1, 0): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0002 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0003
     * @tc.name      ComponentCollection_ParticleCameraCtor_0003
     * @tc.desc      new ParticleCamera(-1, 0) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0003 begin`);
      const subject: ParticleCamera = new ParticleCamera(-1, 0);
      logInfo(`new ParticleCamera(-1, 0): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(-1, 0): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(-1);
      logInfo(`new ParticleCamera(-1, 0): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(-1, 0): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(0);
      logInfo(`new ParticleCamera(-1, 0): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(-1, 0): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0003 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0004
     * @tc.name      ComponentCollection_ParticleCameraCtor_0004
     * @tc.desc      new ParticleCamera(2, 0) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0004 begin`);
      const subject: ParticleCamera = new ParticleCamera(2, 0);
      logInfo(`new ParticleCamera(2, 0): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(2, 0): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(2);
      logInfo(`new ParticleCamera(2, 0): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(2, 0): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(0);
      logInfo(`new ParticleCamera(2, 0): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(2, 0): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0004 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0005
     * @tc.name      ComponentCollection_ParticleCameraCtor_0005
     * @tc.desc      new ParticleCamera(3, 0) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0005 begin`);
      const subject: ParticleCamera = new ParticleCamera(3, 0);
      logInfo(`new ParticleCamera(3, 0): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(3, 0): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(3);
      logInfo(`new ParticleCamera(3, 0): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(3, 0): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(0);
      logInfo(`new ParticleCamera(3, 0): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(3, 0): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0005 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0006
     * @tc.name      ComponentCollection_ParticleCameraCtor_0006
     * @tc.desc      new ParticleCamera(10, 0) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0006 begin`);
      const subject: ParticleCamera = new ParticleCamera(10, 0);
      logInfo(`new ParticleCamera(10, 0): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(10, 0): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(10);
      logInfo(`new ParticleCamera(10, 0): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(10, 0): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(0);
      logInfo(`new ParticleCamera(10, 0): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(10, 0): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0006 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0007
     * @tc.name      ComponentCollection_ParticleCameraCtor_0007
     * @tc.desc      new ParticleCamera(100, 0) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0007 begin`);
      const subject: ParticleCamera = new ParticleCamera(100, 0);
      logInfo(`new ParticleCamera(100, 0): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(100, 0): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(100);
      logInfo(`new ParticleCamera(100, 0): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(100, 0): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(0);
      logInfo(`new ParticleCamera(100, 0): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(100, 0): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0007 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0008
     * @tc.name      ComponentCollection_ParticleCameraCtor_0008
     * @tc.desc      new ParticleCamera(5, 0) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0008 begin`);
      const subject: ParticleCamera = new ParticleCamera(5, 0);
      logInfo(`new ParticleCamera(5, 0): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(5, 0): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(5);
      logInfo(`new ParticleCamera(5, 0): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(5, 0): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(0);
      logInfo(`new ParticleCamera(5, 0): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(5, 0): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0008 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0009
     * @tc.name      ComponentCollection_ParticleCameraCtor_0009
     * @tc.desc      new ParticleCamera(15, 0) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0009 begin`);
      const subject: ParticleCamera = new ParticleCamera(15, 0);
      logInfo(`new ParticleCamera(15, 0): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(15, 0): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(15);
      logInfo(`new ParticleCamera(15, 0): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(15, 0): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(0);
      logInfo(`new ParticleCamera(15, 0): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(15, 0): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0009 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0010
     * @tc.name      ComponentCollection_ParticleCameraCtor_0010
     * @tc.desc      new ParticleCamera(20, 0) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0010 begin`);
      const subject: ParticleCamera = new ParticleCamera(20, 0);
      logInfo(`new ParticleCamera(20, 0): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(20, 0): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(20);
      logInfo(`new ParticleCamera(20, 0): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(20, 0): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(0);
      logInfo(`new ParticleCamera(20, 0): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(20, 0): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0010 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0011
     * @tc.name      ComponentCollection_ParticleCameraCtor_0011
     * @tc.desc      new ParticleCamera(25, 0) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0011 begin`);
      const subject: ParticleCamera = new ParticleCamera(25, 0);
      logInfo(`new ParticleCamera(25, 0): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(25, 0): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(25);
      logInfo(`new ParticleCamera(25, 0): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(25, 0): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(0);
      logInfo(`new ParticleCamera(25, 0): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(25, 0): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0011 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0012
     * @tc.name      ComponentCollection_ParticleCameraCtor_0012
     * @tc.desc      new ParticleCamera(30, 0) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0012 begin`);
      const subject: ParticleCamera = new ParticleCamera(30, 0);
      logInfo(`new ParticleCamera(30, 0): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(30, 0): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(30);
      logInfo(`new ParticleCamera(30, 0): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(30, 0): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(0);
      logInfo(`new ParticleCamera(30, 0): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(30, 0): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0012 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0013
     * @tc.name      ComponentCollection_ParticleCameraCtor_0013
     * @tc.desc      new ParticleCamera(35, 0) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0013 begin`);
      const subject: ParticleCamera = new ParticleCamera(35, 0);
      logInfo(`new ParticleCamera(35, 0): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(35, 0): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(35);
      logInfo(`new ParticleCamera(35, 0): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(35, 0): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(0);
      logInfo(`new ParticleCamera(35, 0): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(35, 0): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0013 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0014
     * @tc.name      ComponentCollection_ParticleCameraCtor_0014
     * @tc.desc      new ParticleCamera(40, 0) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0014 begin`);
      const subject: ParticleCamera = new ParticleCamera(40, 0);
      logInfo(`new ParticleCamera(40, 0): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(40, 0): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(40);
      logInfo(`new ParticleCamera(40, 0): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(40, 0): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(0);
      logInfo(`new ParticleCamera(40, 0): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(40, 0): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0014 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0015
     * @tc.name      ComponentCollection_ParticleCameraCtor_0015
     * @tc.desc      new ParticleCamera(45, 0) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0015 begin`);
      const subject: ParticleCamera = new ParticleCamera(45, 0);
      logInfo(`new ParticleCamera(45, 0): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(45, 0): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(45);
      logInfo(`new ParticleCamera(45, 0): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(45, 0): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(0);
      logInfo(`new ParticleCamera(45, 0): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(45, 0): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0015 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0016
     * @tc.name      ComponentCollection_ParticleCameraCtor_0016
     * @tc.desc      new ParticleCamera(50, 0) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0016 begin`);
      const subject: ParticleCamera = new ParticleCamera(50, 0);
      logInfo(`new ParticleCamera(50, 0): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(50, 0): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(50);
      logInfo(`new ParticleCamera(50, 0): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(50, 0): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(0);
      logInfo(`new ParticleCamera(50, 0): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(50, 0): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0016 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0017
     * @tc.name      ComponentCollection_ParticleCameraCtor_0017
     * @tc.desc      new ParticleCamera(55, 0) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0017 begin`);
      const subject: ParticleCamera = new ParticleCamera(55, 0);
      logInfo(`new ParticleCamera(55, 0): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(55, 0): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(55);
      logInfo(`new ParticleCamera(55, 0): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(55, 0): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(0);
      logInfo(`new ParticleCamera(55, 0): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(55, 0): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0017 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0018
     * @tc.name      ComponentCollection_ParticleCameraCtor_0018
     * @tc.desc      new ParticleCamera(60, 0) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0018 begin`);
      const subject: ParticleCamera = new ParticleCamera(60, 0);
      logInfo(`new ParticleCamera(60, 0): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(60, 0): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(60);
      logInfo(`new ParticleCamera(60, 0): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(60, 0): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(0);
      logInfo(`new ParticleCamera(60, 0): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(60, 0): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0018 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0019
     * @tc.name      ComponentCollection_ParticleCameraCtor_0019
     * @tc.desc      new ParticleCamera(65, 0) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0019 begin`);
      const subject: ParticleCamera = new ParticleCamera(65, 0);
      logInfo(`new ParticleCamera(65, 0): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(65, 0): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(65);
      logInfo(`new ParticleCamera(65, 0): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(65, 0): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(0);
      logInfo(`new ParticleCamera(65, 0): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(65, 0): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0019 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0020
     * @tc.name      ComponentCollection_ParticleCameraCtor_0020
     * @tc.desc      new ParticleCamera(70, 0) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0020 begin`);
      const subject: ParticleCamera = new ParticleCamera(70, 0);
      logInfo(`new ParticleCamera(70, 0): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(70, 0): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(70);
      logInfo(`new ParticleCamera(70, 0): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(70, 0): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(0);
      logInfo(`new ParticleCamera(70, 0): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(70, 0): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0020 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0021
     * @tc.name      ComponentCollection_ParticleCameraCtor_0021
     * @tc.desc      new ParticleCamera(75, 0) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0021 begin`);
      const subject: ParticleCamera = new ParticleCamera(75, 0);
      logInfo(`new ParticleCamera(75, 0): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(75, 0): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(75);
      logInfo(`new ParticleCamera(75, 0): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(75, 0): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(0);
      logInfo(`new ParticleCamera(75, 0): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(75, 0): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0021 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0022
     * @tc.name      ComponentCollection_ParticleCameraCtor_0022
     * @tc.desc      new ParticleCamera(80, 0) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0022 begin`);
      const subject: ParticleCamera = new ParticleCamera(80, 0);
      logInfo(`new ParticleCamera(80, 0): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(80, 0): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(80);
      logInfo(`new ParticleCamera(80, 0): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(80, 0): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(0);
      logInfo(`new ParticleCamera(80, 0): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(80, 0): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0022 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0023
     * @tc.name      ComponentCollection_ParticleCameraCtor_0023
     * @tc.desc      new ParticleCamera(85, 0) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0023 begin`);
      const subject: ParticleCamera = new ParticleCamera(85, 0);
      logInfo(`new ParticleCamera(85, 0): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(85, 0): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(85);
      logInfo(`new ParticleCamera(85, 0): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(85, 0): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(0);
      logInfo(`new ParticleCamera(85, 0): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(85, 0): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0023 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0024
     * @tc.name      ComponentCollection_ParticleCameraCtor_0024
     * @tc.desc      new ParticleCamera(90, 0) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0024 begin`);
      const subject: ParticleCamera = new ParticleCamera(90, 0);
      logInfo(`new ParticleCamera(90, 0): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(90, 0): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(90);
      logInfo(`new ParticleCamera(90, 0): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(90, 0): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(0);
      logInfo(`new ParticleCamera(90, 0): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(90, 0): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0024 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0025
     * @tc.name      ComponentCollection_ParticleCameraCtor_0025
     * @tc.desc      new ParticleCamera(95, 0) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0025 begin`);
      const subject: ParticleCamera = new ParticleCamera(95, 0);
      logInfo(`new ParticleCamera(95, 0): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(95, 0): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(95);
      logInfo(`new ParticleCamera(95, 0): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(95, 0): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(0);
      logInfo(`new ParticleCamera(95, 0): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(95, 0): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0025 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0026
     * @tc.name      ComponentCollection_ParticleCameraCtor_0026
     * @tc.desc      new ParticleCamera(105, 0) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0026 begin`);
      const subject: ParticleCamera = new ParticleCamera(105, 0);
      logInfo(`new ParticleCamera(105, 0): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(105, 0): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(105);
      logInfo(`new ParticleCamera(105, 0): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(105, 0): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(0);
      logInfo(`new ParticleCamera(105, 0): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(105, 0): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0026 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0027
     * @tc.name      ComponentCollection_ParticleCameraCtor_0027
     * @tc.desc      new ParticleCamera(110, 0) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0027 begin`);
      const subject: ParticleCamera = new ParticleCamera(110, 0);
      logInfo(`new ParticleCamera(110, 0): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(110, 0): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(110);
      logInfo(`new ParticleCamera(110, 0): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(110, 0): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(0);
      logInfo(`new ParticleCamera(110, 0): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(110, 0): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0027 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0028
     * @tc.name      ComponentCollection_ParticleCameraCtor_0028
     * @tc.desc      new ParticleCamera(115, 0) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0028 begin`);
      const subject: ParticleCamera = new ParticleCamera(115, 0);
      logInfo(`new ParticleCamera(115, 0): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(115, 0): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(115);
      logInfo(`new ParticleCamera(115, 0): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(115, 0): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(0);
      logInfo(`new ParticleCamera(115, 0): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(115, 0): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0028 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0029
     * @tc.name      ComponentCollection_ParticleCameraCtor_0029
     * @tc.desc      new ParticleCamera(-56, 0) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0029 begin`);
      const subject: ParticleCamera = new ParticleCamera(-56, 0);
      logInfo(`new ParticleCamera(-56, 0): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(-56, 0): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(-56);
      logInfo(`new ParticleCamera(-56, 0): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(-56, 0): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(0);
      logInfo(`new ParticleCamera(-56, 0): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(-56, 0): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0029 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0030
     * @tc.name      ComponentCollection_ParticleCameraCtor_0030
     * @tc.desc      new ParticleCamera(17, 0) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0030 begin`);
      const subject: ParticleCamera = new ParticleCamera(17, 0);
      logInfo(`new ParticleCamera(17, 0): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(17, 0): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(17);
      logInfo(`new ParticleCamera(17, 0): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(17, 0): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(0);
      logInfo(`new ParticleCamera(17, 0): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(17, 0): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0030 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0031
     * @tc.name      ComponentCollection_ParticleCameraCtor_0031
     * @tc.desc      new ParticleCamera(0, 1) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0031 begin`);
      const subject: ParticleCamera = new ParticleCamera(0, 1);
      logInfo(`new ParticleCamera(0, 1): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(0, 1): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(0);
      logInfo(`new ParticleCamera(0, 1): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(0, 1): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(1);
      logInfo(`new ParticleCamera(0, 1): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(0, 1): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0031 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0032
     * @tc.name      ComponentCollection_ParticleCameraCtor_0032
     * @tc.desc      new ParticleCamera(0, -1) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0032 begin`);
      const subject: ParticleCamera = new ParticleCamera(0, -1);
      logInfo(`new ParticleCamera(0, -1): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(0, -1): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(0);
      logInfo(`new ParticleCamera(0, -1): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(0, -1): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(-1);
      logInfo(`new ParticleCamera(0, -1): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(0, -1): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0032 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0033
     * @tc.name      ComponentCollection_ParticleCameraCtor_0033
     * @tc.desc      new ParticleCamera(0, 2) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0033 begin`);
      const subject: ParticleCamera = new ParticleCamera(0, 2);
      logInfo(`new ParticleCamera(0, 2): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(0, 2): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(0);
      logInfo(`new ParticleCamera(0, 2): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(0, 2): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(2);
      logInfo(`new ParticleCamera(0, 2): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(0, 2): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0033 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0034
     * @tc.name      ComponentCollection_ParticleCameraCtor_0034
     * @tc.desc      new ParticleCamera(0, 3) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0034 begin`);
      const subject: ParticleCamera = new ParticleCamera(0, 3);
      logInfo(`new ParticleCamera(0, 3): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(0, 3): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(0);
      logInfo(`new ParticleCamera(0, 3): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(0, 3): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(3);
      logInfo(`new ParticleCamera(0, 3): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(0, 3): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0034 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0035
     * @tc.name      ComponentCollection_ParticleCameraCtor_0035
     * @tc.desc      new ParticleCamera(0, 10) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0035 begin`);
      const subject: ParticleCamera = new ParticleCamera(0, 10);
      logInfo(`new ParticleCamera(0, 10): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(0, 10): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(0);
      logInfo(`new ParticleCamera(0, 10): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(0, 10): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(10);
      logInfo(`new ParticleCamera(0, 10): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(0, 10): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0035 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0036
     * @tc.name      ComponentCollection_ParticleCameraCtor_0036
     * @tc.desc      new ParticleCamera(0, 100) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0036 begin`);
      const subject: ParticleCamera = new ParticleCamera(0, 100);
      logInfo(`new ParticleCamera(0, 100): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(0, 100): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(0);
      logInfo(`new ParticleCamera(0, 100): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(0, 100): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(100);
      logInfo(`new ParticleCamera(0, 100): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(0, 100): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0036 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0037
     * @tc.name      ComponentCollection_ParticleCameraCtor_0037
     * @tc.desc      new ParticleCamera(0, 5) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0037 begin`);
      const subject: ParticleCamera = new ParticleCamera(0, 5);
      logInfo(`new ParticleCamera(0, 5): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(0, 5): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(0);
      logInfo(`new ParticleCamera(0, 5): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(0, 5): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(5);
      logInfo(`new ParticleCamera(0, 5): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(0, 5): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0037 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0038
     * @tc.name      ComponentCollection_ParticleCameraCtor_0038
     * @tc.desc      new ParticleCamera(0, 15) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0038 begin`);
      const subject: ParticleCamera = new ParticleCamera(0, 15);
      logInfo(`new ParticleCamera(0, 15): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(0, 15): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(0);
      logInfo(`new ParticleCamera(0, 15): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(0, 15): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(15);
      logInfo(`new ParticleCamera(0, 15): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(0, 15): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0038 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0039
     * @tc.name      ComponentCollection_ParticleCameraCtor_0039
     * @tc.desc      new ParticleCamera(0, 20) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0039 begin`);
      const subject: ParticleCamera = new ParticleCamera(0, 20);
      logInfo(`new ParticleCamera(0, 20): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(0, 20): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(0);
      logInfo(`new ParticleCamera(0, 20): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(0, 20): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(20);
      logInfo(`new ParticleCamera(0, 20): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(0, 20): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0039 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0040
     * @tc.name      ComponentCollection_ParticleCameraCtor_0040
     * @tc.desc      new ParticleCamera(0, 25) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0040 begin`);
      const subject: ParticleCamera = new ParticleCamera(0, 25);
      logInfo(`new ParticleCamera(0, 25): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(0, 25): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(0);
      logInfo(`new ParticleCamera(0, 25): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(0, 25): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(25);
      logInfo(`new ParticleCamera(0, 25): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(0, 25): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0040 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0041
     * @tc.name      ComponentCollection_ParticleCameraCtor_0041
     * @tc.desc      new ParticleCamera(0, 30) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0041 begin`);
      const subject: ParticleCamera = new ParticleCamera(0, 30);
      logInfo(`new ParticleCamera(0, 30): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(0, 30): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(0);
      logInfo(`new ParticleCamera(0, 30): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(0, 30): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(30);
      logInfo(`new ParticleCamera(0, 30): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(0, 30): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0041 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0042
     * @tc.name      ComponentCollection_ParticleCameraCtor_0042
     * @tc.desc      new ParticleCamera(0, 35) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0042 begin`);
      const subject: ParticleCamera = new ParticleCamera(0, 35);
      logInfo(`new ParticleCamera(0, 35): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(0, 35): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(0);
      logInfo(`new ParticleCamera(0, 35): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(0, 35): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(35);
      logInfo(`new ParticleCamera(0, 35): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(0, 35): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0042 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0043
     * @tc.name      ComponentCollection_ParticleCameraCtor_0043
     * @tc.desc      new ParticleCamera(0, 40) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0043 begin`);
      const subject: ParticleCamera = new ParticleCamera(0, 40);
      logInfo(`new ParticleCamera(0, 40): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(0, 40): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(0);
      logInfo(`new ParticleCamera(0, 40): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(0, 40): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(40);
      logInfo(`new ParticleCamera(0, 40): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(0, 40): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0043 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0044
     * @tc.name      ComponentCollection_ParticleCameraCtor_0044
     * @tc.desc      new ParticleCamera(0, 45) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0044 begin`);
      const subject: ParticleCamera = new ParticleCamera(0, 45);
      logInfo(`new ParticleCamera(0, 45): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(0, 45): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(0);
      logInfo(`new ParticleCamera(0, 45): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(0, 45): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(45);
      logInfo(`new ParticleCamera(0, 45): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(0, 45): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0044 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0045
     * @tc.name      ComponentCollection_ParticleCameraCtor_0045
     * @tc.desc      new ParticleCamera(0, 50) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0045 begin`);
      const subject: ParticleCamera = new ParticleCamera(0, 50);
      logInfo(`new ParticleCamera(0, 50): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(0, 50): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(0);
      logInfo(`new ParticleCamera(0, 50): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(0, 50): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(50);
      logInfo(`new ParticleCamera(0, 50): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(0, 50): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0045 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0046
     * @tc.name      ComponentCollection_ParticleCameraCtor_0046
     * @tc.desc      new ParticleCamera(0, 55) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0046 begin`);
      const subject: ParticleCamera = new ParticleCamera(0, 55);
      logInfo(`new ParticleCamera(0, 55): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(0, 55): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(0);
      logInfo(`new ParticleCamera(0, 55): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(0, 55): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(55);
      logInfo(`new ParticleCamera(0, 55): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(0, 55): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0046 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0047
     * @tc.name      ComponentCollection_ParticleCameraCtor_0047
     * @tc.desc      new ParticleCamera(0, 60) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0047 begin`);
      const subject: ParticleCamera = new ParticleCamera(0, 60);
      logInfo(`new ParticleCamera(0, 60): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(0, 60): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(0);
      logInfo(`new ParticleCamera(0, 60): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(0, 60): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(60);
      logInfo(`new ParticleCamera(0, 60): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(0, 60): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0047 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0048
     * @tc.name      ComponentCollection_ParticleCameraCtor_0048
     * @tc.desc      new ParticleCamera(0, 65) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0048 begin`);
      const subject: ParticleCamera = new ParticleCamera(0, 65);
      logInfo(`new ParticleCamera(0, 65): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(0, 65): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(0);
      logInfo(`new ParticleCamera(0, 65): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(0, 65): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(65);
      logInfo(`new ParticleCamera(0, 65): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(0, 65): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0048 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_PARTICLE_CAMERA_CTOR_0049
     * @tc.name      ComponentCollection_ParticleCameraCtor_0049
     * @tc.desc      new ParticleCamera(0, 70) initialises 6 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ParticleCameraCtor_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ParticleCameraCtor_0049 begin`);
      const subject: ParticleCamera = new ParticleCamera(0, 70);
      logInfo(`new ParticleCamera(0, 70): subject.frameNo=${subject.frameNo}`);
      expect(subject.frameNo).assertEqual(0);
      logInfo(`new ParticleCamera(0, 70): subject.camX=${subject.camX}`);
      expect(subject.camX).assertEqual(0);
      logInfo(`new ParticleCamera(0, 70): subject.camY=${subject.camY}`);
      expect(subject.camY).assertEqual(0);
      logInfo(`new ParticleCamera(0, 70): subject.camZ=${subject.camZ}`);
      expect(subject.camZ).assertEqual(70);
      logInfo(`new ParticleCamera(0, 70): subject.yaw=${subject.yaw}`);
      expect(subject.yaw).assertEqual(0);
      logInfo(`new ParticleCamera(0, 70): subject.pitch=${subject.pitch}`);
      expect(subject.pitch).assertEqual(0);
      logInfo(`${BUNDLE}ParticleCameraCtor_0049 end`);
    });
  });
}
