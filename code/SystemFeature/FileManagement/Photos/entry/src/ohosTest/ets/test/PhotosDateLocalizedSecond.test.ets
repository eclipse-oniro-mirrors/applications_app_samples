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

const TAG = '[Sample_PhotosDateLocalizedSecondTest]';
const DOMAIN = 0xF811;

export default function PhotosDateLocalizedSecondTest(): void {
  describe('PhotosDateLocalizedSecondTest', () => {
    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0001
     * @tc.name      testPhotosDateLocalizedSecond0001
     * @tc.desc      Formats second localized date for year 2100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0001 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2100, 0, 1, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2100') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0002
     * @tc.name      testPhotosDateLocalizedSecond0002
     * @tc.desc      Formats second localized date for year 2101.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0002 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2101, 1, 2, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2101') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0003
     * @tc.name      testPhotosDateLocalizedSecond0003
     * @tc.desc      Formats second localized date for year 2102.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0003 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2102, 2, 3, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2102') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0003 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0004
     * @tc.name      testPhotosDateLocalizedSecond0004
     * @tc.desc      Formats second localized date for year 2103.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0004 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2103, 3, 4, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2103') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0004 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0005
     * @tc.name      testPhotosDateLocalizedSecond0005
     * @tc.desc      Formats second localized date for year 2104.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0005 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2104, 4, 5, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2104') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0005 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0006
     * @tc.name      testPhotosDateLocalizedSecond0006
     * @tc.desc      Formats second localized date for year 2105.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0006 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2105, 5, 6, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2105') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0006 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0007
     * @tc.name      testPhotosDateLocalizedSecond0007
     * @tc.desc      Formats second localized date for year 2106.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0007 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2106, 6, 7, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2106') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0007 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0008
     * @tc.name      testPhotosDateLocalizedSecond0008
     * @tc.desc      Formats second localized date for year 2107.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0008 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2107, 7, 8, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2107') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0008 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0009
     * @tc.name      testPhotosDateLocalizedSecond0009
     * @tc.desc      Formats second localized date for year 2108.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0009 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2108, 8, 9, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2108') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0009 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0010
     * @tc.name      testPhotosDateLocalizedSecond0010
     * @tc.desc      Formats second localized date for year 2109.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0010 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2109, 9, 10, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2109') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0010 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0011
     * @tc.name      testPhotosDateLocalizedSecond0011
     * @tc.desc      Formats second localized date for year 2110.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0011 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2110, 10, 11, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2110') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0011 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0012
     * @tc.name      testPhotosDateLocalizedSecond0012
     * @tc.desc      Formats second localized date for year 2111.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0012 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2111, 11, 12, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2111') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0012 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0013
     * @tc.name      testPhotosDateLocalizedSecond0013
     * @tc.desc      Formats second localized date for year 2112.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0013 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2112, 0, 13, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2112') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0013 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0014
     * @tc.name      testPhotosDateLocalizedSecond0014
     * @tc.desc      Formats second localized date for year 2113.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0014 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2113, 1, 14, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2113') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0014 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0015
     * @tc.name      testPhotosDateLocalizedSecond0015
     * @tc.desc      Formats second localized date for year 2114.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0015 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2114, 2, 15, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2114') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0015 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0016
     * @tc.name      testPhotosDateLocalizedSecond0016
     * @tc.desc      Formats second localized date for year 2115.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0016 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2115, 3, 16, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2115') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0016 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0017
     * @tc.name      testPhotosDateLocalizedSecond0017
     * @tc.desc      Formats second localized date for year 2116.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0017 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2116, 4, 17, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2116') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0017 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0018
     * @tc.name      testPhotosDateLocalizedSecond0018
     * @tc.desc      Formats second localized date for year 2117.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0018 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2117, 5, 18, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2117') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0018 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0019
     * @tc.name      testPhotosDateLocalizedSecond0019
     * @tc.desc      Formats second localized date for year 2118.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0019 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2118, 6, 19, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2118') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0019 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0020
     * @tc.name      testPhotosDateLocalizedSecond0020
     * @tc.desc      Formats second localized date for year 2119.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0020 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2119, 7, 20, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2119') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0020 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0021
     * @tc.name      testPhotosDateLocalizedSecond0021
     * @tc.desc      Formats second localized date for year 2120.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0021 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2120, 8, 21, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2120') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0021 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0022
     * @tc.name      testPhotosDateLocalizedSecond0022
     * @tc.desc      Formats second localized date for year 2121.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0022 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2121, 9, 22, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2121') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0022 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0023
     * @tc.name      testPhotosDateLocalizedSecond0023
     * @tc.desc      Formats second localized date for year 2122.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0023 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2122, 10, 23, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2122') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0023 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0024
     * @tc.name      testPhotosDateLocalizedSecond0024
     * @tc.desc      Formats second localized date for year 2123.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0024 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2123, 11, 24, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2123') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0024 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0025
     * @tc.name      testPhotosDateLocalizedSecond0025
     * @tc.desc      Formats second localized date for year 2124.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0025 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2124, 0, 25, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2124') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0025 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0026
     * @tc.name      testPhotosDateLocalizedSecond0026
     * @tc.desc      Formats second localized date for year 2125.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0026 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2125, 1, 26, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2125') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0026 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0027
     * @tc.name      testPhotosDateLocalizedSecond0027
     * @tc.desc      Formats second localized date for year 2126.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0027 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2126, 2, 27, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2126') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0027 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0028
     * @tc.name      testPhotosDateLocalizedSecond0028
     * @tc.desc      Formats second localized date for year 2127.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0028 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2127, 3, 1, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2127') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0028 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0029
     * @tc.name      testPhotosDateLocalizedSecond0029
     * @tc.desc      Formats second localized date for year 2128.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0029 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2128, 4, 2, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2128') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0029 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0030
     * @tc.name      testPhotosDateLocalizedSecond0030
     * @tc.desc      Formats second localized date for year 2129.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0030 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2129, 5, 3, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2129') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0030 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0031
     * @tc.name      testPhotosDateLocalizedSecond0031
     * @tc.desc      Formats second localized date for year 2130.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0031 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2130, 6, 4, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2130') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0031 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0032
     * @tc.name      testPhotosDateLocalizedSecond0032
     * @tc.desc      Formats second localized date for year 2131.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0032 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2131, 7, 5, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2131') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0032 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0033
     * @tc.name      testPhotosDateLocalizedSecond0033
     * @tc.desc      Formats second localized date for year 2132.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0033 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2132, 8, 6, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2132') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0033 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0034
     * @tc.name      testPhotosDateLocalizedSecond0034
     * @tc.desc      Formats second localized date for year 2133.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0034 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2133, 9, 7, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2133') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0034 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0035
     * @tc.name      testPhotosDateLocalizedSecond0035
     * @tc.desc      Formats second localized date for year 2134.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0035 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2134, 10, 8, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2134') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0035 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0036
     * @tc.name      testPhotosDateLocalizedSecond0036
     * @tc.desc      Formats second localized date for year 2135.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0036 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2135, 11, 9, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2135') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0036 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0037
     * @tc.name      testPhotosDateLocalizedSecond0037
     * @tc.desc      Formats second localized date for year 2136.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0037 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2136, 0, 10, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2136') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0037 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0038
     * @tc.name      testPhotosDateLocalizedSecond0038
     * @tc.desc      Formats second localized date for year 2137.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0038 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2137, 1, 11, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2137') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0038 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0039
     * @tc.name      testPhotosDateLocalizedSecond0039
     * @tc.desc      Formats second localized date for year 2138.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0039 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2138, 2, 12, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2138') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0039 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0040
     * @tc.name      testPhotosDateLocalizedSecond0040
     * @tc.desc      Formats second localized date for year 2139.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0040 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2139, 3, 13, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2139') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0040 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0041
     * @tc.name      testPhotosDateLocalizedSecond0041
     * @tc.desc      Formats second localized date for year 2140.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0041 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2140, 4, 14, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2140') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0041 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0042
     * @tc.name      testPhotosDateLocalizedSecond0042
     * @tc.desc      Formats second localized date for year 2141.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0042 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2141, 5, 15, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2141') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0042 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0043
     * @tc.name      testPhotosDateLocalizedSecond0043
     * @tc.desc      Formats second localized date for year 2142.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0043 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2142, 6, 16, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2142') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0043 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0044
     * @tc.name      testPhotosDateLocalizedSecond0044
     * @tc.desc      Formats second localized date for year 2143.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0044 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2143, 7, 17, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2143') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0044 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0045
     * @tc.name      testPhotosDateLocalizedSecond0045
     * @tc.desc      Formats second localized date for year 2144.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0045 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2144, 8, 18, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2144') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0045 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0046
     * @tc.name      testPhotosDateLocalizedSecond0046
     * @tc.desc      Formats second localized date for year 2145.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0046 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2145, 9, 19, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2145') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0046 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0047
     * @tc.name      testPhotosDateLocalizedSecond0047
     * @tc.desc      Formats second localized date for year 2146.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0047 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2146, 10, 20, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2146') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0047 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0048
     * @tc.name      testPhotosDateLocalizedSecond0048
     * @tc.desc      Formats second localized date for year 2147.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0048 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2147, 11, 21, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2147') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0048 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0049
     * @tc.name      testPhotosDateLocalizedSecond0049
     * @tc.desc      Formats second localized date for year 2148.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0049 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2148, 0, 22, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2148') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0049 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0050
     * @tc.name      testPhotosDateLocalizedSecond0050
     * @tc.desc      Formats second localized date for year 2149.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0050 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2149, 1, 23, 9, 10, 11).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2149') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0050 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_SECOND_0051
     * @tc.name      testPhotosDateLocalizedSecond0051
     * @tc.desc      Formats second localized year 2100.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalizedSecond0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0051 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2100, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2100') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalizedSecond0051 end');
    })

    /**
