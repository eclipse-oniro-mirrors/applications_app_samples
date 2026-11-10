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

const TAG = '[Sample_PhotosDateLocalizedTest]';
const DOMAIN = 0xF811;

export default function PhotosDateLocalizedTest(): void {
  describe('PhotosDateLocalizedTest', () => {
    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0001
     * @tc.name      testPhotosDateLocalized0001
     * @tc.desc      Formats localized date for year 2000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0001 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2000, 0, 1, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2000') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0001 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0002
     * @tc.name      testPhotosDateLocalized0002
     * @tc.desc      Formats localized date for year 2001.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0002 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2001, 1, 2, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2001') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0002 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0003
     * @tc.name      testPhotosDateLocalized0003
     * @tc.desc      Formats localized date for year 2002.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0003 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2002, 2, 3, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2002') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0003 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0004
     * @tc.name      testPhotosDateLocalized0004
     * @tc.desc      Formats localized date for year 2003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0004 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2003, 3, 4, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2003') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0004 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0005
     * @tc.name      testPhotosDateLocalized0005
     * @tc.desc      Formats localized date for year 2004.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0005 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2004, 4, 5, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2004') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0005 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0006
     * @tc.name      testPhotosDateLocalized0006
     * @tc.desc      Formats localized date for year 2005.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0006 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2005, 5, 6, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2005') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0006 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0007
     * @tc.name      testPhotosDateLocalized0007
     * @tc.desc      Formats localized date for year 2006.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0007 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2006, 6, 7, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2006') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0007 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0008
     * @tc.name      testPhotosDateLocalized0008
     * @tc.desc      Formats localized date for year 2007.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0008 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2007, 7, 8, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2007') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0008 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0009
     * @tc.name      testPhotosDateLocalized0009
     * @tc.desc      Formats localized date for year 2008.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0009 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2008, 8, 9, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2008') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0009 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0010
     * @tc.name      testPhotosDateLocalized0010
     * @tc.desc      Formats localized date for year 2009.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0010 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2009, 9, 10, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2009') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0010 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0011
     * @tc.name      testPhotosDateLocalized0011
     * @tc.desc      Formats localized date for year 2010.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0011 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2010, 10, 11, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2010') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0011 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0012
     * @tc.name      testPhotosDateLocalized0012
     * @tc.desc      Formats localized date for year 2011.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0012 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2011, 11, 12, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2011') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0012 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0013
     * @tc.name      testPhotosDateLocalized0013
     * @tc.desc      Formats localized date for year 2012.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0013 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2012, 0, 13, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2012') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0013 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0014
     * @tc.name      testPhotosDateLocalized0014
     * @tc.desc      Formats localized date for year 2013.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0014 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2013, 1, 14, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2013') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0014 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0015
     * @tc.name      testPhotosDateLocalized0015
     * @tc.desc      Formats localized date for year 2014.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0015 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2014, 2, 15, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2014') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0015 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0016
     * @tc.name      testPhotosDateLocalized0016
     * @tc.desc      Formats localized date for year 2015.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0016 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2015, 3, 16, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2015') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0016 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0017
     * @tc.name      testPhotosDateLocalized0017
     * @tc.desc      Formats localized date for year 2016.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0017 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2016, 4, 17, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2016') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0017 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0018
     * @tc.name      testPhotosDateLocalized0018
     * @tc.desc      Formats localized date for year 2017.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0018 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2017, 5, 18, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2017') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0018 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0019
     * @tc.name      testPhotosDateLocalized0019
     * @tc.desc      Formats localized date for year 2018.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0019 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2018, 6, 19, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2018') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0019 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0020
     * @tc.name      testPhotosDateLocalized0020
     * @tc.desc      Formats localized date for year 2019.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0020 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2019, 7, 20, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2019') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0020 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0021
     * @tc.name      testPhotosDateLocalized0021
     * @tc.desc      Formats localized date for year 2020.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0021 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2020, 8, 21, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2020') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0021 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0022
     * @tc.name      testPhotosDateLocalized0022
     * @tc.desc      Formats localized date for year 2021.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0022 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2021, 9, 22, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2021') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0022 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0023
     * @tc.name      testPhotosDateLocalized0023
     * @tc.desc      Formats localized date for year 2022.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0023 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2022, 10, 23, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2022') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0023 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0024
     * @tc.name      testPhotosDateLocalized0024
     * @tc.desc      Formats localized date for year 2023.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0024 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2023, 11, 24, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2023') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0024 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0025
     * @tc.name      testPhotosDateLocalized0025
     * @tc.desc      Formats localized date for year 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0025 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2024, 0, 25, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2024') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0025 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0026
     * @tc.name      testPhotosDateLocalized0026
     * @tc.desc      Formats localized date for year 2025.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0026 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2025, 1, 26, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2025') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0026 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0027
     * @tc.name      testPhotosDateLocalized0027
     * @tc.desc      Formats localized date for year 2026.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0027 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2026, 2, 27, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2026') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0027 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0028
     * @tc.name      testPhotosDateLocalized0028
     * @tc.desc      Formats localized date for year 2027.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0028 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2027, 3, 1, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2027') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0028 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0029
     * @tc.name      testPhotosDateLocalized0029
     * @tc.desc      Formats localized date for year 2028.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0029 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2028, 4, 2, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2028') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0029 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0030
     * @tc.name      testPhotosDateLocalized0030
     * @tc.desc      Formats localized date for year 2029.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0030 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2029, 5, 3, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2029') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0030 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0031
     * @tc.name      testPhotosDateLocalized0031
     * @tc.desc      Formats localized date for year 2030.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0031 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2030, 6, 4, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2030') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0031 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0032
     * @tc.name      testPhotosDateLocalized0032
     * @tc.desc      Formats localized date for year 2031.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0032 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2031, 7, 5, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2031') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0032 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0033
     * @tc.name      testPhotosDateLocalized0033
     * @tc.desc      Formats localized date for year 2032.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0033 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2032, 8, 6, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2032') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0033 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0034
     * @tc.name      testPhotosDateLocalized0034
     * @tc.desc      Formats localized date for year 2033.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0034 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2033, 9, 7, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2033') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0034 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0035
     * @tc.name      testPhotosDateLocalized0035
     * @tc.desc      Formats localized date for year 2034.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0035 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2034, 10, 8, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2034') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0035 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0036
     * @tc.name      testPhotosDateLocalized0036
     * @tc.desc      Formats localized date for year 2035.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0036 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2035, 11, 9, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2035') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0036 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0037
     * @tc.name      testPhotosDateLocalized0037
     * @tc.desc      Formats localized date for year 2036.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0037 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2036, 0, 10, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2036') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0037 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0038
     * @tc.name      testPhotosDateLocalized0038
     * @tc.desc      Formats localized date for year 2037.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0038 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2037, 1, 11, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2037') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0038 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0039
     * @tc.name      testPhotosDateLocalized0039
     * @tc.desc      Formats localized date for year 2038.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0039 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2038, 2, 12, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2038') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0039 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0040
     * @tc.name      testPhotosDateLocalized0040
     * @tc.desc      Formats localized date for year 2039.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0040 begin');
      const result: string = DateUtil.getLocalizedDate(new Date(2039, 3, 13, 10, 20, 30).getTime());
      expect(result.length > 0).assertTrue();
      expect(result.indexOf('2039') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0040 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0041
     * @tc.name      testPhotosDateLocalized0041
     * @tc.desc      Formats localized year string 2000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0041 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2000, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2000') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0041 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0042
     * @tc.name      testPhotosDateLocalized0042
     * @tc.desc      Formats localized year string 2001.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0042 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2001, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2001') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0042 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0043
     * @tc.name      testPhotosDateLocalized0043
     * @tc.desc      Formats localized year string 2002.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0043 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2002, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2002') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0043 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0044
     * @tc.name      testPhotosDateLocalized0044
     * @tc.desc      Formats localized year string 2003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0044 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2003, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2003') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0044 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0045
     * @tc.name      testPhotosDateLocalized0045
     * @tc.desc      Formats localized year string 2004.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0045 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2004, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2004') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0045 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0046
     * @tc.name      testPhotosDateLocalized0046
     * @tc.desc      Formats localized year string 2005.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0046 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2005, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2005') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0046 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0047
     * @tc.name      testPhotosDateLocalized0047
     * @tc.desc      Formats localized year string 2006.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0047 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2006, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2006') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0047 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0048
     * @tc.name      testPhotosDateLocalized0048
     * @tc.desc      Formats localized year string 2007.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0048 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2007, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2007') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0048 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0049
     * @tc.name      testPhotosDateLocalized0049
     * @tc.desc      Formats localized year string 2008.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0049 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2008, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2008') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0049 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0050
     * @tc.name      testPhotosDateLocalized0050
     * @tc.desc      Formats localized year string 2009.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0050 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2009, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2009') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0050 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0051
     * @tc.name      testPhotosDateLocalized0051
     * @tc.desc      Formats localized year string 2010.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0051 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2010, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2010') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0051 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0052
     * @tc.name      testPhotosDateLocalized0052
     * @tc.desc      Formats localized year string 2011.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0052 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2011, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2011') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0052 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0053
     * @tc.name      testPhotosDateLocalized0053
     * @tc.desc      Formats localized year string 2012.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0053 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2012, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2012') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0053 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0054
     * @tc.name      testPhotosDateLocalized0054
     * @tc.desc      Formats localized year string 2013.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0054 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2013, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2013') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0054 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0055
     * @tc.name      testPhotosDateLocalized0055
     * @tc.desc      Formats localized year string 2014.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0055 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2014, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2014') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0055 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0056
     * @tc.name      testPhotosDateLocalized0056
     * @tc.desc      Formats localized year string 2015.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0056 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2015, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2015') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0056 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0057
     * @tc.name      testPhotosDateLocalized0057
     * @tc.desc      Formats localized year string 2016.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0057 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2016, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2016') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0057 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0058
     * @tc.name      testPhotosDateLocalized0058
     * @tc.desc      Formats localized year string 2017.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0058 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2017, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2017') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0058 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0059
     * @tc.name      testPhotosDateLocalized0059
     * @tc.desc      Formats localized year string 2018.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0059 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2018, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2018') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0059 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0060
     * @tc.name      testPhotosDateLocalized0060
     * @tc.desc      Formats localized year string 2019.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0060 begin');
      const result: string = DateUtil.getLocalizedYearString(new Date(2019, 0, 1, 0, 0, 0).getTime());
      expect(result.indexOf('2019') >= 0).assertTrue();
      expect(result.length >= 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0060 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0061
     * @tc.name      testPhotosDateLocalized0061
     * @tc.desc      Formats localized year and month 2000.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0061 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(2000, 0, 15, 8, 8, 8).getTime());
      expect(result.indexOf('2000') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0061 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0062
     * @tc.name      testPhotosDateLocalized0062
     * @tc.desc      Formats localized year and month 2001.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0062 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(2001, 1, 15, 8, 8, 8).getTime());
      expect(result.indexOf('2001') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0062 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0063
     * @tc.name      testPhotosDateLocalized0063
     * @tc.desc      Formats localized year and month 2002.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0063 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(2002, 2, 15, 8, 8, 8).getTime());
      expect(result.indexOf('2002') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0063 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0064
     * @tc.name      testPhotosDateLocalized0064
     * @tc.desc      Formats localized year and month 2003.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0064 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(2003, 3, 15, 8, 8, 8).getTime());
      expect(result.indexOf('2003') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0064 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0065
     * @tc.name      testPhotosDateLocalized0065
     * @tc.desc      Formats localized year and month 2004.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0065 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(2004, 4, 15, 8, 8, 8).getTime());
      expect(result.indexOf('2004') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0065 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0066
     * @tc.name      testPhotosDateLocalized0066
     * @tc.desc      Formats localized year and month 2005.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0066 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(2005, 5, 15, 8, 8, 8).getTime());
      expect(result.indexOf('2005') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0066 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0067
     * @tc.name      testPhotosDateLocalized0067
     * @tc.desc      Formats localized year and month 2006.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0067 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(2006, 6, 15, 8, 8, 8).getTime());
      expect(result.indexOf('2006') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0067 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0068
     * @tc.name      testPhotosDateLocalized0068
     * @tc.desc      Formats localized year and month 2007.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0068 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(2007, 7, 15, 8, 8, 8).getTime());
      expect(result.indexOf('2007') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0068 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0069
     * @tc.name      testPhotosDateLocalized0069
     * @tc.desc      Formats localized year and month 2008.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0069 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(2008, 8, 15, 8, 8, 8).getTime());
      expect(result.indexOf('2008') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0069 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0070
     * @tc.name      testPhotosDateLocalized0070
     * @tc.desc      Formats localized year and month 2009.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0070 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(2009, 9, 15, 8, 8, 8).getTime());
      expect(result.indexOf('2009') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0070 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0071
     * @tc.name      testPhotosDateLocalized0071
     * @tc.desc      Formats localized year and month 2010.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0071 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(2010, 10, 15, 8, 8, 8).getTime());
      expect(result.indexOf('2010') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0071 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0072
     * @tc.name      testPhotosDateLocalized0072
     * @tc.desc      Formats localized year and month 2011.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0072 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(2011, 11, 15, 8, 8, 8).getTime());
      expect(result.indexOf('2011') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0072 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0073
     * @tc.name      testPhotosDateLocalized0073
     * @tc.desc      Formats localized year and month 2012.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0073 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(2012, 0, 15, 8, 8, 8).getTime());
      expect(result.indexOf('2012') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0073 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0074
     * @tc.name      testPhotosDateLocalized0074
     * @tc.desc      Formats localized year and month 2013.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0074 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(2013, 1, 15, 8, 8, 8).getTime());
      expect(result.indexOf('2013') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0074 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0075
     * @tc.name      testPhotosDateLocalized0075
     * @tc.desc      Formats localized year and month 2014.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0075 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(2014, 2, 15, 8, 8, 8).getTime());
      expect(result.indexOf('2014') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0075 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0076
     * @tc.name      testPhotosDateLocalized0076
     * @tc.desc      Formats localized year and month 2015.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0076 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(2015, 3, 15, 8, 8, 8).getTime());
      expect(result.indexOf('2015') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0076 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0077
     * @tc.name      testPhotosDateLocalized0077
     * @tc.desc      Formats localized year and month 2016.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0077 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(2016, 4, 15, 8, 8, 8).getTime());
      expect(result.indexOf('2016') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0077 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0078
     * @tc.name      testPhotosDateLocalized0078
     * @tc.desc      Formats localized year and month 2017.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0078 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(2017, 5, 15, 8, 8, 8).getTime());
      expect(result.indexOf('2017') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0078 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0079
     * @tc.name      testPhotosDateLocalized0079
     * @tc.desc      Formats localized year and month 2018.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0079 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(2018, 6, 15, 8, 8, 8).getTime());
      expect(result.indexOf('2018') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0079 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0080
     * @tc.name      testPhotosDateLocalized0080
     * @tc.desc      Formats localized year and month 2019.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0080 begin');
      const result: string = DateUtil.getLocalizedYearAndMonth(new Date(2019, 7, 15, 8, 8, 8).getTime());
      expect(result.indexOf('2019') >= 0).assertTrue();
      expect(result.length > 4).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0080 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0081
     * @tc.name      testPhotosDateLocalized0081
     * @tc.desc      Formats localized time sample 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0081 begin');
      const result: string = DateUtil.getLocalizedTime(new Date(2024, 0, 1, 0, 0, 0).getTime());
      expect(result.length >= 4).assertTrue();
      expect(result.indexOf(':') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0081 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0082
     * @tc.name      testPhotosDateLocalized0082
     * @tc.desc      Formats localized time sample 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0082 begin');
      const result: string = DateUtil.getLocalizedTime(new Date(2024, 0, 2, 1, 6, 0).getTime());
      expect(result.length >= 4).assertTrue();
      expect(result.indexOf(':') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0082 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0083
     * @tc.name      testPhotosDateLocalized0083
     * @tc.desc      Formats localized time sample 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0083 begin');
      const result: string = DateUtil.getLocalizedTime(new Date(2024, 0, 3, 2, 12, 0).getTime());
      expect(result.length >= 4).assertTrue();
      expect(result.indexOf(':') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0083 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0084
     * @tc.name      testPhotosDateLocalized0084
     * @tc.desc      Formats localized time sample 4.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0084 begin');
      const result: string = DateUtil.getLocalizedTime(new Date(2024, 0, 4, 3, 18, 0).getTime());
      expect(result.length >= 4).assertTrue();
      expect(result.indexOf(':') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0084 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0085
     * @tc.name      testPhotosDateLocalized0085
     * @tc.desc      Formats localized time sample 5.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0085 begin');
      const result: string = DateUtil.getLocalizedTime(new Date(2024, 0, 5, 4, 24, 0).getTime());
      expect(result.length >= 4).assertTrue();
      expect(result.indexOf(':') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0085 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0086
     * @tc.name      testPhotosDateLocalized0086
     * @tc.desc      Formats localized time sample 6.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0086 begin');
      const result: string = DateUtil.getLocalizedTime(new Date(2024, 0, 6, 5, 30, 0).getTime());
      expect(result.length >= 4).assertTrue();
      expect(result.indexOf(':') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0086 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0087
     * @tc.name      testPhotosDateLocalized0087
     * @tc.desc      Formats localized time sample 7.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0087 begin');
      const result: string = DateUtil.getLocalizedTime(new Date(2024, 0, 7, 6, 36, 0).getTime());
      expect(result.length >= 4).assertTrue();
      expect(result.indexOf(':') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0087 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0088
     * @tc.name      testPhotosDateLocalized0088
     * @tc.desc      Formats localized time sample 8.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0088 begin');
      const result: string = DateUtil.getLocalizedTime(new Date(2024, 0, 8, 7, 42, 0).getTime());
      expect(result.length >= 4).assertTrue();
      expect(result.indexOf(':') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0088 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0089
     * @tc.name      testPhotosDateLocalized0089
     * @tc.desc      Formats localized time sample 9.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0089 begin');
      const result: string = DateUtil.getLocalizedTime(new Date(2024, 0, 9, 8, 48, 0).getTime());
      expect(result.length >= 4).assertTrue();
      expect(result.indexOf(':') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0089 end');
    })

    /**
     * @tc.number    SUB_SYS_PHOTOS_LOGIC_LOCALIZED_0090
     * @tc.name      testPhotosDateLocalized0090
     * @tc.desc      Formats localized time sample 10.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPhotosDateLocalized0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0090 begin');
      const result: string = DateUtil.getLocalizedTime(new Date(2024, 0, 10, 9, 54, 0).getTime());
      expect(result.length >= 4).assertTrue();
      expect(result.indexOf(':') >= 0).assertTrue();
      expect(result === '').assertFalse();
      HiLog.info(DOMAIN, TAG, '%{public}s', 'testPhotosDateLocalized0090 end');
    })
  })
}
