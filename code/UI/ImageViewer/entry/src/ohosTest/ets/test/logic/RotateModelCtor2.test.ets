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
import { RotateModel } from '../../../../main/ets/model/RotateModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ImageViewer]';
const BUNDLE: string = 'ImageViewer_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new RotateModel (77 cases). */
export default function rotateModelCtor2Test(): void {
  describe('RotateModelCtor2Test', () => {
    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0078
     * @tc.name      ImageViewer_RotateModelCtor_0078
     * @tc.desc      new RotateModel(771272.4) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0078 begin`);
      const subject: RotateModel = new RotateModel(771272.4);
      logInfo(`new RotateModel(771272.4): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(771272.4, PRECISION);
      logInfo(`new RotateModel(771272.4): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(771272.4): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0078 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0079
     * @tc.name      ImageViewer_RotateModelCtor_0079
     * @tc.desc      new RotateModel(98644.07) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0079 begin`);
      const subject: RotateModel = new RotateModel(98644.07);
      logInfo(`new RotateModel(98644.07): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(98644.07, PRECISION);
      logInfo(`new RotateModel(98644.07): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(98644.07): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0079 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0080
     * @tc.name      ImageViewer_RotateModelCtor_0080
     * @tc.desc      new RotateModel(-3345389) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0080 begin`);
      const subject: RotateModel = new RotateModel(-3345389);
      logInfo(`new RotateModel(-3345389): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-3345389);
      logInfo(`new RotateModel(-3345389): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-3345389): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0080 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0081
     * @tc.name      ImageViewer_RotateModelCtor_0081
     * @tc.desc      new RotateModel(642556) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0081 begin`);
      const subject: RotateModel = new RotateModel(642556);
      logInfo(`new RotateModel(642556): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(642556);
      logInfo(`new RotateModel(642556): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(642556): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0081 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0082
     * @tc.name      ImageViewer_RotateModelCtor_0082
     * @tc.desc      new RotateModel(-1242442) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0082 begin`);
      const subject: RotateModel = new RotateModel(-1242442);
      logInfo(`new RotateModel(-1242442): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-1242442);
      logInfo(`new RotateModel(-1242442): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-1242442): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0082 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0083
     * @tc.name      ImageViewer_RotateModelCtor_0083
     * @tc.desc      new RotateModel(394390) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0083 begin`);
      const subject: RotateModel = new RotateModel(394390);
      logInfo(`new RotateModel(394390): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(394390);
      logInfo(`new RotateModel(394390): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(394390): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0083 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0084
     * @tc.name      ImageViewer_RotateModelCtor_0084
     * @tc.desc      new RotateModel(3200138) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0084 begin`);
      const subject: RotateModel = new RotateModel(3200138);
      logInfo(`new RotateModel(3200138): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(3200138);
      logInfo(`new RotateModel(3200138): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3200138): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0084 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0085
     * @tc.name      ImageViewer_RotateModelCtor_0085
     * @tc.desc      new RotateModel(-1243160) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0085 begin`);
      const subject: RotateModel = new RotateModel(-1243160);
      logInfo(`new RotateModel(-1243160): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-1243160);
      logInfo(`new RotateModel(-1243160): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-1243160): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0085 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0086
     * @tc.name      ImageViewer_RotateModelCtor_0086
     * @tc.desc      new RotateModel(1331291) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0086 begin`);
      const subject: RotateModel = new RotateModel(1331291);
      logInfo(`new RotateModel(1331291): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(1331291);
      logInfo(`new RotateModel(1331291): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1331291): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0086 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0087
     * @tc.name      ImageViewer_RotateModelCtor_0087
     * @tc.desc      new RotateModel(1281074) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0087 begin`);
      const subject: RotateModel = new RotateModel(1281074);
      logInfo(`new RotateModel(1281074): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(1281074);
      logInfo(`new RotateModel(1281074): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1281074): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0087 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0088
     * @tc.name      ImageViewer_RotateModelCtor_0088
     * @tc.desc      new RotateModel(4722426) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0088 begin`);
      const subject: RotateModel = new RotateModel(4722426);
      logInfo(`new RotateModel(4722426): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(4722426);
      logInfo(`new RotateModel(4722426): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(4722426): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0088 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0089
     * @tc.name      ImageViewer_RotateModelCtor_0089
     * @tc.desc      new RotateModel(637137.53) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0089 begin`);
      const subject: RotateModel = new RotateModel(637137.53);
      logInfo(`new RotateModel(637137.53): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(637137.53, PRECISION);
      logInfo(`new RotateModel(637137.53): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(637137.53): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0089 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0090
     * @tc.name      ImageViewer_RotateModelCtor_0090
     * @tc.desc      new RotateModel(-3295738) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0090 begin`);
      const subject: RotateModel = new RotateModel(-3295738);
      logInfo(`new RotateModel(-3295738): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-3295738);
      logInfo(`new RotateModel(-3295738): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-3295738): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0090 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0091
     * @tc.name      ImageViewer_RotateModelCtor_0091
     * @tc.desc      new RotateModel(2611759) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0091 begin`);
      const subject: RotateModel = new RotateModel(2611759);
      logInfo(`new RotateModel(2611759): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(2611759);
      logInfo(`new RotateModel(2611759): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2611759): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0091 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0092
     * @tc.name      ImageViewer_RotateModelCtor_0092
     * @tc.desc      new RotateModel(-97783) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0092 begin`);
      const subject: RotateModel = new RotateModel(-97783);
      logInfo(`new RotateModel(-97783): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-97783);
      logInfo(`new RotateModel(-97783): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-97783): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0092 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0093
     * @tc.name      ImageViewer_RotateModelCtor_0093
     * @tc.desc      new RotateModel(928222.32) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0093 begin`);
      const subject: RotateModel = new RotateModel(928222.32);
      logInfo(`new RotateModel(928222.32): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(928222.32, PRECISION);
      logInfo(`new RotateModel(928222.32): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(928222.32): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0093 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0094
     * @tc.name      ImageViewer_RotateModelCtor_0094
     * @tc.desc      new RotateModel(-2925016) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0094 begin`);
      const subject: RotateModel = new RotateModel(-2925016);
      logInfo(`new RotateModel(-2925016): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-2925016);
      logInfo(`new RotateModel(-2925016): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-2925016): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0094 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0095
     * @tc.name      ImageViewer_RotateModelCtor_0095
     * @tc.desc      new RotateModel(2455466) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0095 begin`);
      const subject: RotateModel = new RotateModel(2455466);
      logInfo(`new RotateModel(2455466): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(2455466);
      logInfo(`new RotateModel(2455466): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2455466): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0095 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0096
     * @tc.name      ImageViewer_RotateModelCtor_0096
     * @tc.desc      new RotateModel(3348756.69) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0096 begin`);
      const subject: RotateModel = new RotateModel(3348756.69);
      logInfo(`new RotateModel(3348756.69): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(3348756.69, PRECISION);
      logInfo(`new RotateModel(3348756.69): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3348756.69): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0096 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0097
     * @tc.name      ImageViewer_RotateModelCtor_0097
     * @tc.desc      new RotateModel(-43769) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0097 begin`);
      const subject: RotateModel = new RotateModel(-43769);
      logInfo(`new RotateModel(-43769): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-43769);
      logInfo(`new RotateModel(-43769): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-43769): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0097 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0098
     * @tc.name      ImageViewer_RotateModelCtor_0098
     * @tc.desc      new RotateModel(2449121) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0098 begin`);
      const subject: RotateModel = new RotateModel(2449121);
      logInfo(`new RotateModel(2449121): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(2449121);
      logInfo(`new RotateModel(2449121): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2449121): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0098 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0099
     * @tc.name      ImageViewer_RotateModelCtor_0099
     * @tc.desc      new RotateModel(2504668.38) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0099 begin`);
      const subject: RotateModel = new RotateModel(2504668.38);
      logInfo(`new RotateModel(2504668.38): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(2504668.38, PRECISION);
      logInfo(`new RotateModel(2504668.38): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2504668.38): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0099 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0100
     * @tc.name      ImageViewer_RotateModelCtor_0100
     * @tc.desc      new RotateModel(5657957) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0100 begin`);
      const subject: RotateModel = new RotateModel(5657957);
      logInfo(`new RotateModel(5657957): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(5657957);
      logInfo(`new RotateModel(5657957): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(5657957): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0100 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0101
     * @tc.name      ImageViewer_RotateModelCtor_0101
     * @tc.desc      new RotateModel(-211274) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0101 begin`);
      const subject: RotateModel = new RotateModel(-211274);
      logInfo(`new RotateModel(-211274): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-211274);
      logInfo(`new RotateModel(-211274): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-211274): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0101 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0102
     * @tc.name      ImageViewer_RotateModelCtor_0102
     * @tc.desc      new RotateModel(2447898.76) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0102 begin`);
      const subject: RotateModel = new RotateModel(2447898.76);
      logInfo(`new RotateModel(2447898.76): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(2447898.76, PRECISION);
      logInfo(`new RotateModel(2447898.76): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2447898.76): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0102 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0103
     * @tc.name      ImageViewer_RotateModelCtor_0103
     * @tc.desc      new RotateModel(5034543) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0103 begin`);
      const subject: RotateModel = new RotateModel(5034543);
      logInfo(`new RotateModel(5034543): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(5034543);
      logInfo(`new RotateModel(5034543): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(5034543): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0103 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0104
     * @tc.name      ImageViewer_RotateModelCtor_0104
     * @tc.desc      new RotateModel(1832192) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0104 begin`);
      const subject: RotateModel = new RotateModel(1832192);
      logInfo(`new RotateModel(1832192): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(1832192);
      logInfo(`new RotateModel(1832192): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1832192): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0104 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0105
     * @tc.name      ImageViewer_RotateModelCtor_0105
     * @tc.desc      new RotateModel(-1359562) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0105 begin`);
      const subject: RotateModel = new RotateModel(-1359562);
      logInfo(`new RotateModel(-1359562): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-1359562);
      logInfo(`new RotateModel(-1359562): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-1359562): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0105 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0106
     * @tc.name      ImageViewer_RotateModelCtor_0106
     * @tc.desc      new RotateModel(1437173.41) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0106 begin`);
      const subject: RotateModel = new RotateModel(1437173.41);
      logInfo(`new RotateModel(1437173.41): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(1437173.41, PRECISION);
      logInfo(`new RotateModel(1437173.41): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1437173.41): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0106 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0107
     * @tc.name      ImageViewer_RotateModelCtor_0107
     * @tc.desc      new RotateModel(605516.3) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0107 begin`);
      const subject: RotateModel = new RotateModel(605516.3);
      logInfo(`new RotateModel(605516.3): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(605516.3, PRECISION);
      logInfo(`new RotateModel(605516.3): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(605516.3): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0107 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0108
     * @tc.name      ImageViewer_RotateModelCtor_0108
     * @tc.desc      new RotateModel(1409473) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0108 begin`);
      const subject: RotateModel = new RotateModel(1409473);
      logInfo(`new RotateModel(1409473): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(1409473);
      logInfo(`new RotateModel(1409473): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1409473): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0108 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0109
     * @tc.name      ImageViewer_RotateModelCtor_0109
     * @tc.desc      new RotateModel(1964382.46) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0109 begin`);
      const subject: RotateModel = new RotateModel(1964382.46);
      logInfo(`new RotateModel(1964382.46): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(1964382.46, PRECISION);
      logInfo(`new RotateModel(1964382.46): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1964382.46): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0109 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0110
     * @tc.name      ImageViewer_RotateModelCtor_0110
     * @tc.desc      new RotateModel(-2323821) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0110 begin`);
      const subject: RotateModel = new RotateModel(-2323821);
      logInfo(`new RotateModel(-2323821): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-2323821);
      logInfo(`new RotateModel(-2323821): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-2323821): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0110 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0111
     * @tc.name      ImageViewer_RotateModelCtor_0111
     * @tc.desc      new RotateModel(5604302) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0111 begin`);
      const subject: RotateModel = new RotateModel(5604302);
      logInfo(`new RotateModel(5604302): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(5604302);
      logInfo(`new RotateModel(5604302): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(5604302): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0111 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0112
     * @tc.name      ImageViewer_RotateModelCtor_0112
     * @tc.desc      new RotateModel(98529) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0112 begin`);
      const subject: RotateModel = new RotateModel(98529);
      logInfo(`new RotateModel(98529): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(98529);
      logInfo(`new RotateModel(98529): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(98529): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0112 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0113
     * @tc.name      ImageViewer_RotateModelCtor_0113
     * @tc.desc      new RotateModel(3578067.04) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0113 begin`);
      const subject: RotateModel = new RotateModel(3578067.04);
      logInfo(`new RotateModel(3578067.04): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(3578067.04, PRECISION);
      logInfo(`new RotateModel(3578067.04): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3578067.04): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0113 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0114
     * @tc.name      ImageViewer_RotateModelCtor_0114
     * @tc.desc      new RotateModel(1628999) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0114 begin`);
      const subject: RotateModel = new RotateModel(1628999);
      logInfo(`new RotateModel(1628999): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(1628999);
      logInfo(`new RotateModel(1628999): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1628999): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0114 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0115
     * @tc.name      ImageViewer_RotateModelCtor_0115
     * @tc.desc      new RotateModel(-1909289) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0115 begin`);
      const subject: RotateModel = new RotateModel(-1909289);
      logInfo(`new RotateModel(-1909289): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-1909289);
      logInfo(`new RotateModel(-1909289): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-1909289): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0115 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0116
     * @tc.name      ImageViewer_RotateModelCtor_0116
     * @tc.desc      new RotateModel(-2515444) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0116 begin`);
      const subject: RotateModel = new RotateModel(-2515444);
      logInfo(`new RotateModel(-2515444): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-2515444);
      logInfo(`new RotateModel(-2515444): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-2515444): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0116 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0117
     * @tc.name      ImageViewer_RotateModelCtor_0117
     * @tc.desc      new RotateModel(-1665820) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0117 begin`);
      const subject: RotateModel = new RotateModel(-1665820);
      logInfo(`new RotateModel(-1665820): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-1665820);
      logInfo(`new RotateModel(-1665820): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-1665820): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0117 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0118
     * @tc.name      ImageViewer_RotateModelCtor_0118
     * @tc.desc      new RotateModel(1144675) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0118 begin`);
      const subject: RotateModel = new RotateModel(1144675);
      logInfo(`new RotateModel(1144675): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(1144675);
      logInfo(`new RotateModel(1144675): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1144675): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0118 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0119
     * @tc.name      ImageViewer_RotateModelCtor_0119
     * @tc.desc      new RotateModel(2830831) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0119 begin`);
      const subject: RotateModel = new RotateModel(2830831);
      logInfo(`new RotateModel(2830831): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(2830831);
      logInfo(`new RotateModel(2830831): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2830831): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0119 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0120
     * @tc.name      ImageViewer_RotateModelCtor_0120
     * @tc.desc      new RotateModel(-1428937) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0120 begin`);
      const subject: RotateModel = new RotateModel(-1428937);
      logInfo(`new RotateModel(-1428937): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-1428937);
      logInfo(`new RotateModel(-1428937): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-1428937): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0120 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0121
     * @tc.name      ImageViewer_RotateModelCtor_0121
     * @tc.desc      new RotateModel(-3080851) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0121 begin`);
      const subject: RotateModel = new RotateModel(-3080851);
      logInfo(`new RotateModel(-3080851): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-3080851);
      logInfo(`new RotateModel(-3080851): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-3080851): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0121 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0122
     * @tc.name      ImageViewer_RotateModelCtor_0122
     * @tc.desc      new RotateModel(-671852) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0122 begin`);
      const subject: RotateModel = new RotateModel(-671852);
      logInfo(`new RotateModel(-671852): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-671852);
      logInfo(`new RotateModel(-671852): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-671852): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0122 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0123
     * @tc.name      ImageViewer_RotateModelCtor_0123
     * @tc.desc      new RotateModel(2227536) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0123 begin`);
      const subject: RotateModel = new RotateModel(2227536);
      logInfo(`new RotateModel(2227536): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(2227536);
      logInfo(`new RotateModel(2227536): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2227536): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0123 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0124
     * @tc.name      ImageViewer_RotateModelCtor_0124
     * @tc.desc      new RotateModel(-1138445) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0124 begin`);
      const subject: RotateModel = new RotateModel(-1138445);
      logInfo(`new RotateModel(-1138445): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-1138445);
      logInfo(`new RotateModel(-1138445): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-1138445): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0124 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0125
     * @tc.name      ImageViewer_RotateModelCtor_0125
     * @tc.desc      new RotateModel(-13725) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0125 begin`);
      const subject: RotateModel = new RotateModel(-13725);
      logInfo(`new RotateModel(-13725): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-13725);
      logInfo(`new RotateModel(-13725): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-13725): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0125 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0126
     * @tc.name      ImageViewer_RotateModelCtor_0126
     * @tc.desc      new RotateModel(2451134) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0126 begin`);
      const subject: RotateModel = new RotateModel(2451134);
      logInfo(`new RotateModel(2451134): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(2451134);
      logInfo(`new RotateModel(2451134): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2451134): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0126 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0127
     * @tc.name      ImageViewer_RotateModelCtor_0127
     * @tc.desc      new RotateModel(3752921) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0127 begin`);
      const subject: RotateModel = new RotateModel(3752921);
      logInfo(`new RotateModel(3752921): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(3752921);
      logInfo(`new RotateModel(3752921): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3752921): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0127 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0128
     * @tc.name      ImageViewer_RotateModelCtor_0128
     * @tc.desc      new RotateModel(6245829) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0128 begin`);
      const subject: RotateModel = new RotateModel(6245829);
      logInfo(`new RotateModel(6245829): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(6245829);
      logInfo(`new RotateModel(6245829): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(6245829): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0128 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0129
     * @tc.name      ImageViewer_RotateModelCtor_0129
     * @tc.desc      new RotateModel(1076808.64) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0129 begin`);
      const subject: RotateModel = new RotateModel(1076808.64);
      logInfo(`new RotateModel(1076808.64): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(1076808.64, PRECISION);
      logInfo(`new RotateModel(1076808.64): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1076808.64): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0129 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0130
     * @tc.name      ImageViewer_RotateModelCtor_0130
     * @tc.desc      new RotateModel(1175207.14) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0130 begin`);
      const subject: RotateModel = new RotateModel(1175207.14);
      logInfo(`new RotateModel(1175207.14): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(1175207.14, PRECISION);
      logInfo(`new RotateModel(1175207.14): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1175207.14): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0130 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0131
     * @tc.name      ImageViewer_RotateModelCtor_0131
     * @tc.desc      new RotateModel(7068885) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0131 begin`);
      const subject: RotateModel = new RotateModel(7068885);
      logInfo(`new RotateModel(7068885): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(7068885);
      logInfo(`new RotateModel(7068885): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(7068885): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0131 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0132
     * @tc.name      ImageViewer_RotateModelCtor_0132
     * @tc.desc      new RotateModel(626599) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0132 begin`);
      const subject: RotateModel = new RotateModel(626599);
      logInfo(`new RotateModel(626599): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(626599);
      logInfo(`new RotateModel(626599): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(626599): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0132 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0133
     * @tc.name      ImageViewer_RotateModelCtor_0133
     * @tc.desc      new RotateModel(3027724) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0133 begin`);
      const subject: RotateModel = new RotateModel(3027724);
      logInfo(`new RotateModel(3027724): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(3027724);
      logInfo(`new RotateModel(3027724): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3027724): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0133 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0134
     * @tc.name      ImageViewer_RotateModelCtor_0134
     * @tc.desc      new RotateModel(2809662) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0134 begin`);
      const subject: RotateModel = new RotateModel(2809662);
      logInfo(`new RotateModel(2809662): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(2809662);
      logInfo(`new RotateModel(2809662): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2809662): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0134 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0135
     * @tc.name      ImageViewer_RotateModelCtor_0135
     * @tc.desc      new RotateModel(4339241) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0135 begin`);
      const subject: RotateModel = new RotateModel(4339241);
      logInfo(`new RotateModel(4339241): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(4339241);
      logInfo(`new RotateModel(4339241): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(4339241): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0135 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0136
     * @tc.name      ImageViewer_RotateModelCtor_0136
     * @tc.desc      new RotateModel(-1807129) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0136 begin`);
      const subject: RotateModel = new RotateModel(-1807129);
      logInfo(`new RotateModel(-1807129): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-1807129);
      logInfo(`new RotateModel(-1807129): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-1807129): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0136 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0137
     * @tc.name      ImageViewer_RotateModelCtor_0137
     * @tc.desc      new RotateModel(6591315) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0137 begin`);
      const subject: RotateModel = new RotateModel(6591315);
      logInfo(`new RotateModel(6591315): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(6591315);
      logInfo(`new RotateModel(6591315): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(6591315): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0137 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0138
     * @tc.name      ImageViewer_RotateModelCtor_0138
     * @tc.desc      new RotateModel(1591704) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0138 begin`);
      const subject: RotateModel = new RotateModel(1591704);
      logInfo(`new RotateModel(1591704): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(1591704);
      logInfo(`new RotateModel(1591704): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1591704): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0138 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0139
     * @tc.name      ImageViewer_RotateModelCtor_0139
     * @tc.desc      new RotateModel(1111228.13) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0139 begin`);
      const subject: RotateModel = new RotateModel(1111228.13);
      logInfo(`new RotateModel(1111228.13): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(1111228.13, PRECISION);
      logInfo(`new RotateModel(1111228.13): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1111228.13): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0139 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0140
     * @tc.name      ImageViewer_RotateModelCtor_0140
     * @tc.desc      new RotateModel(3667813) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0140 begin`);
      const subject: RotateModel = new RotateModel(3667813);
      logInfo(`new RotateModel(3667813): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(3667813);
      logInfo(`new RotateModel(3667813): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3667813): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0140 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0141
     * @tc.name      ImageViewer_RotateModelCtor_0141
     * @tc.desc      new RotateModel(1948072.42) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0141 begin`);
      const subject: RotateModel = new RotateModel(1948072.42);
      logInfo(`new RotateModel(1948072.42): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(1948072.42, PRECISION);
      logInfo(`new RotateModel(1948072.42): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1948072.42): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0141 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0142
     * @tc.name      ImageViewer_RotateModelCtor_0142
     * @tc.desc      new RotateModel(5152245) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0142 begin`);
      const subject: RotateModel = new RotateModel(5152245);
      logInfo(`new RotateModel(5152245): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(5152245);
      logInfo(`new RotateModel(5152245): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(5152245): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0142 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0143
     * @tc.name      ImageViewer_RotateModelCtor_0143
     * @tc.desc      new RotateModel(-2836673) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0143 begin`);
      const subject: RotateModel = new RotateModel(-2836673);
      logInfo(`new RotateModel(-2836673): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-2836673);
      logInfo(`new RotateModel(-2836673): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-2836673): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0143 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0144
     * @tc.name      ImageViewer_RotateModelCtor_0144
     * @tc.desc      new RotateModel(3518703) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0144 begin`);
      const subject: RotateModel = new RotateModel(3518703);
      logInfo(`new RotateModel(3518703): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(3518703);
      logInfo(`new RotateModel(3518703): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3518703): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0144 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0145
     * @tc.name      ImageViewer_RotateModelCtor_0145
     * @tc.desc      new RotateModel(2408689) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0145 begin`);
      const subject: RotateModel = new RotateModel(2408689);
      logInfo(`new RotateModel(2408689): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(2408689);
      logInfo(`new RotateModel(2408689): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(2408689): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0145 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0146
     * @tc.name      ImageViewer_RotateModelCtor_0146
     * @tc.desc      new RotateModel(1551255.49) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0146 begin`);
      const subject: RotateModel = new RotateModel(1551255.49);
      logInfo(`new RotateModel(1551255.49): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(1551255.49, PRECISION);
      logInfo(`new RotateModel(1551255.49): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1551255.49): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0146 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0147
     * @tc.name      ImageViewer_RotateModelCtor_0147
     * @tc.desc      new RotateModel(4443458) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0147 begin`);
      const subject: RotateModel = new RotateModel(4443458);
      logInfo(`new RotateModel(4443458): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(4443458);
      logInfo(`new RotateModel(4443458): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(4443458): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0147 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0148
     * @tc.name      ImageViewer_RotateModelCtor_0148
     * @tc.desc      new RotateModel(5871554) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0148 begin`);
      const subject: RotateModel = new RotateModel(5871554);
      logInfo(`new RotateModel(5871554): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(5871554);
      logInfo(`new RotateModel(5871554): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(5871554): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0148 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0149
     * @tc.name      ImageViewer_RotateModelCtor_0149
     * @tc.desc      new RotateModel(1052267.68) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0149 begin`);
      const subject: RotateModel = new RotateModel(1052267.68);
      logInfo(`new RotateModel(1052267.68): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(1052267.68, PRECISION);
      logInfo(`new RotateModel(1052267.68): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(1052267.68): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0149 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0150
     * @tc.name      ImageViewer_RotateModelCtor_0150
     * @tc.desc      new RotateModel(-340840) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0150 begin`);
      const subject: RotateModel = new RotateModel(-340840);
      logInfo(`new RotateModel(-340840): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(-340840);
      logInfo(`new RotateModel(-340840): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(-340840): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0150 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0151
     * @tc.name      ImageViewer_RotateModelCtor_0151
     * @tc.desc      new RotateModel(25901.49) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0151 begin`);
      const subject: RotateModel = new RotateModel(25901.49);
      logInfo(`new RotateModel(25901.49): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(25901.49, PRECISION);
      logInfo(`new RotateModel(25901.49): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(25901.49): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0151 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0152
     * @tc.name      ImageViewer_RotateModelCtor_0152
     * @tc.desc      new RotateModel(3003286.25) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0152 begin`);
      const subject: RotateModel = new RotateModel(3003286.25);
      logInfo(`new RotateModel(3003286.25): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(3003286.25, PRECISION);
      logInfo(`new RotateModel(3003286.25): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3003286.25): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0152 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0153
     * @tc.name      ImageViewer_RotateModelCtor_0153
     * @tc.desc      new RotateModel(3729863) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0153 begin`);
      const subject: RotateModel = new RotateModel(3729863);
      logInfo(`new RotateModel(3729863): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertEqual(3729863);
      logInfo(`new RotateModel(3729863): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(3729863): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0153 end`);
    });

    /**
     * @tc.number    SUB_IMAGEVIEWER_ROTATE_MODEL_CTOR_0154
     * @tc.name      ImageViewer_RotateModelCtor_0154
     * @tc.desc      new RotateModel(42963.93) initialises 3 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImageViewer_RotateModelCtor_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RotateModelCtor_0154 begin`);
      const subject: RotateModel = new RotateModel(42963.93);
      logInfo(`new RotateModel(42963.93): subject.currentRotate=${subject.currentRotate}`);
      expect(subject.currentRotate).assertClose(42963.93, PRECISION);
      logInfo(`new RotateModel(42963.93): subject.lastRotate=${subject.lastRotate}`);
      expect(subject.lastRotate).assertEqual(0);
      logInfo(`new RotateModel(42963.93): subject.startAngle=${subject.startAngle}`);
      expect(subject.startAngle).assertEqual(20);
      logInfo(`${BUNDLE}RotateModelCtor_0154 end`);
    });
  });
}
