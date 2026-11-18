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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { RouterModule } from 'RouterModule/src/main/ets/utils/RouterModule';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DynamicRouter]';

export default function dynRouterModuleMatrixTest(): void {
  describe('DynRouterModuleMatrixTest', () => {
    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_MODULE_0001
     * @tc.name      dynRouterModuleMatrix0001
     * @tc.desc      createRouter 与 getRouter 取到同一份页面栈
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterModuleMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterModuleMatrix0001 begin');
      const stack: NavPathStack = new NavPathStack();
      RouterModule.createRouter('DynRouter_Check', stack);
      const got: NavPathStack = RouterModule.getRouter('DynRouter_Check');
      const actual1: boolean = got === stack;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: number = got.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0);
      const actual3: number = got.getAllPathName().length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(0);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterModuleMatrix0001 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_MODULE_0002
     * @tc.name      dynRouterModuleMatrix0002
     * @tc.desc      不同路由名对应互不影响的页面栈
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterModuleMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterModuleMatrix0002 begin');
      const stackA: NavPathStack = new NavPathStack();
      const stackB: NavPathStack = new NavPathStack();
      RouterModule.createRouter('DynRouter_A', stackA);
      RouterModule.createRouter('DynRouter_B', stackB);
      RouterModule.getRouter('DynRouter_A').pushPathByName('OnlyA', null);
      const actual1: number = RouterModule.getRouter('DynRouter_A').size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(1);
      const actual2: number = RouterModule.getRouter('DynRouter_A').getAllPathName().length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(1);
      const actual3: number = RouterModule.getRouter('DynRouter_B').size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(0);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterModuleMatrix0002 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_MODULE_0003
     * @tc.name      dynRouterModuleMatrix0003
     * @tc.desc      同名 createRouter 会覆盖旧的页面栈
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterModuleMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterModuleMatrix0003 begin');
      const first: NavPathStack = new NavPathStack();
      const second: NavPathStack = new NavPathStack();
      RouterModule.createRouter('DynRouter_Overwrite', first);
      RouterModule.createRouter('DynRouter_Overwrite', second);
      const actual1: boolean = RouterModule.getRouter('DynRouter_Overwrite') === second;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      RouterModule.getRouter('DynRouter_Overwrite').pushPathByName('AfterOverwrite', null);
      const actual2: number = first.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0);
      const actual3: number = second.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(1);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterModuleMatrix0003 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_MODULE_0004
     * @tc.name      dynRouterModuleMatrix0004
     * @tc.desc      未注册的路由名取不到页面栈
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterModuleMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterModuleMatrix0004 begin');
      const raw: NavPathStack = RouterModule.getRouter('DynRouter_Missing');
      const missing: NavPathStack | undefined = raw as NavPathStack | undefined;
      const missingSize: number = missing === undefined ? -1 : missing.size();
      const actual1: boolean = missing === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: boolean = raw === undefined;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3 missingSize=${missingSize}`);
      expect(missingSize).assertEqual(-1);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterModuleMatrix0004 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_MODULE_0005
     * @tc.name      dynRouterModuleMatrix0005
     * @tc.desc      RouterModule.pop 弹出注册页面栈的栈顶
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterModuleMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterModuleMatrix0005 begin');
      const stack: NavPathStack = new NavPathStack();
      RouterModule.createRouter('DynRouter_Pop', stack);
      stack.pushPathByName('PopByModule', null);
      RouterModule.pop('DynRouter_Pop');
      const actual1: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      const actual2: number = stack.getAllPathName().length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0);
      const actual3: number = stack.getIndexByName('PopByModule').length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(0);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterModuleMatrix0005 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_MODULE_0006
     * @tc.name      dynRouterModuleMatrix0006
     * @tc.desc      RouterModule.clear 清空注册页面栈
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterModuleMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterModuleMatrix0006 begin');
      const stack: NavPathStack = new NavPathStack();
      RouterModule.createRouter('DynRouter_Clear', stack);
      stack.pushPathByName('ClearByModuleOne', null);
      stack.pushPathByName('ClearByModuleTwo', null);
      RouterModule.clear('DynRouter_Clear');
      const actual1: number = stack.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(0);
      const actual2: number = stack.getAllPathName().length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0);
      const actual3: number = stack.getIndexByName('ClearByModuleOne').length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(0);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterModuleMatrix0006 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_MODULE_0007
     * @tc.name      dynRouterModuleMatrix0007
     * @tc.desc      重复注册同一个页面栈名字仍只保留一份
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterModuleMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterModuleMatrix0007 begin');
      const stack: NavPathStack = new NavPathStack();
      RouterModule.createRouter('DynRouter_Repeat', stack);
      RouterModule.createRouter('DynRouter_Repeat', stack);
      const first: NavPathStack = RouterModule.getRouter('DynRouter_Repeat');
      const second: NavPathStack = RouterModule.getRouter('DynRouter_Repeat');
      const actual1: boolean = first === second;
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertTrue();
      const actual2: number = first.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(0);
      const actual3: number = second.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual(0);
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterModuleMatrix0007 end');
    })

    /**
     * @tc.number    SUB_DYNAMIC_ROUTER_MODULE_0008
     * @tc.name      dynRouterModuleMatrix0008
     * @tc.desc      RouterModule 里的页面栈保持普通页面栈语义
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('dynRouterModuleMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterModuleMatrix0008 begin');
      const stack: NavPathStack = new NavPathStack();
      RouterModule.createRouter('DynRouter_StackOps', stack);
      const router: NavPathStack = RouterModule.getRouter('DynRouter_StackOps');
      router.pushPathByName('RouterOpOne', null);
      router.pushPathByName('RouterOpTwo', null);
      const actual1: number = router.size();
      hilog.info(DOMAIN, TAG, '%{public}s', `a1=${actual1}`);
      expect(actual1).assertEqual(2);
      const actual2: number = router.getAllPathName().length;
      hilog.info(DOMAIN, TAG, '%{public}s', `a2=${actual2}`);
      expect(actual2).assertEqual(2);
      const actual3: string = router.getAllPathName()[1];
      hilog.info(DOMAIN, TAG, '%{public}s', `a3=${actual3}`);
      expect(actual3).assertEqual('RouterOpTwo');
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 0);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'dynRouterModuleMatrix0008 end');
    })
  })
}
