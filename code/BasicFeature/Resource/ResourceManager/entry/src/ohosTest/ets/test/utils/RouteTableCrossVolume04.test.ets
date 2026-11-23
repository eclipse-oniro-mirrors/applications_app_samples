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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { RouteTable } from '../../../../main/ets/utils/RouteTable';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_ResourceManager]';

export default function routeTableCrossTest() {
  describe('RouteTableCrossTest', () => {

    /**
     * @tc.name   testRouteTableCross0001
     * @tc.number SUB_RESMGR_ROUTE04_0001
     * @tc.desc   pageIndexOf('pages/Index') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0001 begin');
      const known: boolean = RouteTable.isKnownPage('pages/Index');
      const resolved: string = RouteTable.resolvePage('pages/Index');
      const result: string = String(RouteTable.pageIndexOf('pages/Index'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(result).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('true'));
      expect(String(known)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0001 end');
    })

    /**
     * @tc.name   testRouteTableCross0002
     * @tc.number SUB_RESMGR_ROUTE04_0002
     * @tc.desc   isKnownPage('pages/Index') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0002 begin');
      const known: boolean = RouteTable.isKnownPage('pages/Index');
      const resolved: string = RouteTable.resolvePage('pages/Index');
      const result: string = String(RouteTable.isKnownPage('pages/Index'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('true'));
      expect(String(known)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0002 end');
    })

    /**
     * @tc.name   testRouteTableCross0003
     * @tc.number SUB_RESMGR_ROUTE04_0003
     * @tc.desc   isPageUrl('pages/Index') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0003 begin');
      const known: boolean = RouteTable.isKnownPage('pages/Index');
      const resolved: string = RouteTable.resolvePage('pages/Index');
      const result: string = String(RouteTable.isPageUrl('pages/Index'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('true'));
      expect(String(known)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0003 end');
    })

    /**
     * @tc.name   testRouteTableCross0004
     * @tc.number SUB_RESMGR_ROUTE04_0004
     * @tc.desc   pageIndexOf('pages/BasicResources') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0004 begin');
      const known: boolean = RouteTable.isKnownPage('pages/BasicResources');
      const resolved: string = RouteTable.resolvePage('pages/BasicResources');
      const result: string = String(RouteTable.pageIndexOf('pages/BasicResources'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(result).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('true'));
      expect(String(known)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(resolved), String('pages/BasicResources'));
      expect(resolved).assertEqual('pages/BasicResources');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0004 end');
    })

    /**
     * @tc.name   testRouteTableCross0005
     * @tc.number SUB_RESMGR_ROUTE04_0005
     * @tc.desc   isKnownPage('pages/BasicResources') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0005 begin');
      const known: boolean = RouteTable.isKnownPage('pages/BasicResources');
      const resolved: string = RouteTable.resolvePage('pages/BasicResources');
      const result: string = String(RouteTable.isKnownPage('pages/BasicResources'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('true'));
      expect(String(known)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(resolved), String('pages/BasicResources'));
      expect(resolved).assertEqual('pages/BasicResources');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0005 end');
    })

    /**
     * @tc.name   testRouteTableCross0006
     * @tc.number SUB_RESMGR_ROUTE04_0006
     * @tc.desc   isPageUrl('pages/BasicResources') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0006 begin');
      const known: boolean = RouteTable.isKnownPage('pages/BasicResources');
      const resolved: string = RouteTable.resolvePage('pages/BasicResources');
      const result: string = String(RouteTable.isPageUrl('pages/BasicResources'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('true'));
      expect(String(known)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(resolved), String('pages/BasicResources'));
      expect(resolved).assertEqual('pages/BasicResources');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0006 end');
    })

    /**
     * @tc.name   testRouteTableCross0007
     * @tc.number SUB_RESMGR_ROUTE04_0007
     * @tc.desc   pageIndexOf('pages/Overlay') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0007 begin');
      const known: boolean = RouteTable.isKnownPage('pages/Overlay');
      const resolved: string = RouteTable.resolvePage('pages/Overlay');
      const result: string = String(RouteTable.pageIndexOf('pages/Overlay'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2'));
      expect(result).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('true'));
      expect(String(known)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(resolved), String('pages/Overlay'));
      expect(resolved).assertEqual('pages/Overlay');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0007 end');
    })

    /**
     * @tc.name   testRouteTableCross0008
     * @tc.number SUB_RESMGR_ROUTE04_0008
     * @tc.desc   isKnownPage('pages/Overlay') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0008 begin');
      const known: boolean = RouteTable.isKnownPage('pages/Overlay');
      const resolved: string = RouteTable.resolvePage('pages/Overlay');
      const result: string = String(RouteTable.isKnownPage('pages/Overlay'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('true'));
      expect(String(known)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(resolved), String('pages/Overlay'));
      expect(resolved).assertEqual('pages/Overlay');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0008 end');
    })

    /**
     * @tc.name   testRouteTableCross0009
     * @tc.number SUB_RESMGR_ROUTE04_0009
     * @tc.desc   isPageUrl('pages/Overlay') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0009 begin');
      const known: boolean = RouteTable.isKnownPage('pages/Overlay');
      const resolved: string = RouteTable.resolvePage('pages/Overlay');
      const result: string = String(RouteTable.isPageUrl('pages/Overlay'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('true'));
      expect(String(known)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(resolved), String('pages/Overlay'));
      expect(resolved).assertEqual('pages/Overlay');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0009 end');
    })

    /**
     * @tc.name   testRouteTableCross0010
     * @tc.number SUB_RESMGR_ROUTE04_0010
     * @tc.desc   pageIndexOf('pages/Unknown') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0010 begin');
      const known: boolean = RouteTable.isKnownPage('pages/Unknown');
      const resolved: string = RouteTable.resolvePage('pages/Unknown');
      const result: string = String(RouteTable.pageIndexOf('pages/Unknown'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-1'));
      expect(result).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0010 end');
    })

    /**
     * @tc.name   testRouteTableCross0011
     * @tc.number SUB_RESMGR_ROUTE04_0011
     * @tc.desc   isKnownPage('pages/Unknown') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0011 begin');
      const known: boolean = RouteTable.isKnownPage('pages/Unknown');
      const resolved: string = RouteTable.resolvePage('pages/Unknown');
      const result: string = String(RouteTable.isKnownPage('pages/Unknown'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0011 end');
    })

    /**
     * @tc.name   testRouteTableCross0012
     * @tc.number SUB_RESMGR_ROUTE04_0012
     * @tc.desc   isPageUrl('pages/Unknown') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0012 begin');
      const known: boolean = RouteTable.isKnownPage('pages/Unknown');
      const resolved: string = RouteTable.resolvePage('pages/Unknown');
      const result: string = String(RouteTable.isPageUrl('pages/Unknown'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0012 end');
    })

    /**
     * @tc.name   testRouteTableCross0013
     * @tc.number SUB_RESMGR_ROUTE04_0013
     * @tc.desc   pageIndexOf('') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0013 begin');
      const known: boolean = RouteTable.isKnownPage('');
      const resolved: string = RouteTable.resolvePage('');
      const result: string = String(RouteTable.pageIndexOf(''));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-1'));
      expect(result).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0013 end');
    })

    /**
     * @tc.name   testRouteTableCross0014
     * @tc.number SUB_RESMGR_ROUTE04_0014
     * @tc.desc   isKnownPage('') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0014 begin');
      const known: boolean = RouteTable.isKnownPage('');
      const resolved: string = RouteTable.resolvePage('');
      const result: string = String(RouteTable.isKnownPage(''));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0014 end');
    })

    /**
     * @tc.name   testRouteTableCross0015
     * @tc.number SUB_RESMGR_ROUTE04_0015
     * @tc.desc   isPageUrl('') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0015 begin');
      const known: boolean = RouteTable.isKnownPage('');
      const resolved: string = RouteTable.resolvePage('');
      const result: string = String(RouteTable.isPageUrl(''));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0015 end');
    })

    /**
     * @tc.name   testRouteTableCross0016
     * @tc.number SUB_RESMGR_ROUTE04_0016
     * @tc.desc   pageIndexOf(' ') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0016 begin');
      const known: boolean = RouteTable.isKnownPage(' ');
      const resolved: string = RouteTable.resolvePage(' ');
      const result: string = String(RouteTable.pageIndexOf(' '));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-1'));
      expect(result).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0016 end');
    })

    /**
     * @tc.name   testRouteTableCross0017
     * @tc.number SUB_RESMGR_ROUTE04_0017
     * @tc.desc   isKnownPage(' ') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0017 begin');
      const known: boolean = RouteTable.isKnownPage(' ');
      const resolved: string = RouteTable.resolvePage(' ');
      const result: string = String(RouteTable.isKnownPage(' '));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0017 end');
    })

    /**
     * @tc.name   testRouteTableCross0018
     * @tc.number SUB_RESMGR_ROUTE04_0018
     * @tc.desc   isPageUrl(' ') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0018 begin');
      const known: boolean = RouteTable.isKnownPage(' ');
      const resolved: string = RouteTable.resolvePage(' ');
      const result: string = String(RouteTable.isPageUrl(' '));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0018 end');
    })

    /**
     * @tc.name   testRouteTableCross0019
     * @tc.number SUB_RESMGR_ROUTE04_0019
     * @tc.desc   pageIndexOf('Pages/Index') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0019 begin');
      const known: boolean = RouteTable.isKnownPage('Pages/Index');
      const resolved: string = RouteTable.resolvePage('Pages/Index');
      const result: string = String(RouteTable.pageIndexOf('Pages/Index'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-1'));
      expect(result).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0019 end');
    })

    /**
     * @tc.name   testRouteTableCross0020
     * @tc.number SUB_RESMGR_ROUTE04_0020
     * @tc.desc   isKnownPage('Pages/Index') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0020 begin');
      const known: boolean = RouteTable.isKnownPage('Pages/Index');
      const resolved: string = RouteTable.resolvePage('Pages/Index');
      const result: string = String(RouteTable.isKnownPage('Pages/Index'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0020 end');
    })

    /**
     * @tc.name   testRouteTableCross0021
     * @tc.number SUB_RESMGR_ROUTE04_0021
     * @tc.desc   isPageUrl('Pages/Index') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0021 begin');
      const known: boolean = RouteTable.isKnownPage('Pages/Index');
      const resolved: string = RouteTable.resolvePage('Pages/Index');
      const result: string = String(RouteTable.isPageUrl('Pages/Index'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0021 end');
    })

    /**
     * @tc.name   testRouteTableCross0022
     * @tc.number SUB_RESMGR_ROUTE04_0022
     * @tc.desc   pageIndexOf('PAGES/Overlay') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0022 begin');
      const known: boolean = RouteTable.isKnownPage('PAGES/Overlay');
      const resolved: string = RouteTable.resolvePage('PAGES/Overlay');
      const result: string = String(RouteTable.pageIndexOf('PAGES/Overlay'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-1'));
      expect(result).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0022 end');
    })

    /**
     * @tc.name   testRouteTableCross0023
     * @tc.number SUB_RESMGR_ROUTE04_0023
     * @tc.desc   isKnownPage('PAGES/Overlay') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0023 begin');
      const known: boolean = RouteTable.isKnownPage('PAGES/Overlay');
      const resolved: string = RouteTable.resolvePage('PAGES/Overlay');
      const result: string = String(RouteTable.isKnownPage('PAGES/Overlay'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0023 end');
    })

    /**
     * @tc.name   testRouteTableCross0024
     * @tc.number SUB_RESMGR_ROUTE04_0024
     * @tc.desc   isPageUrl('PAGES/Overlay') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0024 begin');
      const known: boolean = RouteTable.isKnownPage('PAGES/Overlay');
      const resolved: string = RouteTable.resolvePage('PAGES/Overlay');
      const result: string = String(RouteTable.isPageUrl('PAGES/Overlay'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0024 end');
    })

    /**
     * @tc.name   testRouteTableCross0025
     * @tc.number SUB_RESMGR_ROUTE04_0025
     * @tc.desc   pageIndexOf('/pages/Index') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0025 begin');
      const known: boolean = RouteTable.isKnownPage('/pages/Index');
      const resolved: string = RouteTable.resolvePage('/pages/Index');
      const result: string = String(RouteTable.pageIndexOf('/pages/Index'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-1'));
      expect(result).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0025 end');
    })

    /**
     * @tc.name   testRouteTableCross0026
     * @tc.number SUB_RESMGR_ROUTE04_0026
     * @tc.desc   isKnownPage('/pages/Index') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0026 begin');
      const known: boolean = RouteTable.isKnownPage('/pages/Index');
      const resolved: string = RouteTable.resolvePage('/pages/Index');
      const result: string = String(RouteTable.isKnownPage('/pages/Index'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0026 end');
    })

    /**
     * @tc.name   testRouteTableCross0027
     * @tc.number SUB_RESMGR_ROUTE04_0027
     * @tc.desc   isPageUrl('/pages/Index') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0027 begin');
      const known: boolean = RouteTable.isKnownPage('/pages/Index');
      const resolved: string = RouteTable.resolvePage('/pages/Index');
      const result: string = String(RouteTable.isPageUrl('/pages/Index'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0027 end');
    })

    /**
     * @tc.name   testRouteTableCross0028
     * @tc.number SUB_RESMGR_ROUTE04_0028
     * @tc.desc   pageIndexOf('/pages/Overlay') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0028 begin');
      const known: boolean = RouteTable.isKnownPage('/pages/Overlay');
      const resolved: string = RouteTable.resolvePage('/pages/Overlay');
      const result: string = String(RouteTable.pageIndexOf('/pages/Overlay'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-1'));
      expect(result).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0028 end');
    })

    /**
     * @tc.name   testRouteTableCross0029
     * @tc.number SUB_RESMGR_ROUTE04_0029
     * @tc.desc   isKnownPage('/pages/Overlay') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0029 begin');
      const known: boolean = RouteTable.isKnownPage('/pages/Overlay');
      const resolved: string = RouteTable.resolvePage('/pages/Overlay');
      const result: string = String(RouteTable.isKnownPage('/pages/Overlay'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0029 end');
    })

    /**
     * @tc.name   testRouteTableCross0030
     * @tc.number SUB_RESMGR_ROUTE04_0030
     * @tc.desc   isPageUrl('/pages/Overlay') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0030 begin');
      const known: boolean = RouteTable.isKnownPage('/pages/Overlay');
      const resolved: string = RouteTable.resolvePage('/pages/Overlay');
      const result: string = String(RouteTable.isPageUrl('/pages/Overlay'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0030 end');
    })

    /**
     * @tc.name   testRouteTableCross0031
     * @tc.number SUB_RESMGR_ROUTE04_0031
     * @tc.desc   pageIndexOf('pages/Index/') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0031 begin');
      const known: boolean = RouteTable.isKnownPage('pages/Index/');
      const resolved: string = RouteTable.resolvePage('pages/Index/');
      const result: string = String(RouteTable.pageIndexOf('pages/Index/'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-1'));
      expect(result).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0031 end');
    })

    /**
     * @tc.name   testRouteTableCross0032
     * @tc.number SUB_RESMGR_ROUTE04_0032
     * @tc.desc   isKnownPage('pages/Index/') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0032 begin');
      const known: boolean = RouteTable.isKnownPage('pages/Index/');
      const resolved: string = RouteTable.resolvePage('pages/Index/');
      const result: string = String(RouteTable.isKnownPage('pages/Index/'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0032 end');
    })

    /**
     * @tc.name   testRouteTableCross0033
     * @tc.number SUB_RESMGR_ROUTE04_0033
     * @tc.desc   isPageUrl('pages/Index/') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0033 begin');
      const known: boolean = RouteTable.isKnownPage('pages/Index/');
      const resolved: string = RouteTable.resolvePage('pages/Index/');
      const result: string = String(RouteTable.isPageUrl('pages/Index/'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0033 end');
    })

    /**
     * @tc.name   testRouteTableCross0034
     * @tc.number SUB_RESMGR_ROUTE04_0034
     * @tc.desc   pageIndexOf('pages/Overlay/') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0034 begin');
      const known: boolean = RouteTable.isKnownPage('pages/Overlay/');
      const resolved: string = RouteTable.resolvePage('pages/Overlay/');
      const result: string = String(RouteTable.pageIndexOf('pages/Overlay/'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-1'));
      expect(result).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0034 end');
    })

    /**
     * @tc.name   testRouteTableCross0035
     * @tc.number SUB_RESMGR_ROUTE04_0035
     * @tc.desc   isKnownPage('pages/Overlay/') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0035 begin');
      const known: boolean = RouteTable.isKnownPage('pages/Overlay/');
      const resolved: string = RouteTable.resolvePage('pages/Overlay/');
      const result: string = String(RouteTable.isKnownPage('pages/Overlay/'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0035 end');
    })

    /**
     * @tc.name   testRouteTableCross0036
     * @tc.number SUB_RESMGR_ROUTE04_0036
     * @tc.desc   isPageUrl('pages/Overlay/') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0036 begin');
      const known: boolean = RouteTable.isKnownPage('pages/Overlay/');
      const resolved: string = RouteTable.resolvePage('pages/Overlay/');
      const result: string = String(RouteTable.isPageUrl('pages/Overlay/'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0036 end');
    })

    /**
     * @tc.name   testRouteTableCross0037
     * @tc.number SUB_RESMGR_ROUTE04_0037
     * @tc.desc   pageIndexOf('pages//Index') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0037 begin');
      const known: boolean = RouteTable.isKnownPage('pages//Index');
      const resolved: string = RouteTable.resolvePage('pages//Index');
      const result: string = String(RouteTable.pageIndexOf('pages//Index'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-1'));
      expect(result).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0037 end');
    })

    /**
     * @tc.name   testRouteTableCross0038
     * @tc.number SUB_RESMGR_ROUTE04_0038
     * @tc.desc   isKnownPage('pages//Index') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0038 begin');
      const known: boolean = RouteTable.isKnownPage('pages//Index');
      const resolved: string = RouteTable.resolvePage('pages//Index');
      const result: string = String(RouteTable.isKnownPage('pages//Index'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0038 end');
    })

    /**
     * @tc.name   testRouteTableCross0039
     * @tc.number SUB_RESMGR_ROUTE04_0039
     * @tc.desc   isPageUrl('pages//Index') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0039 begin');
      const known: boolean = RouteTable.isKnownPage('pages//Index');
      const resolved: string = RouteTable.resolvePage('pages//Index');
      const result: string = String(RouteTable.isPageUrl('pages//Index'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0039 end');
    })

    /**
     * @tc.name   testRouteTableCross0040
     * @tc.number SUB_RESMGR_ROUTE04_0040
     * @tc.desc   pageIndexOf('pages//Overlay') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0040 begin');
      const known: boolean = RouteTable.isKnownPage('pages//Overlay');
      const resolved: string = RouteTable.resolvePage('pages//Overlay');
      const result: string = String(RouteTable.pageIndexOf('pages//Overlay'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-1'));
      expect(result).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0040 end');
    })

    /**
     * @tc.name   testRouteTableCross0041
     * @tc.number SUB_RESMGR_ROUTE04_0041
     * @tc.desc   isKnownPage('pages//Overlay') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0041 begin');
      const known: boolean = RouteTable.isKnownPage('pages//Overlay');
      const resolved: string = RouteTable.resolvePage('pages//Overlay');
      const result: string = String(RouteTable.isKnownPage('pages//Overlay'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0041 end');
    })

    /**
     * @tc.name   testRouteTableCross0042
     * @tc.number SUB_RESMGR_ROUTE04_0042
     * @tc.desc   isPageUrl('pages//Overlay') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0042 begin');
      const known: boolean = RouteTable.isKnownPage('pages//Overlay');
      const resolved: string = RouteTable.resolvePage('pages//Overlay');
      const result: string = String(RouteTable.isPageUrl('pages//Overlay'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0042 end');
    })

    /**
     * @tc.name   testRouteTableCross0043
     * @tc.number SUB_RESMGR_ROUTE04_0043
     * @tc.desc   pageIndexOf('pages/Index?x=1') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0043 begin');
      const known: boolean = RouteTable.isKnownPage('pages/Index?x=1');
      const resolved: string = RouteTable.resolvePage('pages/Index?x=1');
      const result: string = String(RouteTable.pageIndexOf('pages/Index?x=1'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-1'));
      expect(result).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0043 end');
    })

    /**
     * @tc.name   testRouteTableCross0044
     * @tc.number SUB_RESMGR_ROUTE04_0044
     * @tc.desc   isKnownPage('pages/Index?x=1') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0044 begin');
      const known: boolean = RouteTable.isKnownPage('pages/Index?x=1');
      const resolved: string = RouteTable.resolvePage('pages/Index?x=1');
      const result: string = String(RouteTable.isKnownPage('pages/Index?x=1'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0044 end');
    })

    /**
     * @tc.name   testRouteTableCross0045
     * @tc.number SUB_RESMGR_ROUTE04_0045
     * @tc.desc   isPageUrl('pages/Index?x=1') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0045 begin');
      const known: boolean = RouteTable.isKnownPage('pages/Index?x=1');
      const resolved: string = RouteTable.resolvePage('pages/Index?x=1');
      const result: string = String(RouteTable.isPageUrl('pages/Index?x=1'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0045 end');
    })

    /**
     * @tc.name   testRouteTableCross0046
     * @tc.number SUB_RESMGR_ROUTE04_0046
     * @tc.desc   pageIndexOf('pages/BasicResources?density=320') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0046 begin');
      const known: boolean = RouteTable.isKnownPage('pages/BasicResources?density=320');
      const resolved: string = RouteTable.resolvePage('pages/BasicResources?density=320');
      const result: string = String(RouteTable.pageIndexOf('pages/BasicResources?density=320'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-1'));
      expect(result).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0046 end');
    })

    /**
     * @tc.name   testRouteTableCross0047
     * @tc.number SUB_RESMGR_ROUTE04_0047
     * @tc.desc   isKnownPage('pages/BasicResources?density=320') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0047 begin');
      const known: boolean = RouteTable.isKnownPage('pages/BasicResources?density=320');
      const resolved: string = RouteTable.resolvePage('pages/BasicResources?density=320');
      const result: string = String(RouteTable.isKnownPage('pages/BasicResources?density=320'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0047 end');
    })

    /**
     * @tc.name   testRouteTableCross0048
     * @tc.number SUB_RESMGR_ROUTE04_0048
     * @tc.desc   isPageUrl('pages/BasicResources?density=320') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0048 begin');
      const known: boolean = RouteTable.isKnownPage('pages/BasicResources?density=320');
      const resolved: string = RouteTable.resolvePage('pages/BasicResources?density=320');
      const result: string = String(RouteTable.isPageUrl('pages/BasicResources?density=320'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0048 end');
    })

    /**
     * @tc.name   testRouteTableCross0049
     * @tc.number SUB_RESMGR_ROUTE04_0049
     * @tc.desc   pageIndexOf('pages/Index/../Overlay') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0049 begin');
      const known: boolean = RouteTable.isKnownPage('pages/Index/../Overlay');
      const resolved: string = RouteTable.resolvePage('pages/Index/../Overlay');
      const result: string = String(RouteTable.pageIndexOf('pages/Index/../Overlay'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-1'));
      expect(result).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0049 end');
    })

    /**
     * @tc.name   testRouteTableCross0050
     * @tc.number SUB_RESMGR_ROUTE04_0050
     * @tc.desc   isKnownPage('pages/Index/../Overlay') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0050 begin');
      const known: boolean = RouteTable.isKnownPage('pages/Index/../Overlay');
      const resolved: string = RouteTable.resolvePage('pages/Index/../Overlay');
      const result: string = String(RouteTable.isKnownPage('pages/Index/../Overlay'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0050 end');
    })

    /**
     * @tc.name   testRouteTableCross0051
     * @tc.number SUB_RESMGR_ROUTE04_0051
     * @tc.desc   isPageUrl('pages/Index/../Overlay') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0051 begin');
      const known: boolean = RouteTable.isKnownPage('pages/Index/../Overlay');
      const resolved: string = RouteTable.resolvePage('pages/Index/../Overlay');
      const result: string = String(RouteTable.isPageUrl('pages/Index/../Overlay'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0051 end');
    })

    /**
     * @tc.name   testRouteTableCross0052
     * @tc.number SUB_RESMGR_ROUTE04_0052
     * @tc.desc   pageIndexOf('pages/.') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0052 begin');
      const known: boolean = RouteTable.isKnownPage('pages/.');
      const resolved: string = RouteTable.resolvePage('pages/.');
      const result: string = String(RouteTable.pageIndexOf('pages/.'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-1'));
      expect(result).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0052 end');
    })

    /**
     * @tc.name   testRouteTableCross0053
     * @tc.number SUB_RESMGR_ROUTE04_0053
     * @tc.desc   isKnownPage('pages/.') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0053 begin');
      const known: boolean = RouteTable.isKnownPage('pages/.');
      const resolved: string = RouteTable.resolvePage('pages/.');
      const result: string = String(RouteTable.isKnownPage('pages/.'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0053 end');
    })

    /**
     * @tc.name   testRouteTableCross0054
     * @tc.number SUB_RESMGR_ROUTE04_0054
     * @tc.desc   isPageUrl('pages/.') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0054 begin');
      const known: boolean = RouteTable.isKnownPage('pages/.');
      const resolved: string = RouteTable.resolvePage('pages/.');
      const result: string = String(RouteTable.isPageUrl('pages/.'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0054 end');
    })

    /**
     * @tc.name   testRouteTableCross0055
     * @tc.number SUB_RESMGR_ROUTE04_0055
     * @tc.desc   pageIndexOf('pages/..') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0055 begin');
      const known: boolean = RouteTable.isKnownPage('pages/..');
      const resolved: string = RouteTable.resolvePage('pages/..');
      const result: string = String(RouteTable.pageIndexOf('pages/..'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-1'));
      expect(result).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0055 end');
    })

    /**
     * @tc.name   testRouteTableCross0056
     * @tc.number SUB_RESMGR_ROUTE04_0056
     * @tc.desc   isKnownPage('pages/..') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0056 begin');
      const known: boolean = RouteTable.isKnownPage('pages/..');
      const resolved: string = RouteTable.resolvePage('pages/..');
      const result: string = String(RouteTable.isKnownPage('pages/..'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0056 end');
    })

    /**
     * @tc.name   testRouteTableCross0057
     * @tc.number SUB_RESMGR_ROUTE04_0057
     * @tc.desc   isPageUrl('pages/..') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0057 begin');
      const known: boolean = RouteTable.isKnownPage('pages/..');
      const resolved: string = RouteTable.resolvePage('pages/..');
      const result: string = String(RouteTable.isPageUrl('pages/..'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0057 end');
    })

    /**
     * @tc.name   testRouteTableCross0058
     * @tc.number SUB_RESMGR_ROUTE04_0058
     * @tc.desc   pageIndexOf('index') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0058 begin');
      const known: boolean = RouteTable.isKnownPage('index');
      const resolved: string = RouteTable.resolvePage('index');
      const result: string = String(RouteTable.pageIndexOf('index'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-1'));
      expect(result).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0058 end');
    })

    /**
     * @tc.name   testRouteTableCross0059
     * @tc.number SUB_RESMGR_ROUTE04_0059
     * @tc.desc   isKnownPage('index') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0059 begin');
      const known: boolean = RouteTable.isKnownPage('index');
      const resolved: string = RouteTable.resolvePage('index');
      const result: string = String(RouteTable.isKnownPage('index'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0059 end');
    })

    /**
     * @tc.name   testRouteTableCross0060
     * @tc.number SUB_RESMGR_ROUTE04_0060
     * @tc.desc   isPageUrl('index') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0060 begin');
      const known: boolean = RouteTable.isKnownPage('index');
      const resolved: string = RouteTable.resolvePage('index');
      const result: string = String(RouteTable.isPageUrl('index'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0060 end');
    })

    /**
     * @tc.name   testRouteTableCross0061
     * @tc.number SUB_RESMGR_ROUTE04_0061
     * @tc.desc   pageIndexOf('pages/Basicresources') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0061 begin');
      const known: boolean = RouteTable.isKnownPage('pages/Basicresources');
      const resolved: string = RouteTable.resolvePage('pages/Basicresources');
      const result: string = String(RouteTable.pageIndexOf('pages/Basicresources'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-1'));
      expect(result).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0061 end');
    })

    /**
     * @tc.name   testRouteTableCross0062
     * @tc.number SUB_RESMGR_ROUTE04_0062
     * @tc.desc   isKnownPage('pages/Basicresources') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0062 begin');
      const known: boolean = RouteTable.isKnownPage('pages/Basicresources');
      const resolved: string = RouteTable.resolvePage('pages/Basicresources');
      const result: string = String(RouteTable.isKnownPage('pages/Basicresources'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0062 end');
    })

    /**
     * @tc.name   testRouteTableCross0063
     * @tc.number SUB_RESMGR_ROUTE04_0063
     * @tc.desc   isPageUrl('pages/Basicresources') resolves against the declared page table
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0063 begin');
      const known: boolean = RouteTable.isKnownPage('pages/Basicresources');
      const resolved: string = RouteTable.resolvePage('pages/Basicresources');
      const result: string = String(RouteTable.isPageUrl('pages/Basicresources'));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(known)), String('false'));
      expect(String(known)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolved), String('pages/Index'));
      expect(resolved).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0063 end');
    })

    /**
     * @tc.name   testRouteTableCross0064
     * @tc.number SUB_RESMGR_ROUTE04_0064
     * @tc.desc   空串回退到首页后索引为 0，而空串自身的索引为 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRouteTableCross0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0064 begin');
      const resolvedEmpty: string = RouteTable.resolvePage('');
      const rawIndex: number = RouteTable.pageIndexOf('');
      const resolvedIndex: number = RouteTable.pageIndexOf(resolvedEmpty);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolvedEmpty),
        String('pages/Index'));
      expect(resolvedEmpty).assertEqual('pages/Index');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(rawIndex), String(-1));
      expect(rawIndex).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(resolvedIndex), String(0));
      expect(resolvedIndex).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl('')));
      expect(RouteTable.isPageUrl('')).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(RouteTable.isPageUrl(resolvedEmpty)));
      expect(RouteTable.isPageUrl(resolvedEmpty)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testRouteTableCross0064 end');
    })

  })
}
