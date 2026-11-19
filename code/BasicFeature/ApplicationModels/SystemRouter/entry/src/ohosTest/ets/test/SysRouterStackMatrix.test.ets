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

import { beforeEachIt, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemRouter]';

export default function sysRouterStackMatrixTest(): void {
  describe('SysRouterStackMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_STACK_0001
     * @tc.name      sysRouterStackMatrix0001
     * @tc.desc      新建的 NavPathStack 页面数为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterStackMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0001 begin');
      const stack: NavPathStack = new NavPathStack();
      const actual1: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      const actual2: number = stack.getAllPathName().length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0);
      const actual3: boolean = Array.isArray(stack.getAllPathName());
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertTrue();
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0001 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_STACK_0002
     * @tc.name      sysRouterStackMatrix0002
     * @tc.desc      pushPathByName 入栈 entry 本地页面后栈深为 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterStackMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0002 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('pageOne', null);
      const actual1: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(1);
      const actual2: string = stack.getAllPathName()[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('pageOne');
      const actual3: number = stack.getAllPathName().length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0002 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_STACK_0003
     * @tc.name      sysRouterStackMatrix0003
     * @tc.desc      连续入栈 HAR 与 HSP 页面后保持入栈顺序
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterStackMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0003 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('pageOne', null);
      stack.pushPathByName('HarAPageOne', null);
      stack.pushPathByName('HspBPageTwo', null);
      const actual1: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(3);
      const actual2: string = stack.getAllPathName()[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('pageOne');
      const actual3: string = stack.getAllPathName()[2];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('HspBPageTwo');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0003 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_STACK_0004
     * @tc.name      sysRouterStackMatrix0004
     * @tc.desc      getIndexByName 返回系统路由页面在栈中的下标
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterStackMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0004 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('pageTwo', null);
      stack.pushPathByName('HarBPageTwo', null);
      const indexes: Array<number> = stack.getIndexByName('HarBPageTwo');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 indexes.length=${indexes.length}`);
      expect(indexes.length).assertEqual(1);
      const actual2: number = indexes[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(1);
      const actual3: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(2);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0004 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_STACK_0005
     * @tc.name      sysRouterStackMatrix0005
     * @tc.desc      重复入栈同名系统路由时返回多个下标
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterStackMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0005 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('HarAPageOne', null);
      stack.pushPathByName('pageOne', null);
      stack.pushPathByName('HarAPageOne', null);
      const indexes: Array<number> = stack.getIndexByName('HarAPageOne');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 indexes.length=${indexes.length}`);
      expect(indexes.length).assertEqual(2);
      const actual2: boolean = indexes[0] !== indexes[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const actual3: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(3);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0005 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_STACK_0006
     * @tc.name      sysRouterStackMatrix0006
     * @tc.desc      getParamByIndex 取回入栈时携带的页面参数
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterStackMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0006 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('HspAPageOne', 'hsp-param');
      const param: Object = stack.getParamByIndex(0) as Object;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 param=${param}`);
      expect(param).assertEqual('hsp-param');
      const actual2: string = typeof param;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0006 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_STACK_0007
     * @tc.name      sysRouterStackMatrix0007
     * @tc.desc      getParamByName 取回同名页面的参数数组
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterStackMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0007 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('HarBPageOne', 'value-one');
      const params: Array<Object> = stack.getParamByName('HarBPageOne') as Array<Object>;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 params.length=${params.length}`);
      expect(params.length).assertEqual(1);
      const actual2: boolean = Array.isArray(params);
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      const paramValue: string = params[0] as string;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 paramValue=${paramValue}`);
      expect(paramValue).assertEqual('value-one');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0007 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_STACK_0008
     * @tc.name      sysRouterStackMatrix0008
     * @tc.desc      pop 返回被弹出的系统路由页面信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterStackMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0008 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('HspBPageOne', null);
      const popped: NavPathInfo | undefined = stack.pop();
      const poppedName: string = popped === undefined ? '' : popped.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 poppedName=${poppedName}`);
      expect(poppedName).assertEqual('HspBPageOne');
      const actual2: boolean = popped === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(0);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0008 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_STACK_0009
     * @tc.name      sysRouterStackMatrix0009
     * @tc.desc      空栈 pop 返回 undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterStackMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0009 begin');
      const stack: NavPathStack = new NavPathStack();
      const popped: NavPathInfo | undefined = stack.pop();
      const actual1: boolean = popped === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0);
      const actual3: number = stack.getAllPathName().length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(0);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0009 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_STACK_0010
     * @tc.name      sysRouterStackMatrix0010
     * @tc.desc      clear 清空系统路由页面栈
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterStackMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0010 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('pageOne', null);
      stack.pushPathByName('HspAPageTwo', null);
      stack.clear();
      const actual1: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      const actual2: number = stack.getIndexByName('pageOne').length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0);
      const actual3: number = stack.getAllPathName().length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(0);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0010 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_STACK_0011
     * @tc.name      sysRouterStackMatrix0011
     * @tc.desc      removeByName 返回被移除的系统路由页面数量
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterStackMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0011 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('HarAPageTwo', null);
      stack.pushPathByName('pageTwo', null);
      const removed: number = stack.removeByName('HarAPageTwo');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 removed=${removed}`);
      expect(removed).assertEqual(1);
      const actual2: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(1);
      const actual3: string = stack.getAllPathName()[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('pageTwo');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0011 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_STACK_0012
     * @tc.name      sysRouterStackMatrix0012
     * @tc.desc      removeByName 移除不存在的系统路由返回 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterStackMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0012 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('pageOne', null);
      const removed: number = stack.removeByName('NotRegisteredPage');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 removed=${removed}`);
      expect(removed).assertEqual(0);
      const actual2: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(1);
      const actual3: string = stack.getAllPathName()[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('pageOne');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0012 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_STACK_0013
     * @tc.name      sysRouterStackMatrix0013
     * @tc.desc      removeByIndexes 按下标批量移除系统路由页面
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterStackMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0013 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('pageOne', null);
      stack.pushPathByName('HarAPageOne', null);
      stack.pushPathByName('HspAPageOne', null);
      const indexes: Array<number> = [0, 2];
      const removed: number = stack.removeByIndexes(indexes);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 removed=${removed}`);
      expect(removed).assertEqual(2);
      const actual2: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(1);
      const actual3: string = stack.getAllPathName()[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('HarAPageOne');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0013 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_STACK_0014
     * @tc.name      sysRouterStackMatrix0014
     * @tc.desc      moveIndexToTop 把指定系统路由页面移到栈顶
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterStackMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0014 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('pageOne', null);
      stack.pushPathByName('HarBPageOne', null);
      stack.pushPathByName('HspBPageOne', null);
      stack.moveIndexToTop(0);
      const actual1: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(3);
      const actual2: string = stack.getAllPathName()[2];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('pageOne');
      const actual3: number = stack.getAllPathName().length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(3);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0014 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_STACK_0015
     * @tc.name      sysRouterStackMatrix0015
     * @tc.desc      moveToTop 按页面名把系统路由移到栈顶
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterStackMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0015 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('HspAPageOne', null);
      stack.pushPathByName('pageTwo', null);
      const index: number = stack.moveToTop('HspAPageOne');
      const actual1: boolean = index >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(2);
      const actual3: string = stack.getAllPathName()[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('HspAPageOne');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0015 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_STACK_0016
     * @tc.name      sysRouterStackMatrix0016
     * @tc.desc      replacePathByName 替换栈顶系统路由页面
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterStackMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0016 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('pageOne', null);
      stack.replacePathByName('HarAPageTwo', null);
      const actual1: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(1);
      const actual2: string = stack.getAllPathName()[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('HarAPageTwo');
      const actual3: number = stack.getIndexByName('HarAPageTwo').length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0016 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_STACK_0017
     * @tc.name      sysRouterStackMatrix0017
     * @tc.desc      连续 pop 按后进先出弹出系统路由页面
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterStackMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0017 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('pageOne', null);
      stack.pushPathByName('HspBPageTwo', null);
      const first: NavPathInfo | undefined = stack.pop();
      const firstName: string = first === undefined ? '' : first.name;
      const second: NavPathInfo | undefined = stack.pop();
      const secondName: string = second === undefined ? '' : second.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 firstName=${firstName}`);
      expect(firstName).assertEqual('HspBPageTwo');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 secondName=${secondName}`);
      expect(secondName).assertEqual('pageOne');
      const actual3: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(0);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0017 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_STACK_0018
     * @tc.name      sysRouterStackMatrix0018
     * @tc.desc      getIndexByName 未命中系统路由时返回空数组
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterStackMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0018 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('pageOne', null);
      const missing: Array<number> = stack.getIndexByName('HspBPageOne');
      const actual1: boolean = Array.isArray(missing);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 missing.length=${missing.length}`);
      expect(missing.length).assertEqual(0);
      const actual3: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0018 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_STACK_0019
     * @tc.name      sysRouterStackMatrix0019
     * @tc.desc      pushPath 使用 NavPathInfo 入栈系统路由页面
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterStackMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0019 begin');
      const stack: NavPathStack = new NavPathStack();
      const info: NavPathInfo = new NavPathInfo('HarBPageOne', null);
      stack.pushPath(info);
      const actual1: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(1);
      const actual2: string = stack.getAllPathName()[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('HarBPageOne');
      const actual3: number = stack.getAllPathName().length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0019 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_STACK_0020
     * @tc.name      sysRouterStackMatrix0020
     * @tc.desc      replacePath 使用 NavPathInfo 替换系统路由栈顶
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterStackMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0020 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('pageTwo', null);
      const info: NavPathInfo = new NavPathInfo('HspAPageTwo', null);
      stack.replacePath(info);
      const actual1: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(1);
      const actual2: string = stack.getAllPathName()[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('HspAPageTwo');
      const actual3: number = stack.getAllPathName().length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0020 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_STACK_0021
     * @tc.name      sysRouterStackMatrix0021
     * @tc.desc      disableAnimation 关闭动效不影响系统路由页面栈
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterStackMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0021 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('HarAPageOne', null);
      stack.disableAnimation(true);
      const actual1: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(1);
      const actual2: string = stack.getAllPathName()[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('HarAPageOne');
      const actual3: number = stack.getAllPathName().length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0021 end');
    })

    /**
     * @tc.number    SUB_SYSTEM_ROUTER_STACK_0022
     * @tc.name      sysRouterStackMatrix0022
     * @tc.desc      同名系统路由多次入栈后栈深递增
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('sysRouterStackMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0022 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('HspBPageOne', null);
      stack.pushPathByName('HspBPageOne', null);
      stack.pushPathByName('HspBPageOne', null);
      const actual1: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(3);
      const actual2: number = stack.getIndexByName('HspBPageOne').length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(3);
      const actual3: number = stack.getAllPathName().length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(3);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'sysRouterStackMatrix0022 end');
    })
  })
}
