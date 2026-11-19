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
import { ImageInfo, WaterFlowDataSource } from 'decodeheifimage/src/main/ets/model/WaterFlowData';
import { getTasks, executeTasks } from 'decodeheifimage/src/main/ets/model/Taskpool';
import { RecordingListener } from './shared/HeifTestSupport';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_DecodeHEIF]';

export default function ImageInfoMatrixPart1Test(): void {
  describe('ImageInfoMatrixPart1', () => {

    /**
     * @tc.number    SUB_HEIF_IIMP1_0100
     * @tc.name      testInfoSize0001
     * @tc.desc      Verify ImageInfo keeps size 0x0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInfoSize0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoSize0001 begin');
      const info: ImageInfo = new ImageInfo(null, 0, 0, 'd');
      expect(info.width).assertEqual(0);
      expect(info.height).assertEqual(0);
      expect(info.description).assertEqual('d');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoSize0001 end');
    })

    /**
     * @tc.number    SUB_HEIF_IIMP1_0200
     * @tc.name      testInfoSize0002
     * @tc.desc      Verify ImageInfo keeps size 1x1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInfoSize0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoSize0002 begin');
      const info: ImageInfo = new ImageInfo(null, 1, 1, 'd');
      expect(info.width).assertEqual(1);
      expect(info.height).assertEqual(1);
      expect(info.description).assertEqual('d');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoSize0002 end');
    })

    /**
     * @tc.number    SUB_HEIF_IIMP1_0300
     * @tc.name      testInfoSize0003
     * @tc.desc      Verify ImageInfo keeps size 2x3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInfoSize0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoSize0003 begin');
      const info: ImageInfo = new ImageInfo(null, 2, 3, 'd');
      expect(info.width).assertEqual(2);
      expect(info.height).assertEqual(3);
      expect(info.description).assertEqual('d');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoSize0003 end');
    })

    /**
     * @tc.number    SUB_HEIF_IIMP1_0400
     * @tc.name      testInfoSize0004
     * @tc.desc      Verify ImageInfo keeps size 720x1280.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInfoSize0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoSize0004 begin');
      const info: ImageInfo = new ImageInfo(null, 720, 1280, 'd');
      expect(info.width).assertEqual(720);
      expect(info.height).assertEqual(1280);
      expect(info.description).assertEqual('d');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoSize0004 end');
    })

    /**
     * @tc.number    SUB_HEIF_IIMP1_0500
     * @tc.name      testInfoSize0005
     * @tc.desc      Verify ImageInfo keeps size 1280x720.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInfoSize0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoSize0005 begin');
      const info: ImageInfo = new ImageInfo(null, 1280, 720, 'd');
      expect(info.width).assertEqual(1280);
      expect(info.height).assertEqual(720);
      expect(info.description).assertEqual('d');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoSize0005 end');
    })

    /**
     * @tc.number    SUB_HEIF_IIMP1_0600
     * @tc.name      testInfoSize0006
     * @tc.desc      Verify ImageInfo keeps size 4096x2160.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInfoSize0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoSize0006 begin');
      const info: ImageInfo = new ImageInfo(null, 4096, 2160, 'd');
      expect(info.width).assertEqual(4096);
      expect(info.height).assertEqual(2160);
      expect(info.description).assertEqual('d');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoSize0006 end');
    })

    /**
     * @tc.number    SUB_HEIF_IIMP1_0700
     * @tc.name      testInfoSize0007
     * @tc.desc      Verify ImageInfo keeps size 9007199254740991x1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInfoSize0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoSize0007 begin');
      const info: ImageInfo = new ImageInfo(null, 9007199254740991, 1, 'd');
      expect(info.width).assertEqual(9007199254740991);
      expect(info.height).assertEqual(1);
      expect(info.description).assertEqual('d');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoSize0007 end');
    })

    /**
     * @tc.number    SUB_HEIF_IIMP1_0800
     * @tc.name      testInfoSize0008
     * @tc.desc      Verify ImageInfo keeps size -1x0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInfoSize0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoSize0008 begin');
      const info: ImageInfo = new ImageInfo(null, -1, 0, 'd');
      expect(info.width).assertEqual(-1);
      expect(info.height).assertEqual(0);
      expect(info.description).assertEqual('d');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoSize0008 end');
    })

    /**
     * @tc.number    SUB_HEIF_IIMP1_0900
     * @tc.name      testInfoSize0009
     * @tc.desc      Verify ImageInfo keeps size -720x-1280.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInfoSize0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoSize0009 begin');
      const info: ImageInfo = new ImageInfo(null, -720, -1280, 'd');
      expect(info.width).assertEqual(-720);
      expect(info.height).assertEqual(-1280);
      expect(info.description).assertEqual('d');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoSize0009 end');
    })

    /**
     * @tc.number    SUB_HEIF_IIMP1_1000
     * @tc.name      testInfoSize0010
     * @tc.desc      Verify ImageInfo keeps size 1.5x2.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInfoSize0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoSize0010 begin');
      const info: ImageInfo = new ImageInfo(null, 1.5, 2.5, 'd');
      expect(info.width).assertEqual(1.5);
      expect(info.height).assertEqual(2.5);
      expect(info.description).assertEqual('d');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoSize0010 end');
    })

    /**
     * @tc.number    SUB_HEIF_IIMP1_1100
     * @tc.name      testInfoDescription0011
     * @tc.desc      Verify ImageInfo keeps the empty description variant.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInfoDescription0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoDescription0011 begin');
      const info: ImageInfo = new ImageInfo(null, 10, 20, '');
      expect(info.description).assertEqual('');
      expect(info.width).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoDescription0011 end');
    })

    /**
     * @tc.number    SUB_HEIF_IIMP1_1200
     * @tc.name      testInfoDescription0012
     * @tc.desc      Verify ImageInfo keeps the single description variant.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInfoDescription0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoDescription0012 begin');
      const info: ImageInfo = new ImageInfo(null, 10, 20, 'a');
      expect(info.description).assertEqual('a');
      expect(info.width).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoDescription0012 end');
    })

    /**
     * @tc.number    SUB_HEIF_IIMP1_1300
     * @tc.name      testInfoDescription0013
     * @tc.desc      Verify ImageInfo keeps the chinese description variant.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInfoDescription0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoDescription0013 begin');
      const info: ImageInfo = new ImageInfo(null, 10, 20, '中文');
      expect(info.description).assertEqual('中文');
      expect(info.width).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoDescription0013 end');
    })

    /**
     * @tc.number    SUB_HEIF_IIMP1_1400
     * @tc.name      testInfoDescription0014
     * @tc.desc      Verify ImageInfo keeps the spaced description variant.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInfoDescription0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoDescription0014 begin');
      const info: ImageInfo = new ImageInfo(null, 10, 20, '  spaced  ');
      expect(info.description).assertEqual('  spaced  ');
      expect(info.width).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoDescription0014 end');
    })

    /**
     * @tc.number    SUB_HEIF_IIMP1_1500
     * @tc.name      testInfoDescription0015
     * @tc.desc      Verify ImageInfo keeps the newline description variant.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInfoDescription0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoDescription0015 begin');
      const info: ImageInfo = new ImageInfo(null, 10, 20, 'line\nbreak');
      expect(info.description).assertEqual('line\nbreak');
      expect(info.width).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoDescription0015 end');
    })

    /**
     * @tc.number    SUB_HEIF_IIMP1_1600
     * @tc.name      testInfoDescription0016
     * @tc.desc      Verify ImageInfo keeps the long description variant.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testInfoDescription0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoDescription0016 begin');
      const info: ImageInfo = new ImageInfo(null, 10, 20, 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(info.description).assertEqual('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
      expect(info.width).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testInfoDescription0016 end');
    })

  })
}
