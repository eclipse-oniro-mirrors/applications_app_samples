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

export default function dateBoundaryExpandedTest() {
  describe('dateBoundaryExpandedTest', () => {
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0001
     * @tc.name      testExpDateB0001
     * @tc.desc      January 1 of year 1970 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(1970, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(1970);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0002
     * @tc.name      testExpDateB0002
     * @tc.desc      January 1 of year 1971 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(1971, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(1971);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0003
     * @tc.name      testExpDateB0003
     * @tc.desc      January 1 of year 1972 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(1972, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(1972);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0004
     * @tc.name      testExpDateB0004
     * @tc.desc      January 1 of year 1973 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(1973, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(1973);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0005
     * @tc.name      testExpDateB0005
     * @tc.desc      January 1 of year 1974 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(1974, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(1974);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0006
     * @tc.name      testExpDateB0006
     * @tc.desc      January 1 of year 1975 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(1975, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(1975);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0007
     * @tc.name      testExpDateB0007
     * @tc.desc      January 1 of year 1976 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(1976, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(1976);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0008
     * @tc.name      testExpDateB0008
     * @tc.desc      January 1 of year 1977 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(1977, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(1977);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0009
     * @tc.name      testExpDateB0009
     * @tc.desc      January 1 of year 1978 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(1978, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(1978);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0010
     * @tc.name      testExpDateB0010
     * @tc.desc      January 1 of year 1979 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(1979, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(1979);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0011
     * @tc.name      testExpDateB0011
     * @tc.desc      January 1 of year 1980 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(1980, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(1980);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0012
     * @tc.name      testExpDateB0012
     * @tc.desc      January 1 of year 1981 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(1981, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(1981);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0013
     * @tc.name      testExpDateB0013
     * @tc.desc      January 1 of year 1982 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(1982, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(1982);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0014
     * @tc.name      testExpDateB0014
     * @tc.desc      January 1 of year 1983 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(1983, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(1983);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0015
     * @tc.name      testExpDateB0015
     * @tc.desc      January 1 of year 1984 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(1984, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(1984);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0016
     * @tc.name      testExpDateB0016
     * @tc.desc      January 1 of year 1985 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(1985, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(1985);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0017
     * @tc.name      testExpDateB0017
     * @tc.desc      January 1 of year 1986 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(1986, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(1986);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0018
     * @tc.name      testExpDateB0018
     * @tc.desc      January 1 of year 1987 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(1987, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(1987);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0019
     * @tc.name      testExpDateB0019
     * @tc.desc      January 1 of year 1988 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(1988, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(1988);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0020
     * @tc.name      testExpDateB0020
     * @tc.desc      January 1 of year 1989 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(1989, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(1989);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0021
     * @tc.name      testExpDateB0021
     * @tc.desc      January 1 of year 1990 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(1990, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(1990);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0022
     * @tc.name      testExpDateB0022
     * @tc.desc      January 1 of year 1991 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(1991, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(1991);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0023
     * @tc.name      testExpDateB0023
     * @tc.desc      January 1 of year 1992 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(1992, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(1992);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0024
     * @tc.name      testExpDateB0024
     * @tc.desc      January 1 of year 1993 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(1993, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(1993);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0025
     * @tc.name      testExpDateB0025
     * @tc.desc      January 1 of year 1994 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(1994, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(1994);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0026
     * @tc.name      testExpDateB0026
     * @tc.desc      January 1 of year 1995 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(1995, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(1995);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0027
     * @tc.name      testExpDateB0027
     * @tc.desc      January 1 of year 1996 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(1996, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(1996);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0028
     * @tc.name      testExpDateB0028
     * @tc.desc      January 1 of year 1997 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(1997, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(1997);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0029
     * @tc.name      testExpDateB0029
     * @tc.desc      January 1 of year 1998 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(1998, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(1998);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0030
     * @tc.name      testExpDateB0030
     * @tc.desc      January 1 of year 1999 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(1999, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(1999);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0031
     * @tc.name      testExpDateB0031
     * @tc.desc      January 1 of year 2000 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2000, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2000);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0032
     * @tc.name      testExpDateB0032
     * @tc.desc      January 1 of year 2001 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2001, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2001);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0033
     * @tc.name      testExpDateB0033
     * @tc.desc      January 1 of year 2002 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2002, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2002);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0034
     * @tc.name      testExpDateB0034
     * @tc.desc      January 1 of year 2003 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2003, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2003);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0035
     * @tc.name      testExpDateB0035
     * @tc.desc      January 1 of year 2004 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2004, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2004);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0036
     * @tc.name      testExpDateB0036
     * @tc.desc      January 1 of year 2005 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2005, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2005);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0037
     * @tc.name      testExpDateB0037
     * @tc.desc      January 1 of year 2006 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2006, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2006);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0038
     * @tc.name      testExpDateB0038
     * @tc.desc      January 1 of year 2007 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2007, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2007);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0039
     * @tc.name      testExpDateB0039
     * @tc.desc      January 1 of year 2008 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2008, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2008);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0040
     * @tc.name      testExpDateB0040
     * @tc.desc      January 1 of year 2009 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2009, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2009);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0041
     * @tc.name      testExpDateB0041
     * @tc.desc      January 1 of year 2010 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2010, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2010);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0042
     * @tc.name      testExpDateB0042
     * @tc.desc      January 1 of year 2011 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2011, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2011);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0043
     * @tc.name      testExpDateB0043
     * @tc.desc      January 1 of year 2012 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2012, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2012);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0044
     * @tc.name      testExpDateB0044
     * @tc.desc      January 1 of year 2013 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2013, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2013);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0045
     * @tc.name      testExpDateB0045
     * @tc.desc      January 1 of year 2014 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2014, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2014);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0046
     * @tc.name      testExpDateB0046
     * @tc.desc      January 1 of year 2015 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2015, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2015);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0047
     * @tc.name      testExpDateB0047
     * @tc.desc      January 1 of year 2016 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2016, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2016);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0048
     * @tc.name      testExpDateB0048
     * @tc.desc      January 1 of year 2017 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2017, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2017);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0049
     * @tc.name      testExpDateB0049
     * @tc.desc      January 1 of year 2018 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2018, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2018);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0050
     * @tc.name      testExpDateB0050
     * @tc.desc      January 1 of year 2019 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2019, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2019);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0051
     * @tc.name      testExpDateB0051
     * @tc.desc      January 1 of year 2020 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2020, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2020);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0052
     * @tc.name      testExpDateB0052
     * @tc.desc      January 1 of year 2021 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2021, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2021);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0053
     * @tc.name      testExpDateB0053
     * @tc.desc      January 1 of year 2022 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2022, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2022);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0054
     * @tc.name      testExpDateB0054
     * @tc.desc      January 1 of year 2023 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2023, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2023);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0055
     * @tc.name      testExpDateB0055
     * @tc.desc      January 1 of year 2024 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2024, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2024);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0056
     * @tc.name      testExpDateB0056
     * @tc.desc      January 1 of year 2025 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2025, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2025);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0057
     * @tc.name      testExpDateB0057
     * @tc.desc      January 1 of year 2026 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2026, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2026);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0058
     * @tc.name      testExpDateB0058
     * @tc.desc      January 1 of year 2027 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2027, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2027);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0059
     * @tc.name      testExpDateB0059
     * @tc.desc      January 1 of year 2028 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2028, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2028);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0060
     * @tc.name      testExpDateB0060
     * @tc.desc      January 1 of year 2029 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2029, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2029);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0061
     * @tc.name      testExpDateB0061
     * @tc.desc      January 1 of year 2030 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2030, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2030);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0062
     * @tc.name      testExpDateB0062
     * @tc.desc      January 1 of year 2031 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2031, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2031);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0063
     * @tc.name      testExpDateB0063
     * @tc.desc      January 1 of year 2032 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2032, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2032);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0064
     * @tc.name      testExpDateB0064
     * @tc.desc      January 1 of year 2033 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2033, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2033);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0065
     * @tc.name      testExpDateB0065
     * @tc.desc      January 1 of year 2034 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2034, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2034);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0066
     * @tc.name      testExpDateB0066
     * @tc.desc      January 1 of year 2035 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2035, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2035);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0067
     * @tc.name      testExpDateB0067
     * @tc.desc      January 1 of year 2036 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2036, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2036);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0068
     * @tc.name      testExpDateB0068
     * @tc.desc      January 1 of year 2037 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2037, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2037);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0069
     * @tc.name      testExpDateB0069
     * @tc.desc      January 1 of year 2038 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2038, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2038);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0070
     * @tc.name      testExpDateB0070
     * @tc.desc      January 1 of year 2039 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2039, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2039);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0071
     * @tc.name      testExpDateB0071
     * @tc.desc      January 1 of year 2040 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2040, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2040);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0072
     * @tc.name      testExpDateB0072
     * @tc.desc      January 1 of year 2041 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2041, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2041);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0073
     * @tc.name      testExpDateB0073
     * @tc.desc      January 1 of year 2042 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2042, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2042);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0074
     * @tc.name      testExpDateB0074
     * @tc.desc      January 1 of year 2043 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2043, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2043);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0075
     * @tc.name      testExpDateB0075
     * @tc.desc      January 1 of year 2044 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2044, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2044);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0076
     * @tc.name      testExpDateB0076
     * @tc.desc      January 1 of year 2045 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2045, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2045);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0077
     * @tc.name      testExpDateB0077
     * @tc.desc      January 1 of year 2046 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2046, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2046);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0078
     * @tc.name      testExpDateB0078
     * @tc.desc      January 1 of year 2047 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2047, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2047);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0079
     * @tc.name      testExpDateB0079
     * @tc.desc      January 1 of year 2048 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2048, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2048);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0080
     * @tc.name      testExpDateB0080
     * @tc.desc      January 1 of year 2049 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2049, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2049);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0081
     * @tc.name      testExpDateB0081
     * @tc.desc      January 1 of year 2050 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2050, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2050);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0082
     * @tc.name      testExpDateB0082
     * @tc.desc      January 1 of year 2051 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2051, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2051);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0083
     * @tc.name      testExpDateB0083
     * @tc.desc      January 1 of year 2052 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2052, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2052);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0084
     * @tc.name      testExpDateB0084
     * @tc.desc      January 1 of year 2053 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2053, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2053);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0085
     * @tc.name      testExpDateB0085
     * @tc.desc      January 1 of year 2054 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2054, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2054);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0086
     * @tc.name      testExpDateB0086
     * @tc.desc      January 1 of year 2055 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2055, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2055);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0087
     * @tc.name      testExpDateB0087
     * @tc.desc      January 1 of year 2056 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2056, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2056);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0088
     * @tc.name      testExpDateB0088
     * @tc.desc      January 1 of year 2057 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2057, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2057);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0089
     * @tc.name      testExpDateB0089
     * @tc.desc      January 1 of year 2058 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2058, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2058);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0090
     * @tc.name      testExpDateB0090
     * @tc.desc      January 1 of year 2059 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2059, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2059);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0091
     * @tc.name      testExpDateB0091
     * @tc.desc      January 1 of year 2060 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2060, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2060);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0092
     * @tc.name      testExpDateB0092
     * @tc.desc      January 1 of year 2061 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2061, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2061);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0093
     * @tc.name      testExpDateB0093
     * @tc.desc      January 1 of year 2062 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2062, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2062);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0094
     * @tc.name      testExpDateB0094
     * @tc.desc      January 1 of year 2063 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2063, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2063);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0095
     * @tc.name      testExpDateB0095
     * @tc.desc      January 1 of year 2064 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2064, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2064);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0096
     * @tc.name      testExpDateB0096
     * @tc.desc      January 1 of year 2065 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2065, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2065);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0097
     * @tc.name      testExpDateB0097
     * @tc.desc      January 1 of year 2066 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2066, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2066);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0098
     * @tc.name      testExpDateB0098
     * @tc.desc      January 1 of year 2067 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2067, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2067);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0099
     * @tc.name      testExpDateB0099
     * @tc.desc      January 1 of year 2068 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2068, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2068);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
    /**
     * @tc.number    SUB_AVS_EXP_DATEB_0100
     * @tc.name      testExpDateB0100
     * @tc.desc      January 1 of year 2069 normalizes to the expected UTC fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpDateB0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const value: Date = new Date(Date.UTC(2069, 0, 1));
      expect(value.getUTCFullYear()).assertEqual(2069);
      expect(value.getUTCMonth()).assertEqual(0);
      expect(value.getUTCDate()).assertEqual(1);
      expect(Number.isFinite(value.getTime())).assertTrue();
    })
  })
}
