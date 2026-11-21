/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { NavMode } from '../../../main/ets/utils/RouterUtils';

const DOMAIN: number = 0xF814;
const TAG: string = 'RouterNavModeCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function routerNavModeCoreTest(): void {
  describe('RouterNavModeCoreTest', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTERMODE_0001
     * @tc.name      testRouterMode0001
     * @tc.desc      Checks NavMode.DefaultMode maps to ordinal value 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterMode0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterMode0001 begin');
      const actual: number = NavMode.DefaultMode as number;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=0`);
      expect(actual).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRouterMode0001 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTERMODE_0002
     * @tc.name      testRouterMode0002
     * @tc.desc      Checks NavMode.FoldMode maps to ordinal value 1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterMode0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterMode0002 begin');
      const actual: number = NavMode.FoldMode as number;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=1`);
      expect(actual).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRouterMode0002 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTERMODE_0003
     * @tc.name      testRouterMode0003
     * @tc.desc      Checks NavMode.ChildPageMode maps to ordinal value 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterMode0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterMode0003 begin');
      const actual: number = NavMode.ChildPageMode as number;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=2`);
      expect(actual).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRouterMode0003 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTERMODE_0004
     * @tc.name      testRouterMode0004
     * @tc.desc      Checks NavMode.HomePageMode maps to ordinal value 3.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterMode0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterMode0004 begin');
      const actual: number = NavMode.HomePageMode as number;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=3`);
      expect(actual).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRouterMode0004 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTERMODE_0005
     * @tc.name      testRouterMode0005
     * @tc.desc      Checks NavMode.DefaultMode does not degrade away from number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterMode0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterMode0005 begin');
      const actual: number = NavMode.DefaultMode as number;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRouterMode0005 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTERMODE_0006
     * @tc.name      testRouterMode0006
     * @tc.desc      Checks NavMode.FoldMode does not degrade away from number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterMode0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterMode0006 begin');
      const actual: number = NavMode.FoldMode as number;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRouterMode0006 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTERMODE_0007
     * @tc.name      testRouterMode0007
     * @tc.desc      Checks NavMode.ChildPageMode does not degrade away from number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterMode0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterMode0007 begin');
      const actual: number = NavMode.ChildPageMode as number;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRouterMode0007 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTERMODE_0008
     * @tc.name      testRouterMode0008
     * @tc.desc      Checks NavMode.HomePageMode does not degrade away from number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterMode0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterMode0008 begin');
      const actual: number = NavMode.HomePageMode as number;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testRouterMode0008 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTERMODE_0009
     * @tc.name      testRouterMode0009
     * @tc.desc      Checks DefaultMode and FoldMode are distinct enum members.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterMode0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterMode0009 begin');
      const first: number = NavMode.DefaultMode as number;
      const second: number = NavMode.FoldMode as number;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue first !== second=${first !== second}`);
      expect(first !== second).assertTrue();
      log('testRouterMode0009 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTERMODE_0010
     * @tc.name      testRouterMode0010
     * @tc.desc      Checks FoldMode and ChildPageMode are distinct enum members.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterMode0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterMode0010 begin');
      const first: number = NavMode.FoldMode as number;
      const second: number = NavMode.ChildPageMode as number;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue first !== second=${first !== second}`);
      expect(first !== second).assertTrue();
      log('testRouterMode0010 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTERMODE_0011
     * @tc.name      testRouterMode0011
     * @tc.desc      Checks ChildPageMode and HomePageMode are distinct enum members.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterMode0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterMode0011 begin');
      const first: number = NavMode.ChildPageMode as number;
      const second: number = NavMode.HomePageMode as number;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue first !== second=${first !== second}`);
      expect(first !== second).assertTrue();
      log('testRouterMode0011 end');
    })

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_ROUTERMODE_0012
     * @tc.name      testRouterMode0012
     * @tc.desc      Checks DefaultMode and HomePageMode are distinct enum members.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRouterMode0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testRouterMode0012 begin');
      const first: number = NavMode.DefaultMode as number;
      const second: number = NavMode.HomePageMode as number;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue first !== second=${first !== second}`);
      expect(first !== second).assertTrue();
      log('testRouterMode0012 end');
    })
  })
}
