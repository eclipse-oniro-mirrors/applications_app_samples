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
const TAG: string = '[Sample_DynamicRouter]';

export default function dynRouterStackMatrixTest(): void {
  describe('DynRouterStackMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 util/TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_STACK_0001
     * @tc.name      dynRouterStackMatrix0001
     * @tc.desc      新建的 NavPathStack 页面数为 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterStackMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0001 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0001 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_STACK_0002
     * @tc.name      dynRouterStackMatrix0002
     * @tc.desc      pushPathByName 入栈一个页面后栈深为 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterStackMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0002 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('HarA_Page1_Builder', null);
      const actual1: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(1);
      const actual2: number = stack.getAllPathName().length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(1);
      const actual3: string = stack.getAllPathName()[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('HarA_Page1_Builder');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0002 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_STACK_0003
     * @tc.name      dynRouterStackMatrix0003
     * @tc.desc      连续入栈的页面按先进后出顺序排列
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterStackMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0003 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('PageOne', null);
      stack.pushPathByName('PageTwo', null);
      stack.pushPathByName('PageThree', null);
      const actual1: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(3);
      const actual2: string = stack.getAllPathName()[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('PageOne');
      const actual3: string = stack.getAllPathName()[2];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('PageThree');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0003 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_STACK_0004
     * @tc.name      dynRouterStackMatrix0004
     * @tc.desc      getIndexByName 返回页面在栈中的下标
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterStackMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0004 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('First', null);
      stack.pushPathByName('Second', null);
      const indexes: Array<number> = stack.getIndexByName('Second');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0004 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_STACK_0005
     * @tc.name      dynRouterStackMatrix0005
     * @tc.desc      重复页面名时 getIndexByName 返回多个下标
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterStackMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0005 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('Repeat', null);
      stack.pushPathByName('Other', null);
      stack.pushPathByName('Repeat', null);
      const indexes: Array<number> = stack.getIndexByName('Repeat');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0005 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_STACK_0006
     * @tc.name      dynRouterStackMatrix0006
     * @tc.desc      getParamByIndex 取回入栈时携带的参数
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterStackMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0006 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('WithParam', 'page-param');
      const param: Object = stack.getParamByIndex(0) as Object;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 param=${param}`);
      expect(param).assertEqual('page-param');
      const actual2: string = typeof param;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('string');
      const actual3: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0006 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_STACK_0007
     * @tc.name      dynRouterStackMatrix0007
     * @tc.desc      getParamByName 取回同名页面的参数数组
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterStackMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0007 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('ParamName', 'value-one');
      const params: Array<Object> = stack.getParamByName('ParamName') as Array<Object>;
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0007 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_STACK_0008
     * @tc.name      dynRouterStackMatrix0008
     * @tc.desc      pop 返回被弹出页面的信息
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterStackMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0008 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('PopMe', null);
      const popped: NavPathInfo | undefined = stack.pop();
      const poppedName: string = popped === undefined ? '' : popped.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 poppedName=${poppedName}`);
      expect(poppedName).assertEqual('PopMe');
      const actual2: boolean = popped === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertFalse();
      const actual3: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(0);
      const actual4: number = stack.getAllPathName().length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual(0);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0008 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_STACK_0009
     * @tc.name      dynRouterStackMatrix0009
     * @tc.desc      空栈 pop 返回 undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterStackMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0009 begin');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0009 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_STACK_0010
     * @tc.name      dynRouterStackMatrix0010
     * @tc.desc      clear 把页面栈清空
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterStackMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0010 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('ClearOne', null);
      stack.pushPathByName('ClearTwo', null);
      stack.clear();
      const actual1: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      const actual2: number = stack.getAllPathName().length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0);
      const actual3: number = stack.getIndexByName('ClearOne').length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(0);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0010 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_STACK_0011
     * @tc.name      dynRouterStackMatrix0011
     * @tc.desc      removeByName 返回被移除的页面数量
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterStackMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0011 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('RemoveMe', null);
      stack.pushPathByName('KeepMe', null);
      const removed: number = stack.removeByName('RemoveMe');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 removed=${removed}`);
      expect(removed).assertEqual(1);
      const actual2: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(1);
      const actual3: string = stack.getAllPathName()[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('KeepMe');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0011 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_STACK_0012
     * @tc.name      dynRouterStackMatrix0012
     * @tc.desc      removeByName 移除不存在的页面时返回 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterStackMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0012 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('OnlyOne', null);
      const removed: number = stack.removeByName('NotExists');
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 removed=${removed}`);
      expect(removed).assertEqual(0);
      const actual2: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(1);
      const actual3: string = stack.getAllPathName()[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('OnlyOne');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0012 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_STACK_0013
     * @tc.name      dynRouterStackMatrix0013
     * @tc.desc      removeByIndexes 按下标批量移除页面
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterStackMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0013 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('Idx0', null);
      stack.pushPathByName('Idx1', null);
      stack.pushPathByName('Idx2', null);
      const indexes: Array<number> = [0, 2];
      const removed: number = stack.removeByIndexes(indexes);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 removed=${removed}`);
      expect(removed).assertEqual(2);
      const actual2: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(1);
      const actual3: string = stack.getAllPathName()[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('Idx1');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0013 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_STACK_0014
     * @tc.name      dynRouterStackMatrix0014
     * @tc.desc      moveIndexToTop 把指定下标页面移到栈顶
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterStackMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0014 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('Bottom', null);
      stack.pushPathByName('Middle', null);
      stack.pushPathByName('Top', null);
      stack.moveIndexToTop(0);
      const actual1: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(3);
      const actual2: number = stack.getAllPathName().length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(3);
      const actual3: string = stack.getAllPathName()[2];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('Bottom');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0014 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_STACK_0015
     * @tc.name      dynRouterStackMatrix0015
     * @tc.desc      moveToTop 按页面名移动到栈顶
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterStackMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0015 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('MoveSource', null);
      stack.pushPathByName('MoveTarget', null);
      const index: number = stack.moveToTop('MoveSource');
      const actual1: boolean = index >= 0;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(2);
      const actual3: string = stack.getAllPathName()[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('MoveSource');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0015 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_STACK_0016
     * @tc.name      dynRouterStackMatrix0016
     * @tc.desc      replacePathByName 替换页面但不改变栈深
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterStackMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0016 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('OldPage', null);
      stack.replacePathByName('NewPage', null);
      const actual1: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(1);
      const actual2: string = stack.getAllPathName()[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual('NewPage');
      const actual3: number = stack.getIndexByName('NewPage').length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0016 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_STACK_0017
     * @tc.name      dynRouterStackMatrix0017
     * @tc.desc      连续 pop 按后进先出依次弹出页面
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterStackMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0017 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('LowerPage', null);
      stack.pushPathByName('UpperPage', null);
      const first: NavPathInfo | undefined = stack.pop();
      const firstName: string = first === undefined ? '' : first.name;
      const second: NavPathInfo | undefined = stack.pop();
      const secondName: string = second === undefined ? '' : second.name;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 firstName=${firstName}`);
      expect(firstName).assertEqual('UpperPage');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 secondName=${secondName}`);
      expect(secondName).assertEqual('LowerPage');
      const actual3: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(0);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0017 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_STACK_0018
     * @tc.name      dynRouterStackMatrix0018
     * @tc.desc      getParamByIndex 按下标区分不同页面的参数
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterStackMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0018 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('ParamIndexZero', 'value-zero');
      stack.pushPathByName('ParamIndexOne', 'value-one');
      const zero: Object = stack.getParamByIndex(0) as Object;
      const one: Object = stack.getParamByIndex(1) as Object;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1 zero=${zero}`);
      expect(zero).assertEqual('value-zero');
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 one=${one}`);
      expect(one).assertEqual('value-one');
      const actual3: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(2);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0018 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_STACK_0019
     * @tc.name      dynRouterStackMatrix0019
     * @tc.desc      getAllPathName 返回的页面名与入栈顺序一致
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterStackMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0019 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('NameOne', null);
      stack.pushPathByName('NameTwo', null);
      const names: Array<string> = stack.getAllPathName();
      const actual1: boolean = Array.isArray(names);
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2 names.length=${names.length}`);
      expect(names.length).assertEqual(2);
      const actual3: string = names[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('NameOne');
      const actual4: string = names[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `a4=${actual4}`);
      expect(actual4).assertEqual('NameTwo');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0019 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_STACK_0020
     * @tc.name      dynRouterStackMatrix0020
     * @tc.desc      getIndexByName 未命中时返回空数组
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterStackMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0020 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('OnlyPage', null);
      const missing: Array<number> = stack.getIndexByName('NotInStack');
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
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0020 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_STACK_0021
     * @tc.name      dynRouterStackMatrix0021
     * @tc.desc      同名页面多次入栈后栈深递增
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterStackMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0021 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('SamePage', null);
      stack.pushPathByName('SamePage', null);
      stack.pushPathByName('SamePage', null);
      const actual1: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(3);
      const actual2: number = stack.getIndexByName('SamePage').length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(3);
      const actual3: number = stack.getAllPathName().length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(3);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0021 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_STACK_0022
     * @tc.name      dynRouterStackMatrix0022
     * @tc.desc      pushPath 使用 NavPathInfo 入栈
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterStackMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0022 begin');
      const stack: NavPathStack = new NavPathStack();
      const info: NavPathInfo = new NavPathInfo('InfoPushed', null);
      stack.pushPath(info);
      const actual1: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(1);
      const actual2: number = stack.getAllPathName().length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(1);
      const actual3: string = stack.getAllPathName()[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('InfoPushed');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0022 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_STACK_0023
     * @tc.name      dynRouterStackMatrix0023
     * @tc.desc      replacePath 使用 NavPathInfo 替换栈顶
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterStackMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0023 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('BeforeReplace', null);
      const info: NavPathInfo = new NavPathInfo('AfterReplace', null);
      stack.replacePath(info);
      const actual1: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(1);
      const actual2: number = stack.getAllPathName().length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(1);
      const actual3: string = stack.getAllPathName()[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('AfterReplace');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0023 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_STACK_0024
     * @tc.name      dynRouterStackMatrix0024
     * @tc.desc      disableAnimation 关闭动效不影响页面栈内容
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterStackMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0024 begin');
      const stack: NavPathStack = new NavPathStack();
      stack.pushPathByName('Animated', null);
      stack.disableAnimation(true);
      const actual1: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(1);
      const actual2: number = stack.getAllPathName().length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(1);
      const actual3: string = stack.getAllPathName()[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('Animated');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterStackMatrix0024 end');
    })
  })
}
