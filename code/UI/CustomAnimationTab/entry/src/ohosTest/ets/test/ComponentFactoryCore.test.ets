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
const TAG: string = 'ComponentFactoryCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

@Builder
function factoryTestContent($$: ESObject) {
  Column() {
    Text('factoryTestContent')
  }
}

@Builder
function factoryTestBar($$: TabBarItemInterface) {
  Column() {
    Text(String($$.index))
  }
}

const FACTORY_CONTENT: WrappedBuilder<[ESObject]> = wrapBuilder(factoryTestContent);
const FACTORY_BAR: WrappedBuilder<[TabBarItemInterface]> = wrapBuilder(factoryTestBar);

function makeTabInfo(title: string, params: ESObject = undefined): TabInfo {
  return new TabInfo(title, FACTORY_CONTENT, FACTORY_BAR, params);
}

export default function componentFactoryCoreTest(): void {
  describe('ComponentFactoryCoreTest', () => {
    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0201
     * @tc.name      testComponentFactory0201
     * @tc.desc      Verify a new factory exposes an empty title list.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0201 begin');
      const factory: ComponentFactory = new ComponentFactory();
      const titles: string[] = factory.toArray();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual titles.length=${titles.length}, expected=0`);
      expect(titles.length).assertEqual(0);
      log('testComponentFactory0201 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0202
     * @tc.name      testComponentFactory0202
     * @tc.desc      Verify getContent returns undefined for unknown name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0202 begin');
      const factory: ComponentFactory = new ComponentFactory();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${factory.getContent('unknown') === undefined}`);
      expect(factory.getContent('unknown') === undefined).assertTrue();
      log('testComponentFactory0202 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0203
     * @tc.name      testComponentFactory0203
     * @tc.desc      Verify getBar returns undefined for unknown name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0203 begin');
      const factory: ComponentFactory = new ComponentFactory();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${factory.getBar('unknown') === undefined}`);
      expect(factory.getBar('unknown') === undefined).assertTrue();
      log('testComponentFactory0203 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0204
     * @tc.name      testComponentFactory0204
     * @tc.desc      Verify getParams returns undefined for unknown name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0204 begin');
      const factory: ComponentFactory = new ComponentFactory();
      const params: ESObject = factory.getParams('unknown');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue params === undefined=${params === undefined}`);
      expect(params === undefined).assertTrue();
      log('testComponentFactory0204 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0205
     * @tc.name      testComponentFactory0205
     * @tc.desc      Verify one registration produces one title.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0205 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('全部', makeTabInfo('全部'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual factory.toArray().length=${factory.toArray().length}`);
      expect(factory.toArray().length).assertEqual(1);
      log('testComponentFactory0205 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0206
     * @tc.name      testComponentFactory0206
     * @tc.desc      Verify toArray contains the registered name.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0206 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('全部', makeTabInfo('全部'));
      const titles: string[] = factory.toArray();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual titles[0]=${titles[0]}, expected='全部'`);
      expect(titles[0]).assertEqual('全部');
      log('testComponentFactory0206 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0207
     * @tc.name      testComponentFactory0207
     * @tc.desc      Verify getContent returns the registered content builder.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0207 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('全部', makeTabInfo('全部'));
      const content: WrappedBuilder<[ESObject]> | undefined = factory.getContent('全部');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual content=${content}, expected=FACTORY_CONTENT`);
      expect(content).assertEqual(FACTORY_CONTENT);
      log('testComponentFactory0207 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0208
     * @tc.name      testComponentFactory0208
     * @tc.desc      Verify getBar returns the registered bar builder.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0208 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('全部', makeTabInfo('全部'));
      const bar: WrappedBuilder<[TabBarItemInterface]> | undefined = factory.getBar('全部');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bar=${bar}, expected=FACTORY_BAR`);
      expect(bar).assertEqual(FACTORY_BAR);
      log('testComponentFactory0208 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0209
     * @tc.name      testComponentFactory0209
     * @tc.desc      Verify getParams returns the registered params value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0209 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('全部', makeTabInfo('全部', 5));
      const params: ESObject = factory.getParams('全部');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual params=${params}, expected=5`);
      expect(params).assertEqual(5);
      log('testComponentFactory0209 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0210
     * @tc.name      testComponentFactory0210
     * @tc.desc      Verify two registrations produce two titles.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0210 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('全部', makeTabInfo('全部'));
      factory.set('动效', makeTabInfo('动效'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual factory.toArray().length=${factory.toArray().length}`);
      expect(factory.toArray().length).assertEqual(2);
      log('testComponentFactory0210 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0211
     * @tc.name      testComponentFactory0211
     * @tc.desc      Verify toArray preserves insertion order for two keys.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0211 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('全部', makeTabInfo('全部'));
      factory.set('动效', makeTabInfo('动效'));
      const titles: string[] = factory.toArray();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual titles[0]=${titles[0]}, expected='全部'`);
      expect(titles[0]).assertEqual('全部');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual titles[1]=${titles[1]}, expected='动效'`);
      expect(titles[1]).assertEqual('动效');
      log('testComponentFactory0211 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0212
     * @tc.name      testComponentFactory0212
     * @tc.desc      Verify three registrations produce three titles.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0212 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('全部', makeTabInfo('全部'));
      factory.set('动效', makeTabInfo('动效'));
      factory.set('其它', makeTabInfo('其它'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual factory.toArray().length=${factory.toArray().length}`);
      expect(factory.toArray().length).assertEqual(3);
      log('testComponentFactory0212 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0213
     * @tc.name      testComponentFactory0213
     * @tc.desc      Verify same-name set overwrites without adding a title.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0213 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('全部', makeTabInfo('全部'));
      factory.set('全部', makeTabInfo('覆盖'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual factory.toArray().length=${factory.toArray().length}`);
      expect(factory.toArray().length).assertEqual(1);
      log('testComponentFactory0213 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0214
     * @tc.name      testComponentFactory0214
     * @tc.desc      Verify overwritten name resolves to the new builder.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0214 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('全部', makeTabInfo('全部'));
      const replaced: TabInfo = new TabInfo('覆盖', FACTORY_BAR);
      factory.set('全部', replaced);
      const content: WrappedBuilder<[ESObject]> | undefined = factory.getContent('全部');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual content=${content}, expected=FACTORY_BAR`);
      expect(content).assertEqual(FACTORY_BAR);
      log('testComponentFactory0214 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0215
     * @tc.name      testComponentFactory0215
     * @tc.desc      Verify overwritten name resolves to the new params.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0215 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('全部', makeTabInfo('全部', 1));
      factory.set('全部', makeTabInfo('全部', 2));
      const params: ESObject = factory.getParams('全部');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual params=${params}, expected=2`);
      expect(params).assertEqual(2);
      log('testComponentFactory0215 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0216
     * @tc.name      testComponentFactory0216
     * @tc.desc      Verify deleted name no longer resolves content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0216 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('全部', makeTabInfo('全部'));
      factory.delete('全部');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${factory.getContent('全部') === undefined}`);
      expect(factory.getContent('全部') === undefined).assertTrue();
      log('testComponentFactory0216 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0217
     * @tc.name      testComponentFactory0217
     * @tc.desc      Verify delete shrinks the title list by one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0217 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('全部', makeTabInfo('全部'));
      factory.set('动效', makeTabInfo('动效'));
      factory.delete('全部');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual factory.toArray().length=${factory.toArray().length}`);
      expect(factory.toArray().length).assertEqual(1);
      log('testComponentFactory0217 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0218
     * @tc.name      testComponentFactory0218
     * @tc.desc      Verify deleted name is absent from the title list.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0218 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('全部', makeTabInfo('全部'));
      factory.set('动效', makeTabInfo('动效'));
      factory.delete('全部');
      const titles: string[] = factory.toArray();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual titles[0]=${titles[0]}, expected='动效'`);
      expect(titles[0]).assertEqual('动效');
      log('testComponentFactory0218 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0219
     * @tc.name      testComponentFactory0219
     * @tc.desc      Verify other registrations survive a delete.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0219 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('全部', makeTabInfo('全部'));
      factory.set('动效', makeTabInfo('动效'));
      factory.delete('全部');
      const content: WrappedBuilder<[ESObject]> | undefined = factory.getContent('动效');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual content=${content}, expected=FACTORY_CONTENT`);
      expect(content).assertEqual(FACTORY_CONTENT);
      log('testComponentFactory0219 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0220
     * @tc.name      testComponentFactory0220
     * @tc.desc      Verify deleting an unknown name keeps the title list.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0220 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('全部', makeTabInfo('全部'));
      factory.delete('unknown');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual factory.toArray().length=${factory.toArray().length}`);
      expect(factory.toArray().length).assertEqual(1);
      log('testComponentFactory0220 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0221
     * @tc.name      testComponentFactory0221
     * @tc.desc      Verify deleting an unknown name keeps existing content.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0221 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('全部', makeTabInfo('全部'));
      factory.delete('unknown');
      const content: WrappedBuilder<[ESObject]> | undefined = factory.getContent('全部');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual content=${content}, expected=FACTORY_CONTENT`);
      expect(content).assertEqual(FACTORY_CONTENT);
      log('testComponentFactory0221 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0222
     * @tc.name      testComponentFactory0222
     * @tc.desc      Verify a deleted name can be re-registered.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0222 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('全部', makeTabInfo('全部'));
      factory.delete('全部');
      factory.set('全部', makeTabInfo('重新注册', 9));
      const params: ESObject = factory.getParams('全部');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual params=${params}, expected=9`);
      expect(params).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual factory.toArray().length=${factory.toArray().length}`);
      expect(factory.toArray().length).assertEqual(1);
      log('testComponentFactory0222 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0223
     * @tc.name      testComponentFactory0223
     * @tc.desc      Verify deleting every key empties the title list.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0223 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('全部', makeTabInfo('全部'));
      factory.set('动效', makeTabInfo('动效'));
      factory.delete('全部');
      factory.delete('动效');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual factory.toArray().length=${factory.toArray().length}`);
      expect(factory.toArray().length).assertEqual(0);
      log('testComponentFactory0223 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0224
     * @tc.name      testComponentFactory0224
     * @tc.desc      Verify repeated deletes on the same key are safe no-ops.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0224 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('全部', makeTabInfo('全部'));
      factory.delete('全部');
      factory.delete('全部');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual factory.toArray().length=${factory.toArray().length}`);
      expect(factory.toArray().length).assertEqual(0);
      log('testComponentFactory0224 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0225
     * @tc.name      testComponentFactory0225
     * @tc.desc      Verify an empty-string name can round-trip through set/get.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0225 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('', makeTabInfo('空键'));
      const content: WrappedBuilder<[ESObject]> | undefined = factory.getContent('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual content=${content}, expected=FACTORY_CONTENT`);
      expect(content).assertEqual(FACTORY_CONTENT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual factory.toArray().length=${factory.toArray().length}`);
      expect(factory.toArray().length).assertEqual(1);
      log('testComponentFactory0225 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0226
     * @tc.name      testComponentFactory0226
     * @tc.desc      Verify a unicode name can round-trip through set/get.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0226 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('🎉动效✨', makeTabInfo('unicode'));
      const params: ESObject = factory.getParams('🎉动效✨');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue params === undefined=${params === undefined}`);
      expect(params === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual factory.toArray()[0]=${factory.toArray()[0]}`);
      expect(factory.toArray()[0]).assertEqual('🎉动效✨');
      log('testComponentFactory0226 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0227
     * @tc.name      testComponentFactory0227
     * @tc.desc      Verify a long name can round-trip through set/get.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0227 begin');
      const factory: ComponentFactory = new ComponentFactory();
      const longName: string = 'k'.repeat(256);
      factory.set(longName, makeTabInfo('long'));
      const content: WrappedBuilder<[ESObject]> | undefined = factory.getContent(longName);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual content=${content}, expected=FACTORY_CONTENT`);
      expect(content).assertEqual(FACTORY_CONTENT);
      log('testComponentFactory0227 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0228
     * @tc.name      testComponentFactory0228
     * @tc.desc      Verify a numeric-string name can round-trip.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0228 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('001', makeTabInfo('numeric'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual factory.toArray()[0]=${factory.toArray()[0]}, expected='001'`);
      expect(factory.toArray()[0]).assertEqual('001');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${factory.getContent('001') === undefined}`);
      expect(factory.getContent('001') === undefined).assertFalse();
      log('testComponentFactory0228 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0229
     * @tc.name      testComponentFactory0229
     * @tc.desc      Verify two factory instances are independent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0229 begin');
      const first: ComponentFactory = new ComponentFactory();
      const second: ComponentFactory = new ComponentFactory();
      first.set('全部', makeTabInfo('全部'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.toArray().length=${first.toArray().length}, expected=1`);
      expect(first.toArray().length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.toArray().length=${second.toArray().length}`);
      expect(second.toArray().length).assertEqual(0);
      log('testComponentFactory0229 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0230
     * @tc.name      testComponentFactory0230
     * @tc.desc      Verify factory instances pass an instanceof check.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0230 begin');
      const factory: ComponentFactory = new ComponentFactory();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${factory instanceof ComponentFactory}`);
      expect(factory instanceof ComponentFactory).assertTrue();
      log('testComponentFactory0230 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0231
     * @tc.name      testComponentFactory0231
     * @tc.desc      Verify getParams preserves the number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0231 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('全部', makeTabInfo('全部', 100));
      const params: ESObject = factory.getParams('全部');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof params=${typeof params}, expected='number'`);
      expect(typeof params).assertEqual('number');
      log('testComponentFactory0231 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0232
     * @tc.name      testComponentFactory0232
     * @tc.desc      Verify getParams preserves the string type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0232 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('全部', makeTabInfo('全部', 'str'));
      const params: ESObject = factory.getParams('全部');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof params=${typeof params}, expected='string'`);
      expect(typeof params).assertEqual('string');
      log('testComponentFactory0232 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0233
     * @tc.name      testComponentFactory0233
     * @tc.desc      Verify getParams returns the same object reference.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0233 begin');
      const factory: ComponentFactory = new ComponentFactory();
      const paramObj: Record<string, number> = { 'a': 1 };
      factory.set('全部', makeTabInfo('全部', paramObj));
      const params: ESObject = factory.getParams('全部');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual params=${params}, expected=paramObj`);
      expect(params).assertEqual(paramObj);
      log('testComponentFactory0233 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0234
     * @tc.name      testComponentFactory0234
     * @tc.desc      Verify getBar returns undefined when barBuilder omitted.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0234 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('全部', new TabInfo('全部', FACTORY_CONTENT));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${factory.getBar('全部') === undefined}`);
      expect(factory.getBar('全部') === undefined).assertTrue();
      log('testComponentFactory0234 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0235
     * @tc.name      testComponentFactory0235
     * @tc.desc      Verify toArray returns string-typed elements.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0235 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('全部', makeTabInfo('全部'));
      const titles: string[] = factory.toArray();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof titles[0]=${typeof titles[0]}, expected='string'`);
      expect(typeof titles[0]).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue titles instanceof Array=${titles instanceof Array}`);
      expect(titles instanceof Array).assertTrue();
      log('testComponentFactory0235 end');
    })

    /**
     * @tc.number    SUB_CUSTOM_ANIMATION_TAB_COMPONENTFACTORY_0236
     * @tc.name      testComponentFactory0236
     * @tc.desc      Verify querying a second name after registering the first.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testComponentFactory0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testComponentFactory0236 begin');
      const factory: ComponentFactory = new ComponentFactory();
      factory.set('全部', makeTabInfo('全部'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${factory.getContent('动效') === undefined}`);
      expect(factory.getContent('动效') === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${factory.getBar('动效') === undefined}`);
      expect(factory.getBar('动效') === undefined).assertTrue();
      const params: ESObject = factory.getParams('动效');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue params === undefined=${params === undefined}`);
      expect(params === undefined).assertTrue();
      log('testComponentFactory0236 end');
    })
  })
}
