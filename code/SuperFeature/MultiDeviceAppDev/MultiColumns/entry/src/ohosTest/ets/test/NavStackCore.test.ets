/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

// L1 逻辑套件：NavPathStack 路由栈控制器。
// 被测行为锚点：Settings.ets / MailNavigation.ets 均使用 `new NavPathStack()` 并 pushPath({name:'one'})，
// 配合 Navigation(NavPathStack) + navDestination 做路由。本套件仅测 NavPathStack 的同步栈操作
// （pushPath/pushPathByName/pop/popToName/popToIndex/moveToTop/removeByName/removeByIndexes/
//  replacePath/clear/size/getAllPathName/getIndexByName/getParamByName/getParamByIndex），
// 这些是纯栈数组操作、无需挂载 Navigation 即可确定性验证；不测依赖渲染的 pushDestination/setInterception。
// 期望值来源：ArkUI Navigation 官方文档对 NavPathStack 各方法返回值/副作用的规格约定。
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[MultiColumns_NAV]';
const BIG_PARAM: string = 'MultiColumns_NavPathStack_big_param_payload_0123456789_abcdefghijklmnopqrstuvwxyz';

export default function navStackCoreTest() {
  describe('MultiColumnsNavStackTest', () => {

    /**
     * @tc.number SUB_MC_NAV_3001
     * @tc.name testNavStack3001
     * @tc.desc smoke：新建路由栈为空（size 0、无路径名、任意名索引为空）
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('testNavStack3001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3001 begin');
      const st: NavPathStack = new NavPathStack();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(0));
      expect(st.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName().length), String(0));
      expect(st.getAllPathName().length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getIndexByName('none').length), String(0));
      expect(st.getIndexByName('none').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3001 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3002
     * @tc.name testNavStack3002
     * @tc.desc smoke：pushPath 单入栈后 size 与路径名序列一致
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('testNavStack3002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3002 begin');
      const st: NavPathStack = new NavPathStack();
      st.pushPath({ name: 'one' });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(1));
      expect(st.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName()[0]), String('one'));
      expect(st.getAllPathName()[0]).assertEqual('one');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName().length), String(1));
      expect(st.getAllPathName().length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3002 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3003
     * @tc.name testNavStack3003
     * @tc.desc 合法值：getIndexByName 命中唯一路径返回其索引 [0]
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('testNavStack3003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3003 begin');
      const st: NavPathStack = new NavPathStack();
      st.pushPath({ name: 'one' });
      const idx: Array<number> = st.getIndexByName('one');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(idx.length), String(1));
      expect(idx.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(idx[0]), String(0));
      expect(idx[0]).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(1));
      expect(st.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3003 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3004
     * @tc.name testNavStack3004
     * @tc.desc 合法值：pushPathByName 携带 number 参数可原样回读
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testNavStack3004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3004 begin');
      const st: NavPathStack = new NavPathStack();
      st.pushPathByName('two', 7, false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByName('two').length), String(1));
      expect(st.getParamByName('two').length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByName('two')[0] as number), String(7));
      expect(st.getParamByName('two')[0] as number).assertEqual(7);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName()[0]), String('two'));
      expect(st.getAllPathName()[0]).assertEqual('two');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3004 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3005
     * @tc.name testNavStack3005
     * @tc.desc 合法值：多页入栈保持插入顺序且参数按索引可读
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('testNavStack3005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3005 begin');
      const st: NavPathStack = new NavPathStack();
      st.pushPathByName('a', 1, false);
      st.pushPathByName('b', 2, false);
      st.pushPathByName('c', 3, false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName().join(',')), String('a,b,c'));
      expect(st.getAllPathName().join(',')).assertEqual('a,b,c');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(3));
      expect(st.size()).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(2) as number), String(3));
      expect(st.getParamByIndex(2) as number).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3005 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3006
     * @tc.name testNavStack3006
     * @tc.desc 合法值：pop 返回并移除栈顶元素
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('testNavStack3006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3006 begin');
      const st: NavPathStack = new NavPathStack();
      st.pushPathByName('a', 1, false);
      st.pushPathByName('b', 2, false);
      const popped: NavPathInfo | undefined = st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(popped?.name), String('b'));
      expect(popped?.name).assertEqual('b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(1));
      expect(st.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName()[0]), String('a'));
      expect(st.getAllPathName()[0]).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3006 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3007
     * @tc.name testNavStack3007
     * @tc.desc 合法值：同名多次入栈 getIndexByName 返回全部索引
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testNavStack3007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3007 begin');
      const st: NavPathStack = new NavPathStack();
      st.pushPath({ name: 'a' });
      st.pushPath({ name: 'b' });
      st.pushPath({ name: 'a' });
      const idx: Array<number> = st.getIndexByName('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(idx.length), String(2));
      expect(idx.length).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(idx[1]), String(2));
      expect(idx[1]).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(3));
      expect(st.size()).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3007 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3008
     * @tc.name testNavStack3008
     * @tc.desc 合法值：getParamByIndex 命中返回 string 参数
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testNavStack3008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3008 begin');
      const st: NavPathStack = new NavPathStack();
      st.pushPathByName('x', 'p', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByIndex(0) as string), String('p'));
      expect(st.getParamByIndex(0) as string).assertEqual('p');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(1));
      expect(st.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName()[0]), String('x'));
      expect(st.getAllPathName()[0]).assertEqual('x');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3008 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3009
     * @tc.name testNavStack3009
     * @tc.desc 合法值：popToName 命中栈底目标返回其索引并回退到该页
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testNavStack3009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3009 begin');
      const st: NavPathStack = new NavPathStack();
      st.pushPathByName('a', 1, false);
      st.pushPathByName('b', 2, false);
      st.pushPathByName('c', 3, false);
      const poppedIndex: number = st.popToName('a', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(poppedIndex), String(0));
      expect(poppedIndex).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(1));
      expect(st.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName()[0]), String('a'));
      expect(st.getAllPathName()[0]).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3009 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3010
     * @tc.name testNavStack3010
     * @tc.desc 合法值：removeByName 返回被删除页面数量
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testNavStack3010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3010 begin');
      const st: NavPathStack = new NavPathStack();
      st.pushPath({ name: 'a' });
      st.pushPath({ name: 'b' });
      st.pushPath({ name: 'a' });
      const removedCount: number = st.removeByName('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(removedCount), String(2));
      expect(removedCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(1));
      expect(st.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName()[0]), String('b'));
      expect(st.getAllPathName()[0]).assertEqual('b');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3010 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3011
     * @tc.name testNavStack3011
     * @tc.desc 合法值：removeByIndexes 按索引集合删除并返回数量
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testNavStack3011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3011 begin');
      const st: NavPathStack = new NavPathStack();
      st.pushPath({ name: 'a' });
      st.pushPath({ name: 'b' });
      st.pushPath({ name: 'c' });
      const removedCount: number = st.removeByIndexes([0, 2]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(removedCount), String(2));
      expect(removedCount).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(1));
      expect(st.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName()[0]), String('b'));
      expect(st.getAllPathName()[0]).assertEqual('b');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3011 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3012
     * @tc.name testNavStack3012
     * @tc.desc 合法值：moveToTop 将首个同名页移到栈顶并返回其原索引
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testNavStack3012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3012 begin');
      const st: NavPathStack = new NavPathStack();
      st.pushPath({ name: 'a' });
      st.pushPath({ name: 'b' });
      st.pushPath({ name: 'c' });
      const movedIndex: number = st.moveToTop('a', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(movedIndex), String(0));
      expect(movedIndex).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName().join(',')), String('b,c,a'));
      expect(st.getAllPathName().join(',')).assertEqual('b,c,a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(3));
      expect(st.size()).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3012 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3013
     * @tc.name testNavStack3013
     * @tc.desc 状态：replacePath 用新页替换栈顶且栈大小不变
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testNavStack3013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3013 begin');
      const st: NavPathStack = new NavPathStack();
      st.pushPath({ name: 'a' });
      st.pushPath({ name: 'b' });
      st.replacePath({ name: 'c' }, false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(2));
      expect(st.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName()[1]), String('c'));
      expect(st.getAllPathName()[1]).assertEqual('c');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName()[0]), String('a'));
      expect(st.getAllPathName()[0]).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3013 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3014
     * @tc.name testNavStack3014
     * @tc.desc 状态：clear 清空栈中所有页面
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('testNavStack3014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3014 begin');
      const st: NavPathStack = new NavPathStack();
      st.pushPath({ name: 'a' });
      st.pushPath({ name: 'b' });
      st.pushPath({ name: 'c' });
      st.clear(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(0));
      expect(st.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName().length), String(0));
      expect(st.getAllPathName().length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getIndexByName('a').length), String(0));
      expect(st.getIndexByName('a').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3014 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3015
     * @tc.name testNavStack3015
     * @tc.desc 边界值：空栈 pop 返回 undefined 且栈仍为空
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('testNavStack3015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3015 begin');
      const st: NavPathStack = new NavPathStack();
      const popped: NavPathInfo | undefined = st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertUndefined', String(popped));
      expect(popped).assertUndefined();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(0));
      expect(st.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName().length), String(0));
      expect(st.getAllPathName().length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3015 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3016
     * @tc.name testNavStack3016
     * @tc.desc 边界值：空栈查询接口返回空集合且 popToName 返回 -1
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testNavStack3016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3016 begin');
      const st: NavPathStack = new NavPathStack();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName().length), String(0));
      expect(st.getAllPathName().length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(0));
      expect(st.size()).assertEqual(0);
      const poppedIndex: number = st.popToName('x', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(poppedIndex), String(-1));
      expect(poppedIndex).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3016 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3017
     * @tc.name testNavStack3017
     * @tc.desc 边界值：空栈 clear 幂等且随后仍可正常入栈
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testNavStack3017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3017 begin');
      const st: NavPathStack = new NavPathStack();
      st.clear(false);
      st.clear(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(0));
      expect(st.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName().length), String(0));
      expect(st.getAllPathName().length).assertEqual(0);
      st.pushPath({ name: 'a' });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(1));
      expect(st.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3017 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3018
     * @tc.name testNavStack3018
     * @tc.desc 边界值：单元素栈 pop 后回到空栈
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testNavStack3018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3018 begin');
      const st: NavPathStack = new NavPathStack();
      st.pushPath({ name: 'a' });
      const popped: NavPathInfo | undefined = st.pop(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(popped?.name), String('a'));
      expect(popped?.name).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(0));
      expect(st.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName().length), String(0));
      expect(st.getAllPathName().length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3018 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3019
     * @tc.name testNavStack3019
     * @tc.desc 边界值：getParamByIndex 越界（上溢/负数）返回 undefined
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testNavStack3019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3019 begin');
      const st: NavPathStack = new NavPathStack();
      st.pushPathByName('a', 1, false);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertUndefined', String(st.getParamByIndex(5)));
      expect(st.getParamByIndex(5)).assertUndefined();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s %{public}s', 'assertUndefined', String(st.getParamByIndex(-1)));
      expect(st.getParamByIndex(-1)).assertUndefined();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(1));
      expect(st.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3019 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3020
     * @tc.name testNavStack3020
     * @tc.desc 边界值：popToIndex 回退到栈底索引 0 仅保留首页
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testNavStack3020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3020 begin');
      const st: NavPathStack = new NavPathStack();
      st.pushPath({ name: 'a' });
      st.pushPath({ name: 'b' });
      st.pushPath({ name: 'c' });
      st.popToIndex(0, false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(1));
      expect(st.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName()[0]), String('a'));
      expect(st.getAllPathName()[0]).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName().length), String(1));
      expect(st.getAllPathName().length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3020 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3021
     * @tc.name testNavStack3021
     * @tc.desc 非法值：popToName 目标名不存在返回 -1 且不改动栈
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL0
     */
    it('testNavStack3021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3021 begin');
      const st: NavPathStack = new NavPathStack();
      st.pushPath({ name: 'a' });
      st.pushPath({ name: 'b' });
      const poppedIndex: number = st.popToName('zzz', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(poppedIndex), String(-1));
      expect(poppedIndex).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(2));
      expect(st.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName().join(',')), String('a,b'));
      expect(st.getAllPathName().join(',')).assertEqual('a,b');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3021 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3022
     * @tc.name testNavStack3022
     * @tc.desc 非法值：moveToTop 目标名不存在返回 -1 且顺序不变
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testNavStack3022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3022 begin');
      const st: NavPathStack = new NavPathStack();
      st.pushPath({ name: 'a' });
      st.pushPath({ name: 'b' });
      const movedIndex: number = st.moveToTop('zzz', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(movedIndex), String(-1));
      expect(movedIndex).assertEqual(-1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(2));
      expect(st.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName().join(',')), String('a,b'));
      expect(st.getAllPathName().join(',')).assertEqual('a,b');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3022 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3023
     * @tc.name testNavStack3023
     * @tc.desc 非法值：removeByName 目标名不存在返回 0 且栈不变
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testNavStack3023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3023 begin');
      const st: NavPathStack = new NavPathStack();
      st.pushPath({ name: 'a' });
      const removedCount: number = st.removeByName('zzz');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(removedCount), String(0));
      expect(removedCount).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(1));
      expect(st.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName()[0]), String('a'));
      expect(st.getAllPathName()[0]).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3023 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3024
     * @tc.name testNavStack3024
     * @tc.desc 非法值：getIndexByName 目标名不存在返回空数组
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testNavStack3024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3024 begin');
      const st: NavPathStack = new NavPathStack();
      st.pushPath({ name: 'a' });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getIndexByName('zzz').length), String(0));
      expect(st.getIndexByName('zzz').length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(1));
      expect(st.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName()[0]), String('a'));
      expect(st.getAllPathName()[0]).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3024 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3025
     * @tc.name testNavStack3025
     * @tc.desc 非法值：removeByIndexes 传入空索引数组返回 0 且栈不变
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testNavStack3025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3025 begin');
      const st: NavPathStack = new NavPathStack();
      st.pushPath({ name: 'a' });
      st.pushPath({ name: 'b' });
      const removedCount: number = st.removeByIndexes([]);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(removedCount), String(0));
      expect(removedCount).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(2));
      expect(st.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName().join(',')), String('a,b'));
      expect(st.getAllPathName().join(',')).assertEqual('a,b');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3025 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3026
     * @tc.name testNavStack3026
     * @tc.desc 非法值：空字符串页名可入栈并作为合法键被检索
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testNavStack3026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3026 begin');
      const st: NavPathStack = new NavPathStack();
      st.pushPath({ name: '' });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(1));
      expect(st.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName()[0]), String(''));
      expect(st.getAllPathName()[0]).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getIndexByName('').length), String(1));
      expect(st.getIndexByName('').length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3026 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3027
     * @tc.name testNavStack3027
     * @tc.desc 极值：连续入栈 50 页后大小/顺序/末位参数均正确
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testNavStack3027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3027 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 50; i++) {
        st.pushPathByName('p' + i, i, false);
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(50));
      expect(st.size()).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName().length), String(50));
      expect(st.getAllPathName().length).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName()[49]), String('p49'));
      expect(st.getAllPathName()[49]).assertEqual('p49');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3027 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3028
     * @tc.name testNavStack3028
     * @tc.desc 极值：连续 pop 至空，首个弹出为最后入栈且最终 size 0
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testNavStack3028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3028 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 20; i++) {
        st.pushPathByName('p' + i, i, false);
      }
      const first: NavPathInfo | undefined = st.pop(false);
      for (let i = 0; i < 19; i++) {
        st.pop(false);
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(first?.name), String('p19'));
      expect(first?.name).assertEqual('p19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(0));
      expect(st.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName().length), String(0));
      expect(st.getAllPathName().length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3028 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3029
     * @tc.name testNavStack3029
     * @tc.desc 极值：超长字符串参数可原样入栈并回读
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testNavStack3029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3029 begin');
      const st: NavPathStack = new NavPathStack();
      st.pushPathByName('big', BIG_PARAM, false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByName('big')[0] as string), String(BIG_PARAM));
      expect(st.getParamByName('big')[0] as string).assertEqual(BIG_PARAM);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(1));
      expect(st.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName()[0]), String('big'));
      expect(st.getAllPathName()[0]).assertEqual('big');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3029 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3030
     * @tc.name testNavStack3030
     * @tc.desc 极值：同名页连续入栈 50 次 getIndexByName 返回全部索引
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testNavStack3030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3030 begin');
      const st: NavPathStack = new NavPathStack();
      for (let i = 0; i < 50; i++) {
        st.pushPath({ name: 'a' });
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getIndexByName('a').length), String(50));
      expect(st.getIndexByName('a').length).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(50));
      expect(st.size()).assertEqual(50);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName()[0]), String('a'));
      expect(st.getAllPathName()[0]).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3030 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3031
     * @tc.name testNavStack3031
     * @tc.desc 组合值：pop 后重新 push 同名再 push 新页得到 [A B]（对齐文档复用说明）
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testNavStack3031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3031 begin');
      const st: NavPathStack = new NavPathStack();
      st.pushPath({ name: 'A' });
      st.pop(false);
      st.pushPath({ name: 'A' });
      st.pushPath({ name: 'B' });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName().join(',')), String('A,B'));
      expect(st.getAllPathName().join(',')).assertEqual('A,B');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(2));
      expect(st.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName()[1]), String('B'));
      expect(st.getAllPathName()[1]).assertEqual('B');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3031 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3032
     * @tc.name testNavStack3032
     * @tc.desc 组合值：replace + remove + clear 交错每步快照一致
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testNavStack3032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3032 begin');
      const st: NavPathStack = new NavPathStack();
      st.pushPath({ name: 'a' });
      st.pushPath({ name: 'b' });
      st.pushPath({ name: 'c' });
      st.replacePath({ name: 'd' }, false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName().join(',')), String('a,b,d'));
      expect(st.getAllPathName().join(',')).assertEqual('a,b,d');
      const removedCount: number = st.removeByName('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(removedCount), String(1));
      expect(removedCount).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName().join(',')), String('b,d'));
      expect(st.getAllPathName().join(',')).assertEqual('b,d');
      st.clear(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(0));
      expect(st.size()).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3032 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3033
     * @tc.name testNavStack3033
     * @tc.desc 组合值：同栈内 number 与 string 两类参数各自精确回读
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testNavStack3033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3033 begin');
      const st: NavPathStack = new NavPathStack();
      st.pushPathByName('n', 42, false);
      st.pushPathByName('s', 'hi', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByName('n')[0] as number), String(42));
      expect(st.getParamByName('n')[0] as number).assertEqual(42);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getParamByName('s')[0] as string), String('hi'));
      expect(st.getParamByName('s')[0] as string).assertEqual('hi');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(2));
      expect(st.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3033 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3034
     * @tc.name testNavStack3034
     * @tc.desc 状态：完整生命周期 size 迁移 0→1→2→1→0→1
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testNavStack3034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3034 begin');
      const st: NavPathStack = new NavPathStack();
      st.pushPath({ name: 'a' });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(1));
      expect(st.size()).assertEqual(1);
      st.pushPath({ name: 'b' });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(2));
      expect(st.size()).assertEqual(2);
      st.pop(false);
      st.clear(false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(0));
      expect(st.size()).assertEqual(0);
      st.pushPath({ name: 'c' });
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(1));
      expect(st.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3034 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3035
     * @tc.name testNavStack3035
     * @tc.desc 状态：重复查询 getAllPathName 稳定且不影响栈
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL2
     */
    it('testNavStack3035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3035 begin');
      const st: NavPathStack = new NavPathStack();
      st.pushPath({ name: 'a' });
      st.pushPath({ name: 'b' });
      const first: string = st.getAllPathName().join(',');
      const second: string = st.getAllPathName().join(',');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(first), String('a,b'));
      expect(first).assertEqual('a,b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(second), String('a,b'));
      expect(second).assertEqual('a,b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(2));
      expect(st.size()).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3035 end');
    });

    /**
     * @tc.number SUB_MC_NAV_3036
     * @tc.name testNavStack3036
     * @tc.desc 状态：removeByName 删除同名后再 popToName 得到预期栈底
     * @tc.type FUNCTION
     * @tc.size SMALLTEST
     * @tc.level LEVEL1
     */
    it('testNavStack3036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3036 begin');
      const st: NavPathStack = new NavPathStack();
      st.pushPath({ name: 'a' });
      st.pushPath({ name: 'b' });
      st.pushPath({ name: 'c' });
      st.pushPath({ name: 'a' });
      const removedCount: number = st.removeByName('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(removedCount), String(2));
      expect(removedCount).assertEqual(2);
      const poppedIndex: number = st.popToName('b', false);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(poppedIndex), String(0));
      expect(poppedIndex).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(st.getAllPathName()[0]), String('b'));
      expect(st.getAllPathName()[0]).assertEqual('b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(st.size()), String(1));
      expect(st.size()).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testNavStack3036 end');
    });
  });
}
