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
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1924') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0025 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0026
     * @tc.name      testPhotosDateLocalizedBoundary0026
     * @tc.desc      Formats localized boundary date 1925.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0026 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1925, 1, 26, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1925') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0026 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0027
     * @tc.name      testPhotosDateLocalizedBoundary0027
     * @tc.desc      Formats localized boundary date 1926.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0027 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1926, 2, 27, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1926') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0027 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0028
     * @tc.name      testPhotosDateLocalizedBoundary0028
     * @tc.desc      Formats localized boundary date 1927.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0028 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1927, 3, 1, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1927') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0028 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0029
     * @tc.name      testPhotosDateLocalizedBoundary0029
     * @tc.desc      Formats localized boundary date 1928.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0029 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1928, 4, 2, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1928') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0029 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0030
     * @tc.name      testPhotosDateLocalizedBoundary0030
     * @tc.desc      Formats localized boundary date 1929.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0030 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1929, 5, 3, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1929') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0030 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0031
     * @tc.name      testPhotosDateLocalizedBoundary0031
     * @tc.desc      Formats localized boundary date 1930.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0031 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1930, 6, 4, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1930') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0031 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0032
     * @tc.name      testPhotosDateLocalizedBoundary0032
     * @tc.desc      Formats localized boundary date 1931.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0032 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1931, 7, 5, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1931') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0032 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0033
     * @tc.name      testPhotosDateLocalizedBoundary0033
     * @tc.desc      Formats localized boundary date 1932.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0033 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1932, 8, 6, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1932') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0033 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0034
     * @tc.name      testPhotosDateLocalizedBoundary0034
     * @tc.desc      Formats localized boundary date 1933.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0034 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1933, 9, 7, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1933') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0034 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0035
     * @tc.name      testPhotosDateLocalizedBoundary0035
     * @tc.desc      Formats localized boundary date 1934.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0035 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1934, 10, 8, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1934') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0035 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0036
     * @tc.name      testPhotosDateLocalizedBoundary0036
     * @tc.desc      Formats localized boundary date 1935.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0036 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1935, 11, 9, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1935') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0036 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0037
     * @tc.name      testPhotosDateLocalizedBoundary0037
     * @tc.desc      Formats localized boundary date 1936.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0037 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1936, 0, 10, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1936') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0037 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0038
     * @tc.name      testPhotosDateLocalizedBoundary0038
     * @tc.desc      Formats localized boundary date 1937.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0038 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1937, 1, 11, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1937') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0038 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0039
     * @tc.name      testPhotosDateLocalizedBoundary0039
     * @tc.desc      Formats localized boundary date 1938.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0039 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1938, 2, 12, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1938') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0039 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0040
     * @tc.name      testPhotosDateLocalizedBoundary0040
     * @tc.desc      Formats localized boundary date 1939.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0040 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1939, 3, 13, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1939') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0040 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0041
     * @tc.name      testPhotosDateLocalizedBoundary0041
     * @tc.desc      Formats localized boundary date 1940.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0041 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1940, 4, 14, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1940') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0041 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0042
     * @tc.name      testPhotosDateLocalizedBoundary0042
     * @tc.desc      Formats localized boundary date 1941.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0042 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1941, 5, 15, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1941') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0042 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0043
     * @tc.name      testPhotosDateLocalizedBoundary0043
     * @tc.desc      Formats localized boundary date 1942.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0043 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1942, 6, 16, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1942') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0043 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0044
     * @tc.name      testPhotosDateLocalizedBoundary0044
     * @tc.desc      Formats localized boundary date 1943.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0044 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1943, 7, 17, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1943') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0044 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0045
     * @tc.name      testPhotosDateLocalizedBoundary0045
     * @tc.desc      Formats localized boundary date 1944.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0045 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1944, 8, 18, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1944') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0045 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0046
     * @tc.name      testPhotosDateLocalizedBoundary0046
     * @tc.desc      Formats localized boundary date 1945.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0046 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1945, 9, 19, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1945') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0046 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0047
     * @tc.name      testPhotosDateLocalizedBoundary0047
     * @tc.desc      Formats localized boundary date 1946.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0047 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1946, 10, 20, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1946') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0047 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0048
     * @tc.name      testPhotosDateLocalizedBoundary0048
     * @tc.desc      Formats localized boundary date 1947.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0048 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1947, 11, 21, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1947') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0048 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0049
     * @tc.name      testPhotosDateLocalizedBoundary0049
     * @tc.desc      Formats localized boundary date 1948.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0049 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1948, 0, 22, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1948') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0049 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0050
     * @tc.name      testPhotosDateLocalizedBoundary0050
     * @tc.desc      Formats localized boundary date 1949.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0050 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1949, 1, 23, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1949') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0050 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0051
     * @tc.name      testPhotosDateLocalizedBoundary0051
     * @tc.desc      Formats localized boundary date 1950.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0051 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1950, 2, 24, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1950') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0051 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0052
     * @tc.name      testPhotosDateLocalizedBoundary0052
     * @tc.desc      Formats localized boundary date 1951.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0052 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1951, 3, 25, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1951') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0052 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0053
     * @tc.name      testPhotosDateLocalizedBoundary0053
     * @tc.desc      Formats localized boundary date 1952.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0053 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1952, 4, 26, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1952') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0053 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0054
     * @tc.name      testPhotosDateLocalizedBoundary0054
     * @tc.desc      Formats localized boundary date 1953.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0054 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1953, 5, 27, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1953') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0054 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0055
     * @tc.name      testPhotosDateLocalizedBoundary0055
     * @tc.desc      Formats localized boundary date 1954.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0055 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1954, 6, 1, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1954') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0055 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0056
     * @tc.name      testPhotosDateLocalizedBoundary0056
     * @tc.desc      Formats localized boundary date 1955.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0056 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1955, 7, 2, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1955') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0056 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0057
     * @tc.name      testPhotosDateLocalizedBoundary0057
     * @tc.desc      Formats localized boundary date 1956.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0057 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1956, 8, 3, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1956') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0057 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0058
     * @tc.name      testPhotosDateLocalizedBoundary0058
     * @tc.desc      Formats localized boundary date 1957.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0058 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1957, 9, 4, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1957') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0058 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0059
     * @tc.name      testPhotosDateLocalizedBoundary0059
     * @tc.desc      Formats localized boundary date 1958.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0059 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1958, 10, 5, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1958') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0059 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0060
     * @tc.name      testPhotosDateLocalizedBoundary0060
     * @tc.desc      Formats localized boundary date 1959.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0060 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1959, 11, 6, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1959') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0060 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0061
     * @tc.name      testPhotosDateLocalizedBoundary0061
     * @tc.desc      Formats localized boundary date 1960.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0061 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1960, 0, 7, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1960') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0061 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0062
     * @tc.name      testPhotosDateLocalizedBoundary0062
     * @tc.desc      Formats localized boundary date 1961.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0062 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1961, 1, 8, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1961') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0062 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0063
     * @tc.name      testPhotosDateLocalizedBoundary0063
     * @tc.desc      Formats localized boundary date 1962.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0063 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1962, 2, 9, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1962') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0063 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0064
     * @tc.name      testPhotosDateLocalizedBoundary0064
     * @tc.desc      Formats localized boundary date 1963.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0064 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1963, 3, 10, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1963') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0064 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0065
     * @tc.name      testPhotosDateLocalizedBoundary0065
     * @tc.desc      Formats localized boundary date 1964.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0065 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1964, 4, 11, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1964') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0065 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0066
     * @tc.name      testPhotosDateLocalizedBoundary0066
     * @tc.desc      Formats localized boundary date 1965.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0066 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1965, 5, 12, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1965') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0066 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0067
     * @tc.name      testPhotosDateLocalizedBoundary0067
     * @tc.desc      Formats localized boundary date 1966.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0067 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1966, 6, 13, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1966') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0067 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0068
     * @tc.name      testPhotosDateLocalizedBoundary0068
     * @tc.desc      Formats localized boundary date 1967.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0068 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1967, 7, 14, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1967') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0068 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0069
     * @tc.name      testPhotosDateLocalizedBoundary0069
     * @tc.desc      Formats localized boundary date 1968.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0069 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1968, 8, 15, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1968') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0069 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0070
     * @tc.name      testPhotosDateLocalizedBoundary0070
     * @tc.desc      Formats localized boundary date 1969.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0070 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1969, 9, 16, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1969') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0070 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0071
     * @tc.name      testPhotosDateLocalizedBoundary0071
     * @tc.desc      Formats localized boundary date 1970.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0071 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1970, 10, 17, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1970') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0071 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0072
     * @tc.name      testPhotosDateLocalizedBoundary0072
     * @tc.desc      Formats localized boundary date 1971.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0072 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1971, 11, 18, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1971') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0072 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0073
     * @tc.name      testPhotosDateLocalizedBoundary0073
     * @tc.desc      Formats localized boundary date 1972.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0073 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1972, 0, 19, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1972') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0073 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0074
     * @tc.name      testPhotosDateLocalizedBoundary0074
     * @tc.desc      Formats localized boundary date 1973.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0074 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1973, 1, 20, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1973') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0074 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0075
     * @tc.name      testPhotosDateLocalizedBoundary0075
     * @tc.desc      Formats localized boundary date 1974.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0075 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1974, 2, 21, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1974') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0075 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0076
     * @tc.name      testPhotosDateLocalizedBoundary0076
     * @tc.desc      Formats localized boundary date 1975.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0076 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1975, 3, 22, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1975') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0076 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0077
     * @tc.name      testPhotosDateLocalizedBoundary0077
     * @tc.desc      Formats localized boundary date 1976.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0077 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1976, 4, 23, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1976') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0077 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0078
     * @tc.name      testPhotosDateLocalizedBoundary0078
     * @tc.desc      Formats localized boundary date 1977.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0078 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1977, 5, 24, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1977') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0078 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0079
     * @tc.name      testPhotosDateLocalizedBoundary0079
     * @tc.desc      Formats localized boundary date 1978.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0079 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1978, 6, 25, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1978') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0079 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0080
     * @tc.name      testPhotosDateLocalizedBoundary0080
     * @tc.desc      Formats localized boundary date 1979.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0080 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(1979, 7, 26, 6, 7, 8).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('1979') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0080 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0081
     * @tc.name      testPhotosDateLocalizedBoundary0081
     * @tc.desc      Formats localized boundary year 2000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0081 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2000, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2000') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0081 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0082
     * @tc.name      testPhotosDateLocalizedBoundary0082
     * @tc.desc      Formats localized boundary year 2001.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0082 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2001, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2001') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0082 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0083
     * @tc.name      testPhotosDateLocalizedBoundary0083
     * @tc.desc      Formats localized boundary year 2002.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0083 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2002, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2002') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0083 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0084
     * @tc.name      testPhotosDateLocalizedBoundary0084
     * @tc.desc      Formats localized boundary year 2003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0084 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2003, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2003') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0084 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0085
     * @tc.name      testPhotosDateLocalizedBoundary0085
     * @tc.desc      Formats localized boundary year 2004.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0085 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2004, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2004') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0085 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0086
     * @tc.name      testPhotosDateLocalizedBoundary0086
     * @tc.desc      Formats localized boundary year 2005.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0086 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2005, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2005') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0086 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0087
     * @tc.name      testPhotosDateLocalizedBoundary0087
     * @tc.desc      Formats localized boundary year 2006.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0087 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2006, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2006') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0087 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0088
     * @tc.name      testPhotosDateLocalizedBoundary0088
     * @tc.desc      Formats localized boundary year 2007.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0088 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2007, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2007') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0088 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0089
     * @tc.name      testPhotosDateLocalizedBoundary0089
     * @tc.desc      Formats localized boundary year 2008.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0089 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2008, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2008') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0089 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0090
     * @tc.name      testPhotosDateLocalizedBoundary0090
     * @tc.desc      Formats localized boundary year 2009.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0090 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2009, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2009') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0090 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0091
     * @tc.name      testPhotosDateLocalizedBoundary0091
     * @tc.desc      Formats localized boundary year 2010.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0091 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2010, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2010') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0091 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0092
     * @tc.name      testPhotosDateLocalizedBoundary0092
     * @tc.desc      Formats localized boundary year 2011.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0092 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2011, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2011') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0092 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0093
     * @tc.name      testPhotosDateLocalizedBoundary0093
     * @tc.desc      Formats localized boundary year 2012.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0093 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2012, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2012') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0093 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0094
     * @tc.name      testPhotosDateLocalizedBoundary0094
     * @tc.desc      Formats localized boundary year 2013.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0094 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2013, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2013') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0094 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0095
     * @tc.name      testPhotosDateLocalizedBoundary0095
     * @tc.desc      Formats localized boundary year 2014.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0095 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2014, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2014') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0095 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0096
     * @tc.name      testPhotosDateLocalizedBoundary0096
     * @tc.desc      Formats localized boundary year 2015.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0096 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2015, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2015') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0096 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0097
     * @tc.name      testPhotosDateLocalizedBoundary0097
     * @tc.desc      Formats localized boundary year 2016.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0097 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2016, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2016') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0097 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0098
     * @tc.name      testPhotosDateLocalizedBoundary0098
     * @tc.desc      Formats localized boundary year 2017.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0098 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2017, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2017') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0098 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0099
     * @tc.name      testPhotosDateLocalizedBoundary0099
     * @tc.desc      Formats localized boundary year 2018.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0099 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2018, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2018') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0099 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0100
     * @tc.name      testPhotosDateLocalizedBoundary0100
     * @tc.desc      Formats localized boundary year 2019.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0100 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2019, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2019') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0100 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0101
     * @tc.name      testPhotosDateLocalizedBoundary0101
     * @tc.desc      Formats localized boundary year 2020.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0101 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2020, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2020') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0101 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0102
     * @tc.name      testPhotosDateLocalizedBoundary0102
     * @tc.desc      Formats localized boundary year 2021.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0102 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2021, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2021') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0102 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0103
     * @tc.name      testPhotosDateLocalizedBoundary0103
     * @tc.desc      Formats localized boundary year 2022.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0103 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2022, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2022') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0103 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0104
     * @tc.name      testPhotosDateLocalizedBoundary0104
     * @tc.desc      Formats localized boundary year 2023.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0104 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2023, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2023') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0104 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0105
     * @tc.name      testPhotosDateLocalizedBoundary0105
     * @tc.desc      Formats localized boundary year 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0105 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2024, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2024') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0105 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0106
     * @tc.name      testPhotosDateLocalizedBoundary0106
     * @tc.desc      Formats localized boundary year 2025.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0106 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2025, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2025') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0106 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0107
     * @tc.name      testPhotosDateLocalizedBoundary0107
     * @tc.desc      Formats localized boundary year 2026.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0107 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2026, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2026') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0107 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0108
     * @tc.name      testPhotosDateLocalizedBoundary0108
     * @tc.desc      Formats localized boundary year 2027.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0108 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2027, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2027') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0108 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0109
     * @tc.name      testPhotosDateLocalizedBoundary0109
     * @tc.desc      Formats localized boundary year 2028.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0109 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2028, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2028') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0109 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0110
     * @tc.name      testPhotosDateLocalizedBoundary0110
     * @tc.desc      Formats localized boundary year 2029.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0110 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2029, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2029') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0110 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0111
     * @tc.name      testPhotosDateLocalizedBoundary0111
     * @tc.desc      Formats localized boundary year 2030.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0111 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2030, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2030') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0111 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0112
     * @tc.name      testPhotosDateLocalizedBoundary0112
     * @tc.desc      Formats localized boundary year 2031.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0112 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2031, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2031') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0112 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0113
     * @tc.name      testPhotosDateLocalizedBoundary0113
     * @tc.desc      Formats localized boundary year 2032.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0113 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2032, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2032') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0113 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0114
     * @tc.name      testPhotosDateLocalizedBoundary0114
     * @tc.desc      Formats localized boundary year 2033.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0114 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2033, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2033') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0114 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0115
     * @tc.name      testPhotosDateLocalizedBoundary0115
     * @tc.desc      Formats localized boundary year 2034.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0115 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2034, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2034') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0115 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0116
     * @tc.name      testPhotosDateLocalizedBoundary0116
     * @tc.desc      Formats localized boundary year 2035.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0116 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2035, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2035') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0116 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0117
     * @tc.name      testPhotosDateLocalizedBoundary0117
     * @tc.desc      Formats localized boundary year 2036.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0117 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2036, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2036') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0117 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0118
     * @tc.name      testPhotosDateLocalizedBoundary0118
     * @tc.desc      Formats localized boundary year 2037.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0118 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2037, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2037') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0118 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0119
     * @tc.name      testPhotosDateLocalizedBoundary0119
     * @tc.desc      Formats localized boundary year 2038.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0119 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2038, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2038') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0119 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0120
     * @tc.name      testPhotosDateLocalizedBoundary0120
     * @tc.desc      Formats localized boundary year 2039.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0120 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2039, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2039') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0120 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0121
     * @tc.name      testPhotosDateLocalizedBoundary0121
     * @tc.desc      Formats localized boundary year 2040.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0121 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2040, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2040') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0121 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0122
     * @tc.name      testPhotosDateLocalizedBoundary0122
     * @tc.desc      Formats localized boundary year 2041.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0122 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2041, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2041') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0122 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0123
     * @tc.name      testPhotosDateLocalizedBoundary0123
     * @tc.desc      Formats localized boundary year 2042.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0123 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2042, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2042') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0123 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0124
     * @tc.name      testPhotosDateLocalizedBoundary0124
     * @tc.desc      Formats localized boundary year 2043.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0124 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2043, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2043') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0124 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0125
     * @tc.name      testPhotosDateLocalizedBoundary0125
     * @tc.desc      Formats localized boundary year 2044.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0125 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2044, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2044') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0125 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0126
     * @tc.name      testPhotosDateLocalizedBoundary0126
     * @tc.desc      Formats localized boundary year 2045.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0126 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2045, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2045') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0126 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0127
     * @tc.name      testPhotosDateLocalizedBoundary0127
     * @tc.desc      Formats localized boundary year 2046.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0127 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2046, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2046') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0127 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0128
     * @tc.name      testPhotosDateLocalizedBoundary0128
     * @tc.desc      Formats localized boundary year 2047.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0128 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2047, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2047') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0128 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0129
     * @tc.name      testPhotosDateLocalizedBoundary0129
     * @tc.desc      Formats localized boundary year 2048.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0129 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2048, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2048') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0129 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0130
     * @tc.name      testPhotosDateLocalizedBoundary0130
     * @tc.desc      Formats localized boundary year 2049.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0130 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2049, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2049') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0130 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0131
     * @tc.name      testPhotosDateLocalizedBoundary0131
     * @tc.desc      Formats localized boundary year 2050.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0131 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2050, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2050') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0131 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0132
     * @tc.name      testPhotosDateLocalizedBoundary0132
     * @tc.desc      Formats localized boundary year 2051.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0132 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2051, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2051') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0132 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0133
     * @tc.name      testPhotosDateLocalizedBoundary0133
     * @tc.desc      Formats localized boundary year 2052.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0133 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2052, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2052') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0133 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0134
     * @tc.name      testPhotosDateLocalizedBoundary0134
     * @tc.desc      Formats localized boundary year 2053.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0134 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2053, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2053') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0134 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0135
     * @tc.name      testPhotosDateLocalizedBoundary0135
     * @tc.desc      Formats localized boundary year 2054.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0135 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2054, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2054') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0135 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0136
     * @tc.name      testPhotosDateLocalizedBoundary0136
     * @tc.desc      Formats localized boundary year 2055.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0136 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2055, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2055') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0136 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0137
     * @tc.name      testPhotosDateLocalizedBoundary0137
     * @tc.desc      Formats localized boundary year 2056.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0137 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2056, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2056') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0137 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0138
     * @tc.name      testPhotosDateLocalizedBoundary0138
     * @tc.desc      Formats localized boundary year 2057.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0138 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2057, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2057') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0138 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0139
     * @tc.name      testPhotosDateLocalizedBoundary0139
     * @tc.desc      Formats localized boundary year 2058.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0139 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2058, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2058') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0139 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0140
     * @tc.name      testPhotosDateLocalizedBoundary0140
     * @tc.desc      Formats localized boundary year 2059.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0140 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2059, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2059') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0140 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0141
     * @tc.name      testPhotosDateLocalizedBoundary0141
     * @tc.desc      Formats localized boundary year-month 1960.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0141 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1960, 0, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1960') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0141 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0142
     * @tc.name      testPhotosDateLocalizedBoundary0142
     * @tc.desc      Formats localized boundary year-month 1961.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0142 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1961, 1, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1961') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0142 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0143
     * @tc.name      testPhotosDateLocalizedBoundary0143
     * @tc.desc      Formats localized boundary year-month 1962.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0143 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1962, 2, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1962') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0143 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0144
     * @tc.name      testPhotosDateLocalizedBoundary0144
     * @tc.desc      Formats localized boundary year-month 1963.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0144 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1963, 3, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1963') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0144 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0145
     * @tc.name      testPhotosDateLocalizedBoundary0145
     * @tc.desc      Formats localized boundary year-month 1964.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0145 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1964, 4, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1964') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0145 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0146
     * @tc.name      testPhotosDateLocalizedBoundary0146
     * @tc.desc      Formats localized boundary year-month 1965.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0146 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1965, 5, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1965') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0146 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0147
     * @tc.name      testPhotosDateLocalizedBoundary0147
     * @tc.desc      Formats localized boundary year-month 1966.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0147 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1966, 6, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1966') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0147 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0148
     * @tc.name      testPhotosDateLocalizedBoundary0148
     * @tc.desc      Formats localized boundary year-month 1967.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0148 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1967, 7, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1967') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0148 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0149
     * @tc.name      testPhotosDateLocalizedBoundary0149
     * @tc.desc      Formats localized boundary year-month 1968.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0149 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1968, 8, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1968') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0149 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0150
     * @tc.name      testPhotosDateLocalizedBoundary0150
     * @tc.desc      Formats localized boundary year-month 1969.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0150 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1969, 9, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1969') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0150 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0151
     * @tc.name      testPhotosDateLocalizedBoundary0151
     * @tc.desc      Formats localized boundary year-month 1970.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0151 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1970, 10, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1970') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0151 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0152
     * @tc.name      testPhotosDateLocalizedBoundary0152
     * @tc.desc      Formats localized boundary year-month 1971.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0152 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1971, 11, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1971') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0152 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0153
     * @tc.name      testPhotosDateLocalizedBoundary0153
     * @tc.desc      Formats localized boundary year-month 1972.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0153 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1972, 0, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1972') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0153 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0154
     * @tc.name      testPhotosDateLocalizedBoundary0154
     * @tc.desc      Formats localized boundary year-month 1973.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0154 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1973, 1, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1973') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0154 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0155
     * @tc.name      testPhotosDateLocalizedBoundary0155
     * @tc.desc      Formats localized boundary year-month 1974.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0155 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1974, 2, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1974') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0155 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0156
     * @tc.name      testPhotosDateLocalizedBoundary0156
     * @tc.desc      Formats localized boundary year-month 1975.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0156 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1975, 3, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1975') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0156 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0157
     * @tc.name      testPhotosDateLocalizedBoundary0157
     * @tc.desc      Formats localized boundary year-month 1976.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0157 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1976, 4, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1976') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0157 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0158
     * @tc.name      testPhotosDateLocalizedBoundary0158
     * @tc.desc      Formats localized boundary year-month 1977.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0158 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1977, 5, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1977') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0158 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0159
     * @tc.name      testPhotosDateLocalizedBoundary0159
     * @tc.desc      Formats localized boundary year-month 1978.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0159 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1978, 6, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1978') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0159 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0160
     * @tc.name      testPhotosDateLocalizedBoundary0160
     * @tc.desc      Formats localized boundary year-month 1979.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0160 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1979, 7, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1979') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0160 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0161
     * @tc.name      testPhotosDateLocalizedBoundary0161
     * @tc.desc      Formats localized boundary year-month 1980.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0161 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1980, 8, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1980') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0161 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0162
     * @tc.name      testPhotosDateLocalizedBoundary0162
     * @tc.desc      Formats localized boundary year-month 1981.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0162 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1981, 9, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1981') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0162 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0163
     * @tc.name      testPhotosDateLocalizedBoundary0163
     * @tc.desc      Formats localized boundary year-month 1982.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0163 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1982, 10, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1982') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0163 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0164
     * @tc.name      testPhotosDateLocalizedBoundary0164
     * @tc.desc      Formats localized boundary year-month 1983.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0164 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1983, 11, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1983') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0164 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0165
     * @tc.name      testPhotosDateLocalizedBoundary0165
     * @tc.desc      Formats localized boundary year-month 1984.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0165 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1984, 0, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1984') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0165 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0166
     * @tc.name      testPhotosDateLocalizedBoundary0166
     * @tc.desc      Formats localized boundary year-month 1985.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0166 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1985, 1, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1985') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0166 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0167
     * @tc.name      testPhotosDateLocalizedBoundary0167
     * @tc.desc      Formats localized boundary year-month 1986.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0167 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1986, 2, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1986') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0167 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0168
     * @tc.name      testPhotosDateLocalizedBoundary0168
     * @tc.desc      Formats localized boundary year-month 1987.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0168 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1987, 3, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1987') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0168 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0169
     * @tc.name      testPhotosDateLocalizedBoundary0169
     * @tc.desc      Formats localized boundary year-month 1988.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0169 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1988, 4, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1988') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0169 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0170
     * @tc.name      testPhotosDateLocalizedBoundary0170
     * @tc.desc      Formats localized boundary year-month 1989.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0170 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1989, 5, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1989') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0170 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0171
     * @tc.name      testPhotosDateLocalizedBoundary0171
     * @tc.desc      Formats localized boundary year-month 1990.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0171 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1990, 6, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1990') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0171 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0172
     * @tc.name      testPhotosDateLocalizedBoundary0172
     * @tc.desc      Formats localized boundary year-month 1991.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0172 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1991, 7, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1991') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0172 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0173
     * @tc.name      testPhotosDateLocalizedBoundary0173
     * @tc.desc      Formats localized boundary year-month 1992.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0173 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1992, 8, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1992') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0173 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0174
     * @tc.name      testPhotosDateLocalizedBoundary0174
     * @tc.desc      Formats localized boundary year-month 1993.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0174 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1993, 9, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1993') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0174 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0175
     * @tc.name      testPhotosDateLocalizedBoundary0175
     * @tc.desc      Formats localized boundary year-month 1994.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0175 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1994, 10, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1994') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0175 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0176
     * @tc.name      testPhotosDateLocalizedBoundary0176
     * @tc.desc      Formats localized boundary year-month 1995.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0176 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1995, 11, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1995') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0176 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0177
     * @tc.name      testPhotosDateLocalizedBoundary0177
     * @tc.desc      Formats localized boundary year-month 1996.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0177 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1996, 0, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1996') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0177 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0178
     * @tc.name      testPhotosDateLocalizedBoundary0178
     * @tc.desc      Formats localized boundary year-month 1997.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0178 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1997, 1, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1997') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0178 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0179
     * @tc.name      testPhotosDateLocalizedBoundary0179
     * @tc.desc      Formats localized boundary year-month 1998.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0179 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1998, 2, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1998') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0179 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0180
     * @tc.name      testPhotosDateLocalizedBoundary0180
     * @tc.desc      Formats localized boundary year-month 1999.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0180 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(1999, 3, 15, 12, 0, 0).getTime());
      expect(result.indexOf('1999') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0180 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0181
     * @tc.name      testPhotosDateLocalizedBoundary0181
     * @tc.desc      Formats localized boundary time sample 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0181 begin');
      const result: string = DateUtil.getLocalizedTime(new Date(2024, 0, 1, 0, 0, 0).getTime());
      expect(result.length >= 4).assertTrue();
      expect(result.indexOf(':') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0181 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0182
     * @tc.name      testPhotosDateLocalizedBoundary0182
     * @tc.desc      Formats localized boundary time sample 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0182 begin');
      const result: string = DateUtil.getLocalizedTime(new Date(2024, 1, 2, 6, 15, 0).getTime());
      expect(result.length >= 4).assertTrue();
      expect(result.indexOf(':') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0182 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0183
     * @tc.name      testPhotosDateLocalizedBoundary0183
     * @tc.desc      Formats localized boundary time sample 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0183 begin');
      const result: string = DateUtil.getLocalizedTime(new Date(2024, 2, 3, 12, 30, 0).getTime());
      expect(result.length >= 4).assertTrue();
      expect(result.indexOf(':') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0183 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0184
     * @tc.name      testPhotosDateLocalizedBoundary0184
     * @tc.desc      Formats localized boundary time sample 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0184 begin');
      const result: string = DateUtil.getLocalizedTime(new Date(2024, 3, 4, 18, 45, 0).getTime());
      expect(result.length >= 4).assertTrue();
      expect(result.indexOf(':') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0184 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0185
     * @tc.name      testPhotosDateLocalizedBoundary0185
     * @tc.desc      Formats localized boundary time sample 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0185 begin');
      const result: string = DateUtil.getLocalizedTime(new Date(2024, 4, 5, 23, 0, 0).getTime());
      expect(result.length >= 4).assertTrue();
      expect(result.indexOf(':') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0185 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0186
     * @tc.name      testPhotosDateLocalizedBoundary0186
     * @tc.desc      Formats localized boundary time sample 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0186 begin');
      const result: string = DateUtil.getLocalizedTime(new Date(2024, 5, 6, 0, 15, 0).getTime());
      expect(result.length >= 4).assertTrue();
      expect(result.indexOf(':') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0186 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0187
     * @tc.name      testPhotosDateLocalizedBoundary0187
     * @tc.desc      Formats localized boundary time sample 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0187 begin');
      const result: string = DateUtil.getLocalizedTime(new Date(2024, 6, 7, 6, 30, 0).getTime());
      expect(result.length >= 4).assertTrue();
      expect(result.indexOf(':') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0187 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0188
     * @tc.name      testPhotosDateLocalizedBoundary0188
     * @tc.desc      Formats localized boundary time sample 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0188 begin');
      const result: string = DateUtil.getLocalizedTime(new Date(2024, 7, 8, 12, 45, 0).getTime());
      expect(result.length >= 4).assertTrue();
      expect(result.indexOf(':') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0188 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0189
     * @tc.name      testPhotosDateLocalizedBoundary0189
     * @tc.desc      Formats localized boundary time sample 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0189 begin');
      const result: string = DateUtil.getLocalizedTime(new Date(2024, 8, 9, 18, 0, 0).getTime());
      expect(result.length >= 4).assertTrue();
      expect(result.indexOf(':') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0189 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0190
     * @tc.name      testPhotosDateLocalizedBoundary0190
     * @tc.desc      Formats localized boundary time sample 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0190 begin');
      const result: string = DateUtil.getLocalizedTime(new Date(2024, 9, 10, 23, 15, 0).getTime());
      expect(result.length >= 4).assertTrue();
      expect(result.indexOf(':') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0190 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0191
     * @tc.name      testPhotosDateLocalizedBoundary0191
     * @tc.desc      Formats localized boundary time sample 11.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0191 begin');
      const result: string = DateUtil.getLocalizedTime(new Date(2024, 10, 11, 0, 30, 0).getTime());
      expect(result.length >= 4).assertTrue();
      expect(result.indexOf(':') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0191 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0192
     * @tc.name      testPhotosDateLocalizedBoundary0192
     * @tc.desc      Formats localized boundary time sample 12.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0192 begin');
      const result: string = DateUtil.getLocalizedTime(new Date(2024, 11, 12, 6, 45, 0).getTime());
      expect(result.length >= 4).assertTrue();
      expect(result.indexOf(':') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0192 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0193
     * @tc.name      testPhotosDateLocalizedBoundary0193
     * @tc.desc      Formats localized boundary time sample 13.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0193 begin');
      const result: string = DateUtil.getLocalizedTime(new Date(2024, 0, 13, 12, 0, 0).getTime());
      expect(result.length >= 4).assertTrue();
      expect(result.indexOf(':') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0193 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0194
     * @tc.name      testPhotosDateLocalizedBoundary0194
     * @tc.desc      Formats localized boundary time sample 14.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0194 begin');
      const result: string = DateUtil.getLocalizedTime(new Date(2024, 1, 14, 18, 15, 0).getTime());
      expect(result.length >= 4).assertTrue();
      expect(result.indexOf(':') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0194 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0195
     * @tc.name      testPhotosDateLocalizedBoundary0195
     * @tc.desc      Formats localized boundary time sample 15.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0195 begin');
      const result: string = DateUtil.getLocalizedTime(new Date(2024, 2, 15, 23, 30, 0).getTime());
      expect(result.length >= 4).assertTrue();
      expect(result.indexOf(':') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0195 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0196
     * @tc.name      testPhotosDateLocalizedBoundary0196
     * @tc.desc      Formats localized boundary time sample 16.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0196 begin');
      const result: string = DateUtil.getLocalizedTime(new Date(2024, 3, 16, 0, 45, 0).getTime());
      expect(result.length >= 4).assertTrue();
      expect(result.indexOf(':') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0196 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0197
     * @tc.name      testPhotosDateLocalizedBoundary0197
     * @tc.desc      Formats localized boundary time sample 17.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0197 begin');
      const result: string = DateUtil.getLocalizedTime(new Date(2024, 4, 17, 6, 0, 0).getTime());
      expect(result.length >= 4).assertTrue();
      expect(result.indexOf(':') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0197 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0198
     * @tc.name      testPhotosDateLocalizedBoundary0198
     * @tc.desc      Formats localized boundary time sample 18.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0198 begin');
      const result: string = DateUtil.getLocalizedTime(new Date(2024, 5, 18, 12, 15, 0).getTime());
      expect(result.length >= 4).assertTrue();
      expect(result.indexOf(':') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0198 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0199
     * @tc.name      testPhotosDateLocalizedBoundary0199
     * @tc.desc      Formats localized boundary time sample 19.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0199 begin');
      const result: string = DateUtil.getLocalizedTime(new Date(2024, 6, 19, 18, 30, 0).getTime());
      expect(result.length >= 4).assertTrue();
      expect(result.indexOf(':') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0199 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_BOUNDARY_0200
     * @tc.name      testPhotosDateLocalizedBoundary0200
     * @tc.desc      Formats localized boundary time sample 20.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedBoundary0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0200 begin');
      const result: string = DateUtil.getLocalizedTime(new Date(2024, 7, 20, 23, 45, 0).getTime());
      expect(result.length >= 4).assertTrue();
      expect(result.indexOf(':') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedBoundary0200 end');
    })
  })
}
