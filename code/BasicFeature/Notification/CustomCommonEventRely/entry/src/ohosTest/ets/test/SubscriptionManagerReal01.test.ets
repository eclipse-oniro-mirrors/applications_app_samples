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
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { SubscriptionManager } from '../../../main/ets/feature/SubscriptionManager';
import { CommonEventConstants } from '../../../main/ets/util/Constants';
import { FakeSubscriberFactory } from './util/ModelSupport';
import { logBegin, logEnd, logPair } from '../util/TestHelper';

function noopListener(error: BusinessError, event: commonEventManager.CommonEventData): void {
}

/**
 * Verifies the subscription manager on the awaited promise paths of the fake factory.
 */
export default function subscriptionManagerReal01Test() {
    describe('SubscriptionManagerReal01Test', () => {
        /**
         * @tc.number    SUB_CCER_SUBMGRREAL_0001
         * @tc.name      testSubscriptionManagerReal0001
         * @tc.desc      拒绝工厂下完整启动停止巡回全程保持未订阅
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testSubscriptionManagerReal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testSubscriptionManagerReal0001';
            logBegin(caseName);
            const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 401);
            const manager: SubscriptionManager = new SubscriptionManager(noopListener, factory);
            const firstStart: boolean = await manager.start();
            logPair(caseName, 'first start', firstStart.toString(), 'false');
            expect(firstStart).assertFalse();
            logPair(caseName, 'still unsubscribed', manager.isSubscribed().toString(), 'false');
            expect(manager.isSubscribed()).assertFalse();
            const firstStop: boolean = await manager.stop();
            logPair(caseName, 'stop before subscribed', firstStop.toString(), 'false');
            expect(firstStop).assertFalse();
            const secondStart: boolean = await manager.start();
            logPair(caseName, 'second start', secondStart.toString(), 'false');
            expect(secondStart).assertFalse();
            const secondStop: boolean = await manager.stop();
            logPair(caseName, 'final stop', secondStop.toString(), 'false');
            expect(secondStop).assertFalse();
            logPair(caseName, 'factory calls', factory.getCalls().toString(), '2');
            expect(factory.getCalls()).assertEqual(2);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_SUBMGRREAL_0002
         * @tc.name      testSubscriptionManagerReal0002
         * @tc.desc      异步等待拒绝启动返回假且订阅事件列表保持契约
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testSubscriptionManagerReal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testSubscriptionManagerReal0002';
            logBegin(caseName);
            const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 401);
            const manager: SubscriptionManager = new SubscriptionManager(noopListener, factory);
            const started: boolean = await manager.start();
            logPair(caseName, 'started', started.toString(), 'false');
            expect(started).assertFalse();
            logPair(caseName, 'subscribed', manager.isSubscribed().toString(), 'false');
            expect(manager.isSubscribed()).assertFalse();
            logPair(caseName, 'requested event', factory.getFirstEvent(), CommonEventConstants.EVENT_NAME);
            expect(factory.getFirstEvent()).assertEqual(CommonEventConstants.EVENT_NAME);
            logPair(caseName, 'event count', factory.getEventCount().toString(), '1');
            expect(factory.getEventCount()).assertEqual(1);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_SUBMGRREAL_0003
         * @tc.name      testSubscriptionManagerReal0003
         * @tc.desc      同步抛错的工厂经等待后异常原样传播且状态保持未订阅
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testSubscriptionManagerReal0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testSubscriptionManagerReal0003';
            logBegin(caseName);
            const factory: FakeSubscriberFactory = new FakeSubscriberFactory('throw', 401);
            const manager: SubscriptionManager = new SubscriptionManager(noopListener, factory);
            let caughtMessage: string = '';
            try {
                await manager.start();
            } catch (error) {
                caughtMessage = (error as Error).message;
            }
            logPair(caseName, 'caught message', caughtMessage, 'factory broken 401');
            expect(caughtMessage).assertEqual('factory broken 401');
            logPair(caseName, 'subscribed', manager.isSubscribed().toString(), 'false');
            expect(manager.isSubscribed()).assertFalse();
            logPair(caseName, 'factory calls', factory.getCalls().toString(), '1');
            expect(factory.getCalls()).assertEqual(1);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_SUBMGRREAL_0004
         * @tc.name      testSubscriptionManagerReal0004
         * @tc.desc      未激活时停止的守卫路径异步等待返回假且不触达工厂
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testSubscriptionManagerReal0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testSubscriptionManagerReal0004';
            logBegin(caseName);
            const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 401);
            const manager: SubscriptionManager = new SubscriptionManager(noopListener, factory);
            const stopped: boolean = await manager.stop();
            logPair(caseName, 'stopped', stopped.toString(), 'false');
            expect(stopped).assertFalse();
            logPair(caseName, 'factory untouched', factory.getCalls().toString(), '0');
            expect(factory.getCalls()).assertEqual(0);
            logPair(caseName, 'subscribed', manager.isSubscribed().toString(), 'false');
            expect(manager.isSubscribed()).assertFalse();
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_SUBMGRREAL_0005
         * @tc.name      testSubscriptionManagerReal0005
         * @tc.desc      连续三次失败启动逐次返回假且工厂计数递增
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testSubscriptionManagerReal0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testSubscriptionManagerReal0005';
            logBegin(caseName);
            const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 401);
            const manager: SubscriptionManager = new SubscriptionManager(noopListener, factory);
            const results: boolean[] = [];
            for (let index: number = 0; index < 3; index++) {
                results.push(await manager.start());
            }
            logPair(caseName, 'all rejected', String(results[0] === false && results[1] === false &&
                results[2] === false), 'true');
            expect(results[0]).assertFalse();
            expect(results[1]).assertFalse();
            expect(results[2]).assertFalse();
            logPair(caseName, 'factory calls', factory.getCalls().toString(), '3');
            expect(factory.getCalls()).assertEqual(3);
            logPair(caseName, 'subscribed', manager.isSubscribed().toString(), 'false');
            expect(manager.isSubscribed()).assertFalse();
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_SUBMGRREAL_0006
         * @tc.name      testSubscriptionManagerReal0006
         * @tc.desc      同步抛错工厂两次启动异常逐次原样传播且互不吞并
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testSubscriptionManagerReal0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testSubscriptionManagerReal0006';
            logBegin(caseName);
            const factory: FakeSubscriberFactory = new FakeSubscriberFactory('throw', 401);
            const manager: SubscriptionManager = new SubscriptionManager(noopListener, factory);
            const messages: string[] = [];
            for (let index: number = 0; index < 2; index++) {
                try {
                    await manager.start();
                } catch (error) {
                    messages.push((error as Error).message);
                }
            }
            logPair(caseName, 'first message', messages[0], 'factory broken 401');
            expect(messages[0]).assertEqual('factory broken 401');
            logPair(caseName, 'second message', messages[1], 'factory broken 401');
            expect(messages[1]).assertEqual('factory broken 401');
            logPair(caseName, 'factory calls', factory.getCalls().toString(), '2');
            expect(factory.getCalls()).assertEqual(2);
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_SUBMGRREAL_0007
         * @tc.name      testSubscriptionManagerReal0007
         * @tc.desc      失败启动停止守卫再失败启动的组合序列保持可重试
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testSubscriptionManagerReal0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testSubscriptionManagerReal0007';
            logBegin(caseName);
            const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 401);
            const manager: SubscriptionManager = new SubscriptionManager(noopListener, factory);
            const firstStart: boolean = await manager.start();
            const guardStop: boolean = await manager.stop();
            const secondStart: boolean = await manager.start();
            logPair(caseName, 'first start', firstStart.toString(), 'false');
            expect(firstStart).assertFalse();
            logPair(caseName, 'guard stop', guardStop.toString(), 'false');
            expect(guardStop).assertFalse();
            logPair(caseName, 'second start', secondStart.toString(), 'false');
            expect(secondStart).assertFalse();
            logPair(caseName, 'factory calls', factory.getCalls().toString(), '2');
            expect(factory.getCalls()).assertEqual(2);
            logPair(caseName, 'still unsubscribed', manager.isSubscribed().toString(), 'false');
            expect(manager.isSubscribed()).assertFalse();
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_SUBMGRREAL_0008
         * @tc.name      testSubscriptionManagerReal0008
         * @tc.desc      不同错误码的拒绝路径行为一致且状态互不串台
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testSubscriptionManagerReal0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testSubscriptionManagerReal0008';
            logBegin(caseName);
            const firstFactory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 999);
            const first: SubscriptionManager = new SubscriptionManager(noopListener, firstFactory);
            const secondFactory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 7);
            const second: SubscriptionManager = new SubscriptionManager(noopListener, secondFactory);
            const firstStarted: boolean = await first.start();
            const secondStarted: boolean = await second.start();
            logPair(caseName, 'first started', firstStarted.toString(), 'false');
            expect(firstStarted).assertFalse();
            logPair(caseName, 'second started', secondStarted.toString(), 'false');
            expect(secondStarted).assertFalse();
            logPair(caseName, 'first subscribed', first.isSubscribed().toString(), 'false');
            expect(first.isSubscribed()).assertFalse();
            logPair(caseName, 'second subscribed', second.isSubscribed().toString(), 'false');
            expect(second.isSubscribed()).assertFalse();
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_SUBMGRREAL_0009
         * @tc.name      testSubscriptionManagerReal0009
         * @tc.desc      两个管理器各配独立工厂失败后计数与事件互不干扰
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testSubscriptionManagerReal0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testSubscriptionManagerReal0009';
            logBegin(caseName);
            const firstFactory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 401);
            const first: SubscriptionManager = new SubscriptionManager(noopListener, firstFactory);
            const secondFactory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 402);
            const second: SubscriptionManager = new SubscriptionManager(noopListener, secondFactory);
            await first.start();
            await second.start();
            await second.start();
            logPair(caseName, 'first factory calls', firstFactory.getCalls().toString(), '1');
            expect(firstFactory.getCalls()).assertEqual(1);
            logPair(caseName, 'second factory calls', secondFactory.getCalls().toString(), '2');
            expect(secondFactory.getCalls()).assertEqual(2);
            logPair(caseName, 'both events',
                String(firstFactory.getFirstEvent() === secondFactory.getFirstEvent()), 'true');
            expect(firstFactory.getFirstEvent() === secondFactory.getFirstEvent()).assertTrue();
            logEnd(caseName);
        })

        /**
         * @tc.number    SUB_CCER_SUBMGRREAL_0010
         * @tc.name      testSubscriptionManagerReal0010
         * @tc.desc      启动调用返回真实 Promise 且等待后按拒绝路径落定为假
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level1
         */
        it('testSubscriptionManagerReal0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const caseName: string = 'testSubscriptionManagerReal0010';
            logBegin(caseName);
            const factory: FakeSubscriberFactory = new FakeSubscriberFactory('reject', 401);
            const manager: SubscriptionManager = new SubscriptionManager(noopListener, factory);
            const pending: Promise<boolean> = manager.start();
            logPair(caseName, 'is promise', String(pending instanceof Promise), 'true');
            expect(pending instanceof Promise).assertTrue();
            const settled: boolean = await pending;
            logPair(caseName, 'settled', settled.toString(), 'false');
            expect(settled).assertFalse();
            logPair(caseName, 'subscribed', manager.isSubscribed().toString(), 'false');
            expect(manager.isSubscribed()).assertFalse();
            logEnd(caseName);
        })
    })
}
