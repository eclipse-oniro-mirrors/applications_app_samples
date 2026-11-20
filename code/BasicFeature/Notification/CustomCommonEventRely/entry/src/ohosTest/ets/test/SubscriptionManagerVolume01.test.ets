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
import { SubscriptionManager } from '../../../main/ets/feature/SubscriptionManager';
import { CommonEventConstants } from '../../../main/ets/util/Constants';
import { FakeSubscriberFactory } from './util/ModelSupport';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function subscriptionManagerVolume01Test() {
  describe('SubscriptionManagerVolume01Test', () => {

    /**
     * @tc.name   testSubscriptionManager0001
     * @tc.number SUB_CCER_SUBMGR_01_0001
     * @tc.desc   全新订阅管理器初始状态为未订阅
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0001 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 401);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);

      const result: string = String(manager.isSubscribed());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getCalls() === 0));
      expect(factory.getCalls() === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0001 end');
    })

    /**
     * @tc.name   testSubscriptionManager0002
     * @tc.number SUB_CCER_SUBMGR_01_0002
     * @tc.desc   全新订阅管理器初始状态为未订阅
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0002 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('throw', 500);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);

      const result: string = String(manager.isSubscribed());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getCalls() === 0));
      expect(factory.getCalls() === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0002 end');
    })

    /**
     * @tc.name   testSubscriptionManager0003
     * @tc.number SUB_CCER_SUBMGR_01_0003
     * @tc.desc   全新订阅管理器初始状态为未订阅
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0003 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 2147483647);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);

      const result: string = String(manager.isSubscribed());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('false'));
      expect(result).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getCalls() === 0));
      expect(factory.getCalls() === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0003 end');
    })

    /**
     * @tc.name   testSubscriptionManager0004
     * @tc.number SUB_CCER_SUBMGR_01_0004
     * @tc.desc   未订阅时调用停止返回被忽略且不触碰工厂
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0004 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 401);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      const stopped: Object = manager.stop();
      const result: string = String(stopped instanceof Promise);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getCalls() === 0));
      expect(factory.getCalls() === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0004 end');
    })

    /**
     * @tc.name   testSubscriptionManager0005
     * @tc.number SUB_CCER_SUBMGR_01_0005
     * @tc.desc   未订阅时调用停止返回被忽略且不触碰工厂
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0005 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('throw', 999);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      const stopped: Object = manager.stop();
      const result: string = String(stopped instanceof Promise);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getCalls() === 0));
      expect(factory.getCalls() === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0005 end');
    })

    /**
     * @tc.name   testSubscriptionManager0006
     * @tc.number SUB_CCER_SUBMGR_01_0006
     * @tc.desc   未订阅时调用停止返回被忽略且不触碰工厂
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0006 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 0);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      const stopped: Object = manager.stop();
      const result: string = String(stopped instanceof Promise);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getCalls() === 0));
      expect(factory.getCalls() === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0006 end');
    })

    /**
     * @tc.name   testSubscriptionManager0007
     * @tc.number SUB_CCER_SUBMGR_01_0007
     * @tc.desc   未订阅时调用停止返回被忽略且不触碰工厂
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0007 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 1000000);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      const stopped: Object = manager.stop();
      const result: string = String(stopped instanceof Promise);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getCalls() === 0));
      expect(factory.getCalls() === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0007 end');
    })

    /**
     * @tc.name   testSubscriptionManager0008
     * @tc.number SUB_CCER_SUBMGR_01_0008
     * @tc.desc   未订阅时调用停止返回被忽略且不触碰工厂
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0008 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('throw', 401);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      const stopped: Object = manager.stop();
      const result: string = String(stopped instanceof Promise);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getCalls() === 0));
      expect(factory.getCalls() === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0008 end');
    })

    /**
     * @tc.name   testSubscriptionManager0009
     * @tc.number SUB_CCER_SUBMGR_01_0009
     * @tc.desc   未订阅时调用停止返回被忽略且不触碰工厂
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0009 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 2147483647);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      const stopped: Object = manager.stop();
      const result: string = String(stopped instanceof Promise);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getCalls() === 0));
      expect(factory.getCalls() === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0009 end');
    })

    /**
     * @tc.name   testSubscriptionManager0010
     * @tc.number SUB_CCER_SUBMGR_01_0010
     * @tc.desc   未订阅时调用停止返回被忽略且不触碰工厂
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0010 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 42);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      const stopped: Object = manager.stop();
      const result: string = String(stopped instanceof Promise);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getCalls() === 0));
      expect(factory.getCalls() === 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0010 end');
    })

    /**
     * @tc.name   testSubscriptionManager0011
     * @tc.number SUB_CCER_SUBMGR_01_0011
     * @tc.desc   工厂以错误码 1 拒绝时启动后保持未订阅
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0011 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 1);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      manager.start();
      const result: string = String(factory.getCalls());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(result).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(factory.getFirstEvent()), String(CommonEventConstants.EVENT_NAME));
      expect(factory.getFirstEvent()).assertEqual(CommonEventConstants.EVENT_NAME);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getEventCount() === 1));
      expect(factory.getEventCount() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0011 end');
    })

    /**
     * @tc.name   testSubscriptionManager0012
     * @tc.number SUB_CCER_SUBMGR_01_0012
     * @tc.desc   工厂以错误码 401 拒绝时启动后保持未订阅
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0012 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 401);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      manager.start();
      const result: string = String(factory.getCalls());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(result).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(factory.getFirstEvent()), String(CommonEventConstants.EVENT_NAME));
      expect(factory.getFirstEvent()).assertEqual(CommonEventConstants.EVENT_NAME);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getEventCount() === 1));
      expect(factory.getEventCount() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0012 end');
    })

    /**
     * @tc.name   testSubscriptionManager0013
     * @tc.number SUB_CCER_SUBMGR_01_0013
     * @tc.desc   工厂以错误码 999 拒绝时启动后保持未订阅
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0013 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 999);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      manager.start();
      const result: string = String(factory.getCalls());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(result).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(factory.getFirstEvent()), String(CommonEventConstants.EVENT_NAME));
      expect(factory.getFirstEvent()).assertEqual(CommonEventConstants.EVENT_NAME);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getEventCount() === 1));
      expect(factory.getEventCount() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0013 end');
    })

    /**
     * @tc.name   testSubscriptionManager0014
     * @tc.number SUB_CCER_SUBMGR_01_0014
     * @tc.desc   工厂以错误码 -1 拒绝时启动后保持未订阅
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0014 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', -1);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      manager.start();
      const result: string = String(factory.getCalls());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(result).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(factory.getFirstEvent()), String(CommonEventConstants.EVENT_NAME));
      expect(factory.getFirstEvent()).assertEqual(CommonEventConstants.EVENT_NAME);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getEventCount() === 1));
      expect(factory.getEventCount() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0014 end');
    })

    /**
     * @tc.name   testSubscriptionManager0015
     * @tc.number SUB_CCER_SUBMGR_01_0015
     * @tc.desc   工厂以错误码 0 拒绝时启动后保持未订阅
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0015 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 0);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      manager.start();
      const result: string = String(factory.getCalls());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(result).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(factory.getFirstEvent()), String(CommonEventConstants.EVENT_NAME));
      expect(factory.getFirstEvent()).assertEqual(CommonEventConstants.EVENT_NAME);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getEventCount() === 1));
      expect(factory.getEventCount() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0015 end');
    })

    /**
     * @tc.name   testSubscriptionManager0016
     * @tc.number SUB_CCER_SUBMGR_01_0016
     * @tc.desc   工厂以错误码 100 拒绝时启动后保持未订阅
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0016 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 100);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      manager.start();
      const result: string = String(factory.getCalls());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(result).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(factory.getFirstEvent()), String(CommonEventConstants.EVENT_NAME));
      expect(factory.getFirstEvent()).assertEqual(CommonEventConstants.EVENT_NAME);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getEventCount() === 1));
      expect(factory.getEventCount() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0016 end');
    })

    /**
     * @tc.name   testSubscriptionManager0017
     * @tc.number SUB_CCER_SUBMGR_01_0017
     * @tc.desc   工厂以错误码 1000000 拒绝时启动后保持未订阅
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0017 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 1000000);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      manager.start();
      const result: string = String(factory.getCalls());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(result).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(factory.getFirstEvent()), String(CommonEventConstants.EVENT_NAME));
      expect(factory.getFirstEvent()).assertEqual(CommonEventConstants.EVENT_NAME);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getEventCount() === 1));
      expect(factory.getEventCount() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0017 end');
    })

    /**
     * @tc.name   testSubscriptionManager0018
     * @tc.number SUB_CCER_SUBMGR_01_0018
     * @tc.desc   工厂以错误码 2147483647 拒绝时启动后保持未订阅
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0018 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 2147483647);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      manager.start();
      const result: string = String(factory.getCalls());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(result).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(factory.getFirstEvent()), String(CommonEventConstants.EVENT_NAME));
      expect(factory.getFirstEvent()).assertEqual(CommonEventConstants.EVENT_NAME);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getEventCount() === 1));
      expect(factory.getEventCount() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0018 end');
    })

    /**
     * @tc.name   testSubscriptionManager0019
     * @tc.number SUB_CCER_SUBMGR_01_0019
     * @tc.desc   工厂以错误码 3 拒绝时启动后保持未订阅
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0019 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 3);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      manager.start();
      const result: string = String(factory.getCalls());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(result).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(factory.getFirstEvent()), String(CommonEventConstants.EVENT_NAME));
      expect(factory.getFirstEvent()).assertEqual(CommonEventConstants.EVENT_NAME);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getEventCount() === 1));
      expect(factory.getEventCount() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0019 end');
    })

    /**
     * @tc.name   testSubscriptionManager0020
     * @tc.number SUB_CCER_SUBMGR_01_0020
     * @tc.desc   工厂以错误码 402 拒绝时启动后保持未订阅
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0020 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 402);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      manager.start();
      const result: string = String(factory.getCalls());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(result).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(factory.getFirstEvent()), String(CommonEventConstants.EVENT_NAME));
      expect(factory.getFirstEvent()).assertEqual(CommonEventConstants.EVENT_NAME);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getEventCount() === 1));
      expect(factory.getEventCount() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0020 end');
    })

    /**
     * @tc.name   testSubscriptionManager0021
     * @tc.number SUB_CCER_SUBMGR_01_0021
     * @tc.desc   工厂以错误码 500 拒绝时启动后保持未订阅
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0021 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 500);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      manager.start();
      const result: string = String(factory.getCalls());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(result).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(factory.getFirstEvent()), String(CommonEventConstants.EVENT_NAME));
      expect(factory.getFirstEvent()).assertEqual(CommonEventConstants.EVENT_NAME);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getEventCount() === 1));
      expect(factory.getEventCount() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0021 end');
    })

    /**
     * @tc.name   testSubscriptionManager0022
     * @tc.number SUB_CCER_SUBMGR_01_0022
     * @tc.desc   工厂以错误码 7 拒绝时启动后保持未订阅
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0022 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 7);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      manager.start();
      const result: string = String(factory.getCalls());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(result).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(factory.getFirstEvent()), String(CommonEventConstants.EVENT_NAME));
      expect(factory.getFirstEvent()).assertEqual(CommonEventConstants.EVENT_NAME);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getEventCount() === 1));
      expect(factory.getEventCount() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0022 end');
    })

    /**
     * @tc.name   testSubscriptionManager0023
     * @tc.number SUB_CCER_SUBMGR_01_0023
     * @tc.desc   工厂以错误码 13 拒绝时启动后保持未订阅
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0023 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 13);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      manager.start();
      const result: string = String(factory.getCalls());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(result).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(factory.getFirstEvent()), String(CommonEventConstants.EVENT_NAME));
      expect(factory.getFirstEvent()).assertEqual(CommonEventConstants.EVENT_NAME);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getEventCount() === 1));
      expect(factory.getEventCount() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0023 end');
    })

    /**
     * @tc.name   testSubscriptionManager0024
     * @tc.number SUB_CCER_SUBMGR_01_0024
     * @tc.desc   工厂以错误码 401 抛出时异常同步传播且状态不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0024 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('throw', 401);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      let caughtMsg: string = ''; try { manager.start(); } catch (error) { caughtMsg = (error as Error).message; }
      const result: string = caughtMsg;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('factory broken 401'));
      expect(result).assertEqual('factory broken 401');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getCalls() === 1));
      expect(factory.getCalls() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0024 end');
    })

    /**
     * @tc.name   testSubscriptionManager0025
     * @tc.number SUB_CCER_SUBMGR_01_0025
     * @tc.desc   工厂以错误码 500 抛出时异常同步传播且状态不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0025 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('throw', 500);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      let caughtMsg: string = ''; try { manager.start(); } catch (error) { caughtMsg = (error as Error).message; }
      const result: string = caughtMsg;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('factory broken 500'));
      expect(result).assertEqual('factory broken 500');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getCalls() === 1));
      expect(factory.getCalls() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0025 end');
    })

    /**
     * @tc.name   testSubscriptionManager0026
     * @tc.number SUB_CCER_SUBMGR_01_0026
     * @tc.desc   工厂以错误码 1 抛出时异常同步传播且状态不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0026 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('throw', 1);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      let caughtMsg: string = ''; try { manager.start(); } catch (error) { caughtMsg = (error as Error).message; }
      const result: string = caughtMsg;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('factory broken 1'));
      expect(result).assertEqual('factory broken 1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getCalls() === 1));
      expect(factory.getCalls() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0026 end');
    })

    /**
     * @tc.name   testSubscriptionManager0027
     * @tc.number SUB_CCER_SUBMGR_01_0027
     * @tc.desc   工厂以错误码 999 抛出时异常同步传播且状态不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0027 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('throw', 999);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      let caughtMsg: string = ''; try { manager.start(); } catch (error) { caughtMsg = (error as Error).message; }
      const result: string = caughtMsg;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('factory broken 999'));
      expect(result).assertEqual('factory broken 999');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getCalls() === 1));
      expect(factory.getCalls() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0027 end');
    })

    /**
     * @tc.name   testSubscriptionManager0028
     * @tc.number SUB_CCER_SUBMGR_01_0028
     * @tc.desc   工厂以错误码 404 抛出时异常同步传播且状态不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0028 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('throw', 404);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      let caughtMsg: string = ''; try { manager.start(); } catch (error) { caughtMsg = (error as Error).message; }
      const result: string = caughtMsg;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('factory broken 404'));
      expect(result).assertEqual('factory broken 404');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getCalls() === 1));
      expect(factory.getCalls() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0028 end');
    })

    /**
     * @tc.name   testSubscriptionManager0029
     * @tc.number SUB_CCER_SUBMGR_01_0029
     * @tc.desc   工厂以错误码 403 抛出时异常同步传播且状态不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0029 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('throw', 403);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      let caughtMsg: string = ''; try { manager.start(); } catch (error) { caughtMsg = (error as Error).message; }
      const result: string = caughtMsg;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('factory broken 403'));
      expect(result).assertEqual('factory broken 403');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getCalls() === 1));
      expect(factory.getCalls() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0029 end');
    })

    /**
     * @tc.name   testSubscriptionManager0030
     * @tc.number SUB_CCER_SUBMGR_01_0030
     * @tc.desc   工厂以错误码 402 抛出时异常同步传播且状态不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0030 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('throw', 402);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      let caughtMsg: string = ''; try { manager.start(); } catch (error) { caughtMsg = (error as Error).message; }
      const result: string = caughtMsg;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('factory broken 402'));
      expect(result).assertEqual('factory broken 402');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getCalls() === 1));
      expect(factory.getCalls() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0030 end');
    })

    /**
     * @tc.name   testSubscriptionManager0031
     * @tc.number SUB_CCER_SUBMGR_01_0031
     * @tc.desc   工厂以错误码 100 抛出时异常同步传播且状态不变
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0031 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('throw', 100);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      let caughtMsg: string = ''; try { manager.start(); } catch (error) { caughtMsg = (error as Error).message; }
      const result: string = caughtMsg;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(result), String('factory broken 100'));
      expect(result).assertEqual('factory broken 100');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getCalls() === 1));
      expect(factory.getCalls() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0031 end');
    })

    /**
     * @tc.name   testSubscriptionManager0032
     * @tc.number SUB_CCER_SUBMGR_01_0032
     * @tc.desc   连续两次失败启动每次都触达工厂
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0032 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 401);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      manager.start(); manager.start();
      const result: string = String(factory.getCalls());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2'));
      expect(result).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getEventCount() === 1));
      expect(factory.getEventCount() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0032 end');
    })

    /**
     * @tc.name   testSubscriptionManager0033
     * @tc.number SUB_CCER_SUBMGR_01_0033
     * @tc.desc   连续三次失败启动每次都触达工厂
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0033 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 401);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      manager.start(); manager.start(); manager.start();
      const result: string = String(factory.getCalls());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('3'));
      expect(result).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getEventCount() === 1));
      expect(factory.getEventCount() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0033 end');
    })

    /**
     * @tc.name   testSubscriptionManager0034
     * @tc.number SUB_CCER_SUBMGR_01_0034
     * @tc.desc   连续四次失败启动每次都触达工厂
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0034 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 401);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      manager.start(); manager.start(); manager.start(); manager.start();
      const result: string = String(factory.getCalls());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('4'));
      expect(result).assertEqual('4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getEventCount() === 1));
      expect(factory.getEventCount() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0034 end');
    })

    /**
     * @tc.name   testSubscriptionManager0035
     * @tc.number SUB_CCER_SUBMGR_01_0035
     * @tc.desc   连续五次失败启动每次都触达工厂
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0035 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 401);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      manager.start(); manager.start(); manager.start(); manager.start(); manager.start();
      const result: string = String(factory.getCalls());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('5'));
      expect(result).assertEqual('5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getEventCount() === 1));
      expect(factory.getEventCount() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0035 end');
    })

    /**
     * @tc.name   testSubscriptionManager0036
     * @tc.number SUB_CCER_SUBMGR_01_0036
     * @tc.desc   抛出型工厂两次启动中第二次在第一次抛出后仍被触达
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0036 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('throw', 401);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      let firstCaught: boolean = false;
      try {
        manager.start();
      } catch (error) {
        firstCaught = true;
      }
      let secondCaught: boolean = false;
      try {
        manager.start();
      } catch (error) {
        secondCaught = true;
      }
      const result: string = String(factory.getCalls());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2'));
      expect(result).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(firstCaught && secondCaught));
      expect(firstCaught && secondCaught).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0036 end');
    })

    /**
     * @tc.name   testSubscriptionManager0037
     * @tc.number SUB_CCER_SUBMGR_01_0037
     * @tc.desc   失败启动后调用停止返回忽略态且不重复触达工厂
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0037 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 401);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      manager.start(); const stopped: Object = manager.stop();
      const result: string = String(stopped instanceof Promise);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(result).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getCalls() === 1));
      expect(factory.getCalls() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0037 end');
    })

    /**
     * @tc.name   testSubscriptionManager0038
     * @tc.number SUB_CCER_SUBMGR_01_0038
     * @tc.desc   失败启动与忽略停止交替后再次启动重新触达工厂
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0038 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 401);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      manager.start(); manager.stop(); manager.start();
      const result: string = String(factory.getCalls());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2'));
      expect(result).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(factory.getFirstEvent()), String(CommonEventConstants.EVENT_NAME));
      expect(factory.getFirstEvent()).assertEqual(CommonEventConstants.EVENT_NAME);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0038 end');
    })

    /**
     * @tc.name   testSubscriptionManager0039
     * @tc.number SUB_CCER_SUBMGR_01_0039
     * @tc.desc   失败启动后连续两次停止均不重复触达工厂
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0039 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 401);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      manager.start(); manager.stop(); const stoppedAgain: Object = manager.stop();
      const result: string = String(factory.getCalls());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(result).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(stoppedAgain instanceof Promise));
      expect(stoppedAgain instanceof Promise).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0039 end');
    })

    /**
     * @tc.name   testSubscriptionManager0040
     * @tc.number SUB_CCER_SUBMGR_01_0040
     * @tc.desc   两次启动与两次停止交错时工厂恰好触达两次
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0040 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 999);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      manager.start(); manager.stop(); manager.start(); manager.stop();
      const result: string = String(factory.getCalls());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2'));
      expect(result).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(factory.getEventCount() === 1));
      expect(factory.getEventCount() === 1).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0040 end');
    })

    /**
     * @tc.name   testSubscriptionManager0041
     * @tc.number SUB_CCER_SUBMGR_01_0041
     * @tc.desc   启动失败停止忽略再启动的完整序列保持未订阅
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSubscriptionManager0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0041 begin');
      const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 401);
      const manager: SubscriptionManager = new SubscriptionManager((): void => {}, factory);
      const first: Object = manager.start(); const stopped: Object = manager.stop();
        const second: Object = manager.start();
      const result: string = String(factory.getCalls());
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2'));
      expect(result).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(manager.isSubscribed() === false));
      expect(manager.isSubscribed() === false).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(factory.getFirstEvent()), String(CommonEventConstants.EVENT_NAME));
      expect(factory.getFirstEvent()).assertEqual(CommonEventConstants.EVENT_NAME);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSubscriptionManager0041 end');
    })

  })
}
