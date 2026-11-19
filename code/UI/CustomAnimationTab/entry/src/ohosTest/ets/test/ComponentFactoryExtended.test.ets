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
import { TabInfo, ComponentFactory, TabBarItemInterface } from '../../../main/ets/bridge/CustomAnimationTabBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'ComponentFactoryExtTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

@Builder
function factoryExtContent($$: ESObject) {
  Column() {
    Text('factoryExtContent')
  }
}

@Builder
function factoryExtBar($$: TabBarItemInterface) {
  Column() {
    Text(String($$.index))
  }
}

const EXT_CONTENT: WrappedBuilder<[ESObject]> = wrapBuilder(factoryExtContent);
const EXT_BAR: WrappedBuilder<[TabBarItemInterface]> = wrapBuilder(factoryExtBar);

function makeExtTabInfo(title: string, params: ESObject = undefined): TabInfo {
  return new TabInfo(title, EXT_CONTENT, EXT_BAR, params);
}

export default function componentFactoryExtendedTest(): void {
  describe('ComponentFactoryExtendedTest', () => {
    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0237
     * @tc.name      testComponentFactory0237
     * @tc.desc      Verify five registrations keep list order and length.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0237 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('全部', makeExtTabInfo('全部'));
      factory.set('UI布局', makeExtTabInfo('UI布局'));
      factory.set('动效', makeExtTabInfo('动效'));
      factory.set('三方库', makeExtTabInfo('三方库'));
      factory.set('其它', makeExtTabInfo('其它'));
      const titles: string[] = factory.toArray();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual titles.length=${titles.length}, expected=5`);
      expect(titles.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual titles[0]=${titles[0]}, expected='全部'`);
      expect(titles[0]).assertEqual('全部');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual titles[4]=${titles[4]}, expected='其它'`);
      expect(titles[4]).assertEqual('其它');
      log('testComponentFactory0237 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0238
     * @tc.name      testComponentFactory0238
     * @tc.desc      Verify four sample-scoped Chinese names register correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0238 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('标题1', makeExtTabInfo('标题1'));
      factory.set('标题2', makeExtTabInfo('标题2'));
      factory.set('标题3', makeExtTabInfo('标题3'));
      factory.set('标题4', makeExtTabInfo('标题4'));
      const titles: string[] = factory.toArray();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual titles.length=${titles.length}, expected=4`);
      expect(titles.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertContain titles=${titles}, expected='标题3'`);
      expect(titles).assertContain('标题3');
      log('testComponentFactory0238 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0239
     * @tc.name      testComponentFactory0239
     * @tc.desc      Verify getContent resolves a Chinese name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0239 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('动效', makeExtTabInfo('动效'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual factory.getContent('动效')=${factory.getContent('动效')}`);
      expect(factory.getContent('动效')).assertEqual(EXT_CONTENT);
      log('testComponentFactory0239 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0240
     * @tc.name      testComponentFactory0240
     * @tc.desc      Verify re-set after delete installs the new object.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0240 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('全部', makeExtTabInfo('全部', 'old'));
      factory.delete('全部');
      factory.set('全部', makeExtTabInfo('全部', 'new'));
      const titles: string[] = factory.toArray();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual titles.length=${titles.length}, expected=1`);
      expect(titles.length).assertEqual(1);
      const params: ESObject = factory.getParams('全部');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual params=${params}, expected='new'`);
      expect(params).assertEqual('new');
      log('testComponentFactory0240 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0241
     * @tc.name      testComponentFactory0241
     * @tc.desc      Verify deleting a middle key keeps the remaining names.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0241 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('A', makeExtTabInfo('A'));
      factory.set('B', makeExtTabInfo('B'));
      factory.set('C', makeExtTabInfo('C'));
      factory.delete('B');
      const titles: string[] = factory.toArray();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual titles.length=${titles.length}, expected=2`);
      expect(titles.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertContain titles=${titles}, expected='A'`);
      expect(titles).assertContain('A');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertContain titles=${titles}, expected='C'`);
      expect(titles).assertContain('C');
      let hasB: boolean = false;
      titles.forEach((value: string) => {
        if (value === 'B') {
          hasB = true;
        }
      });
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse hasB=${hasB}`);
      expect(hasB).assertFalse();
      log('testComponentFactory0241 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0242
     * @tc.name      testComponentFactory0242
     * @tc.desc      Verify deleting the same key twice stays harmless.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0242 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('A', makeExtTabInfo('A'));
      factory.delete('A');
      factory.delete('A');
      const titles: string[] = factory.toArray();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual titles.length=${titles.length}, expected=0`);
      expect(titles.length).assertEqual(0);
      log('testComponentFactory0242 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0243
     * @tc.name      testComponentFactory0243
     * @tc.desc      Verify a nested-record param round-trips through getParams.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0243 begin');
      const factory: ComponentFactory = new ComponentFactory();
      const nested: Record<string, Record<string, number>> = { 'inner': { 'key': 9 } };
      factory.set('全部', makeExtTabInfo('全部', nested));
      const params: ESObject = factory.getParams('全部');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual params=${params}, expected=nested`);
      expect(params).assertEqual(nested);
      log('testComponentFactory0243 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0244
     * @tc.name      testComponentFactory0244
     * @tc.desc      Verify an array param round-trips through getParams.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0244 begin');
      const factory: ComponentFactory = new ComponentFactory();
      const arr: number[] = [7, 8, 9];
      factory.set('全部', makeExtTabInfo('全部', arr));
      const params: ESObject = factory.getParams('全部');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual params=${params}, expected=arr`);
      expect(params).assertEqual(arr);
      log('testComponentFactory0244 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0245
     * @tc.name      testComponentFactory0245
     * @tc.desc      Verify a boolean param round-trips through getParams.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0245 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('全部', makeExtTabInfo('全部', false));
      const params: ESObject = factory.getParams('全部');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual params=${params}, expected=false`);
      expect(params).assertEqual(false);
      log('testComponentFactory0245 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0246
     * @tc.name      testComponentFactory0246
     * @tc.desc      Verify a zero-number param is not treated as missing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0246 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('全部', makeExtTabInfo('全部', 0));
      const params: ESObject = factory.getParams('全部');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual params=${params}, expected=0`);
      expect(params).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse params === undefined=${params === undefined}`);
      expect(params === undefined).assertFalse();
      log('testComponentFactory0246 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0247
     * @tc.name      testComponentFactory0247
     * @tc.desc      Verify overriding a name refreshes getBar output.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0247 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('全部', makeExtTabInfo('全部'));
      factory.set('全部', new TabInfo('全部', EXT_CONTENT));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${factory.getBar('全部') === undefined}`);
      expect(factory.getBar('全部') === undefined).assertTrue();
      log('testComponentFactory0247 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0248
     * @tc.name      testComponentFactory0248
     * @tc.desc      Verify overriding a name keeps the original insertion order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0248 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('A', makeExtTabInfo('A'));
      factory.set('B', makeExtTabInfo('B'));
      factory.set('A', makeExtTabInfo('A2'));
      const titles: string[] = factory.toArray();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual titles.length=${titles.length}, expected=2`);
      expect(titles.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual titles[0]=${titles[0]}, expected='A'`);
      expect(titles[0]).assertEqual('A');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual titles[1]=${titles[1]}, expected='B'`);
      expect(titles[1]).assertEqual('B');
      log('testComponentFactory0248 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0249
     * @tc.name      testComponentFactory0249
     * @tc.desc      Verify delete on one factory does not touch another.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0249 begin');
      const first: ComponentFactory = new ComponentFactory();
      const second: ComponentFactory = new ComponentFactory();
      first.set('A', makeExtTabInfo('A'));
      second.set('A', makeExtTabInfo('A'));
      first.delete('A');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.toArray().length=${first.toArray().length}, expected=0`);
      expect(first.toArray().length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.toArray().length=${second.toArray().length}`);
      expect(second.toArray().length).assertEqual(1);
      log('testComponentFactory0249 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0250
     * @tc.name      testComponentFactory0250
     * @tc.desc      Verify names with surrounding spaces are distinct keys.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0250 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set(' a ', makeExtTabInfo('a'));
      factory.set('a', makeExtTabInfo('a'));
      const titles: string[] = factory.toArray();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual titles.length=${titles.length}, expected=2`);
      expect(titles.length).assertEqual(2);
      log('testComponentFactory0250 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0251
     * @tc.name      testComponentFactory0251
     * @tc.desc      Verify an empty-string name lookup is undefined when absent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0251 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('A', makeExtTabInfo('A'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${factory.getContent('') === undefined}`);
      expect(factory.getContent('') === undefined).assertTrue();
      log('testComponentFactory0251 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0252
     * @tc.name      testComponentFactory0252
     * @tc.desc      Verify ten registrations produce a ten-entry list.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0252 begin');
      const factory: ComponentFactory = new ComponentFactory();
      for (let i: number = 0; i < 10; i++) {
        factory.set(`key${i}`, makeExtTabInfo(`title${i}`));
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual factory.toArray().length=${factory.toArray().length}`);
      expect(factory.toArray().length).assertEqual(10);
      log('testComponentFactory0252 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0253
     * @tc.name      testComponentFactory0253
     * @tc.desc      Verify deleting five of ten keys halves the list.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0253 begin');
      const factory: ComponentFactory = new ComponentFactory();
      for (let i: number = 0; i < 10; i++) {
        factory.set(`key${i}`, makeExtTabInfo(`title${i}`));
      }
      for (let i: number = 0; i < 5; i++) {
        factory.delete(`key${i}`);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual factory.toArray().length=${factory.toArray().length}`);
      expect(factory.toArray().length).assertEqual(5);
      log('testComponentFactory0253 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0254
     * @tc.name      testComponentFactory0254
     * @tc.desc      Verify re-adding a deleted name restores list size.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0254 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('A', makeExtTabInfo('A'));
      factory.set('B', makeExtTabInfo('B'));
      factory.delete('A');
      factory.set('A', makeExtTabInfo('A3'));
      const titles: string[] = factory.toArray();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual titles.length=${titles.length}, expected=2`);
      expect(titles.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertContain titles=${titles}, expected='A'`);
      expect(titles).assertContain('A');
      log('testComponentFactory0254 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0255
     * @tc.name      testComponentFactory0255
     * @tc.desc      Verify getParams matches the stored TabInfo params.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0255 begin');
      const factory: ComponentFactory = new ComponentFactory();
      const info: TabInfo = makeExtTabInfo('全部', 123);
      factory.set('全部', info);
      const params: ESObject = factory.getParams('全部');
      const infoParams: ESObject = info.params;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual params=${params}, expected=infoParams`);
      expect(params).assertEqual(infoParams);
      log('testComponentFactory0255 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0256
     * @tc.name      testComponentFactory0256
     * @tc.desc      Verify getContent returns an object-typed builder.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0256 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('全部', makeExtTabInfo('全部'));
      const content: WrappedBuilder<[ESObject]> | undefined = factory.getContent('全部');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse content === undefined=${content === undefined}`);
      expect(content === undefined).assertFalse();
      log('testComponentFactory0256 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0257
     * @tc.name      testComponentFactory0257
     * @tc.desc      Verify five-element list keeps exact element positions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0257 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('k1', makeExtTabInfo('t1'));
      factory.set('k2', makeExtTabInfo('t2'));
      factory.set('k3', makeExtTabInfo('t3'));
      factory.set('k4', makeExtTabInfo('t4'));
      factory.set('k5', makeExtTabInfo('t5'));
      const titles: string[] = factory.toArray();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual titles[0]=${titles[0]}, expected='k1'`);
      expect(titles[0]).assertEqual('k1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual titles[1]=${titles[1]}, expected='k2'`);
      expect(titles[1]).assertEqual('k2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual titles[2]=${titles[2]}, expected='k3'`);
      expect(titles[2]).assertEqual('k3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual titles[3]=${titles[3]}, expected='k4'`);
      expect(titles[3]).assertEqual('k4');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual titles[4]=${titles[4]}, expected='k5'`);
      expect(titles[4]).assertEqual('k5');
      log('testComponentFactory0257 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0258
     * @tc.name      testComponentFactory0258
     * @tc.desc      Verify one TabInfo stored under two names shares content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0258 begin');
      const factory: ComponentFactory = new ComponentFactory();
      const shared: TabInfo = makeExtTabInfo('全部');
      factory.set('A', shared);
      factory.set('B', shared);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual factory.getContent('A')=${factory.getContent('A')}`);
      expect(factory.getContent('A')).assertEqual(factory.getContent('B'));
      log('testComponentFactory0258 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0259
     * @tc.name      testComponentFactory0259
     * @tc.desc      Verify mutating TabInfo title does not rename the key.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0259 begin');
      const factory: ComponentFactory = new ComponentFactory();
      const info: TabInfo = makeExtTabInfo('全部');
      factory.set('全部', info);
      info.title = 'renamed';
      const titles: string[] = factory.toArray();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual titles.length=${titles.length}, expected=1`);
      expect(titles.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual titles[0]=${titles[0]}, expected='全部'`);
      expect(titles[0]).assertEqual('全部');
      log('testComponentFactory0259 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0260
     * @tc.name      testComponentFactory0260
     * @tc.desc      Verify key name and TabInfo title can differ.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0260 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('keyA', makeExtTabInfo('titleB'));
      const titles: string[] = factory.toArray();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual titles[0]=${titles[0]}, expected='keyA'`);
      expect(titles[0]).assertEqual('keyA');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${factory.getParams('keyA') === undefined}`);
      expect(factory.getParams('keyA') === undefined).assertTrue();
      log('testComponentFactory0260 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0261
     * @tc.name      testComponentFactory0261
     * @tc.desc      Verify empty-string and normal names coexist as keys.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0261 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('', makeExtTabInfo('empty'));
      factory.set('normal', makeExtTabInfo('normal'));
      const titles: string[] = factory.toArray();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual titles.length=${titles.length}, expected=2`);
      expect(titles.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${factory.getContent('') === undefined}`);
      expect(factory.getContent('') === undefined).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${factory.getContent('normal') === undefined}`);
      expect(factory.getContent('normal') === undefined).assertFalse();
      log('testComponentFactory0261 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0262
     * @tc.name      testComponentFactory0262
     * @tc.desc      Verify deleting the empty-string key removes only it.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0262 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('', makeExtTabInfo('empty'));
      factory.set('normal', makeExtTabInfo('normal'));
      factory.delete('');
      const titles: string[] = factory.toArray();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual titles.length=${titles.length}, expected=1`);
      expect(titles.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual titles[0]=${titles[0]}, expected='normal'`);
      expect(titles[0]).assertEqual('normal');
      log('testComponentFactory0262 end');
    })
  })
}
