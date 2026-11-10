/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import HiLog from '@ohos.hilog';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { DateUtil } from '../../../main/ets/utils/DateUtil';

const TAG = '[Sample_PhotosDateLocalizedBoundaryTest]';
const DOMAIN = 0xF811;

export default function PhotosDateLocalizedBoundaryTest(): void {
  describe('PhotosDateLocalizedBoundaryTest', () => {
    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0001
     * @tc.name      testPhotosDateLocalizedBoundary0001
     * @tc.desc      Formats localized boundary date 1900.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0001 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1900, 0, 1, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1900') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0002
     * @tc.name      testPhotosDateLocalizedBoundary0002
     * @tc.desc      Formats localized boundary date 1901.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0002 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1901, 1, 2, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1901') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0003
     * @tc.name      testPhotosDateLocalizedBoundary0003
     * @tc.desc      Formats localized boundary date 1902.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0003 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1902, 2, 3, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1902') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0003 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0004
     * @tc.name      testPhotosDateLocalizedBoundary0004
     * @tc.desc      Formats localized boundary date 1903.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0004 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1903, 3, 4, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1903') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0004 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0005
     * @tc.name      testPhotosDateLocalizedBoundary0005
     * @tc.desc      Formats localized boundary date 1904.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0005 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1904, 4, 5, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1904') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0005 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0006
     * @tc.name      testPhotosDateLocalizedBoundary0006
     * @tc.desc      Formats localized boundary date 1905.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0006 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1905, 5, 6, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1905') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0006 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0007
     * @tc.name      testPhotosDateLocalizedBoundary0007
     * @tc.desc      Formats localized boundary date 1906.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0007 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1906, 6, 7, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1906') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0007 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0008
     * @tc.name      testPhotosDateLocalizedBoundary0008
     * @tc.desc      Formats localized boundary date 1907.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0008 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1907, 7, 8, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1907') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0008 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0009
     * @tc.name      testPhotosDateLocalizedBoundary0009
     * @tc.desc      Formats localized boundary date 1908.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0009 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1908, 8, 9, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1908') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0009 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0010
     * @tc.name      testPhotosDateLocalizedBoundary0010
     * @tc.desc      Formats localized boundary date 1909.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0010 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1909, 9, 10, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1909') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0010 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0011
     * @tc.name      testPhotosDateLocalizedBoundary0011
     * @tc.desc      Formats localized boundary date 1910.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0011 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1910, 10, 11, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1910') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0011 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0012
     * @tc.name      testPhotosDateLocalizedBoundary0012
     * @tc.desc      Formats localized boundary date 1911.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0012 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1911, 11, 12, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1911') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0012 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0013
     * @tc.name      testPhotosDateLocalizedBoundary0013
     * @tc.desc      Formats localized boundary date 1912.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0013 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1912, 0, 13, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1912') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0013 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0014
     * @tc.name      testPhotosDateLocalizedBoundary0014
     * @tc.desc      Formats localized boundary date 1913.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0014 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1913, 1, 14, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1913') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0014 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0015
     * @tc.name      testPhotosDateLocalizedBoundary0015
     * @tc.desc      Formats localized boundary date 1914.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0015 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1914, 2, 15, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1914') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0015 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0016
     * @tc.name      testPhotosDateLocalizedBoundary0016
     * @tc.desc      Formats localized boundary date 1915.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0016 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1915, 3, 16, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1915') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0016 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0017
     * @tc.name      testPhotosDateLocalizedBoundary0017
     * @tc.desc      Formats localized boundary date 1916.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0017 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1916, 4, 17, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1916') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0017 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0018
     * @tc.name      testPhotosDateLocalizedBoundary0018
     * @tc.desc      Formats localized boundary date 1917.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0018 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1917, 5, 18, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1917') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0018 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0019
     * @tc.name      testPhotosDateLocalizedBoundary0019
     * @tc.desc      Formats localized boundary date 1918.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0019 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1918, 6, 19, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1918') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0019 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0020
     * @tc.name      testPhotosDateLocalizedBoundary0020
     * @tc.desc      Formats localized boundary date 1919.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0020 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1919, 7, 20, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1919') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0020 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0021
     * @tc.name      testPhotosDateLocalizedBoundary0021
     * @tc.desc      Formats localized boundary date 1920.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0021 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1920, 8, 21, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1920') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0021 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0022
     * @tc.name      testPhotosDateLocalizedBoundary0022
     * @tc.desc      Formats localized boundary date 1921.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0022 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1921, 9, 22, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1921') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0022 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0023
     * @tc.name      testPhotosDateLocalizedBoundary0023
     * @tc.desc      Formats localized boundary date 1922.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0023 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1922, 10, 23, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1922') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0023 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0024
     * @tc.name      testPhotosDateLocalizedBoundary0024
     * @tc.desc      Formats localized boundary date 1923.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0024 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1923, 11, 24, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1923') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0024 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0025
     * @tc.name      testPhotosDateLocalizedBoundary0025
     * @tc.desc      Formats localized boundary date 1924.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0025 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1924, 0, 25, 6, 7, 8).getTime());
